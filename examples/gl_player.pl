#!/usr/bin/env perl
# usage: gl_player.pl path_to_file.ogg
use strict;
use warnings;
use feature qw(say state switch);
use AnyEvent; # EV backend is good
use Ogg::LibOgg ':all';
use OpenGL ':all';
use OpenGL::Shader;
use Ogg::Theora::LibTheora ':all';
use IO::File;

my $stash = ogg_stream($ARGV[0], sub { # create stream from file path and pass callback on each frame
    glutPostRedisplay() if glutGetWindow();
    glutMainLoopEvent();
});

gl_context(sub { # create gl context and pass drawing callback sub
    state $sh = shader();
    glEnable(GL_TEXTURE_2D);
    $sh->Enable;
    map { 
        glActiveTextureARB((GL_TEXTURE0_ARB) + $_);
        glBindTexture(GL_TEXTURE_2D, $stash->{planes}->[$_]->[2]);
        glBindBufferARB(GL_PIXEL_UNPACK_BUFFER_ARB, $stash->{planes}->[$_]->[1]);
        glPixelStorei(GL_UNPACK_ROW_LENGTH, $stash->{info}->[$_]->{stride});
        glPixelStorei(GL_UNPACK_SKIP_PIXELS, $stash->{video}->{pic_x});
        glPixelStorei(GL_UNPACK_SKIP_ROWS, $stash->{video}->{pic_y});
        glTexImage2D_c(GL_TEXTURE_2D, 0, 1, 
             $stash->{info}->[$_]->{width} - $stash->{video}->{pic_x}, 
             $stash->{info}->[$_]->{height} - $stash->{video}->{pic_y}, 
             0, GL_LUMINANCE, GL_UNSIGNED_BYTE, 0
        );
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
        glUniform1iARB($sh->Map("p$_"), $_);
    } 0..2; if (my $er = glGetError()) { say $er };
    glScaled(4, 4 * $stash->{video}->{pic_height} / $stash->{video}->{pic_width}, 1);
    glTranslatef(-0.5,-0.5,-5);
    glBegin(GL_QUADS);
    glMultiTexCoord2fARB(GL_TEXTURE0_ARB, 0, 1); glVertex3f(0, 0, 0);
    glMultiTexCoord2fARB(GL_TEXTURE0_ARB, 0, 0); glVertex3f(0, 1, 0);
    glMultiTexCoord2fARB(GL_TEXTURE0_ARB, 1, 0); glVertex3f(1, 1, 0);
    glMultiTexCoord2fARB(GL_TEXTURE0_ARB, 1, 1); glVertex3f(1, 0, 0);
    glEnd();
    $sh->Disable;
    glDisable(GL_TEXTURE_2D)
});

my $cond = AE::cv;
say 'press <q> to quit and <w> to toggle window/fullscreen mode';
$cond->recv; # start event loop

sub ogg_stream {
    my $fh = IO::File->new(shift || '../t/theora.ogg', 'r') || die $!.' - provide file name to play';
    my $draw_cb = shift;
    my $stream = {};
    ogg_sync_init(my $oy = make_ogg_sync_state());
    ogg_read_page($fh, $oy, my $og = make_ogg_page());
    ogg_stream_init(my $os = make_ogg_stream_state(), ogg_page_serialno($og));
    ogg_stream_pagein($os, $og);
    th_comment_init(my $th_comment = make_th_comment());
    th_info_init(my $th_info = make_th_info());
    my ($th_setup_info_addr, $gpos, $ret) = (0, 0);
    th_packet_isheader(my $op = make_ogg_packet());
    th_packet_iskeyframe($op);
    state $read_ogg_packet = sub { while (ogg_stream_packetout($os, $op) == 0) {
        return unless defined ogg_read_page($fh, $oy, $og);
        ogg_stream_pagein($os, $og);
    }};
    do {
        ($ret, $th_setup_info_addr) = th_decode_headerin($th_info, $th_comment, $th_setup_info_addr, $op);
        $read_ogg_packet->() if $ret != 0;
    } while ($ret != 0);
    $stream->{video} = get_th_info($th_info);
    my $th_dec_ctx = th_decode_alloc($th_info, $th_setup_info_addr);
    th_setup_free($th_setup_info_addr);
    $stream->{watch} = AE::timer(0, 1/25, sub {
        state $gpos = 0;
        ($ret, $gpos) = th_decode_packetin($th_dec_ctx, $op, $gpos);
        do {
            th_decode_free($th_dec_ctx);
            th_info_clear($th_info);
            delete $stream->{watch};
        } if $ret; # stream stopped
        th_decode_ycbcr_out($th_dec_ctx, state $th_ycbcr_buffer = make_th_ycbcr_buffer());
        state $i = $stream->{info} = get_th_ycbcr_buffer_info($th_ycbcr_buffer);
        state $arr = $stream->{planes} = [ map {
            my $ar = OpenGL::Array->new_pointer(GL_UNSIGNED_BYTE, $i->[$_]->{data}, $i->[$_]->{stride} * $i->[$_]->{height});
            glBindBufferARB(GL_PIXEL_UNPACK_BUFFER_ARB, my $buf = glGenBuffersARB_p(1));
            glBufferDataARB_p(GL_PIXEL_UNPACK_BUFFER_ARB, $ar, GL_DYNAMIC_DRAW_ARB);
            [$ar, $buf, glGenTextures_p(1)];
        } 0..2 ];
        map {
            $arr->[$_]->[0]->update_pointer(get_th_ycbcr_buffer_ptr($th_ycbcr_buffer, $_));
            glBindBufferARB(GL_PIXEL_UNPACK_BUFFER_ARB, $arr->[$_]->[1]);
            glBufferSubDataARB_p(GL_PIXEL_UNPACK_BUFFER_ARB, 0, $arr->[$_]->[0]);
        } 0..2;
        $draw_cb->();
        $read_ogg_packet->();
    });
    $stream;
}

sub gl_context { # opengl boiler plate
    my $draw_callback = shift;
    my $c = { # window config
        n => 'opengl glsl theora player demo', # window name
        w => 800, # width
        h => 600, # height
        a => 60, # view angle
        np => 1, # near plane
        nf => 15, # far plane
    };
    
    glutInit();
    glutInitWindowSize($c->{w}, $c->{h});
    glutInitWindowPosition((glutGet(GLUT_SCREEN_WIDTH) - $c->{w}) / 2, (glutGet(GLUT_SCREEN_HEIGHT) - $c->{h}) / 2);
    glutInitDisplayMode(GLUT_RGBA|GLUT_DOUBLE);
    glutSetWindow(glutCreateWindow($c->{n}));
    glutSetCursor(GLUT_CURSOR_NONE);

    glutReshapeFunc(sub {
        glViewport(0,0, glutGet(GLUT_WINDOW_WIDTH), glutGet(GLUT_WINDOW_HEIGHT));
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluPerspective($c->{a}, glutGet(GLUT_WINDOW_WIDTH)/glutGet(GLUT_WINDOW_HEIGHT), $c->{np}, $c->{nf});
        glMatrixMode(GL_MODELVIEW);
    });
    glutDisplayFunc(sub {
        glClear(GL_COLOR_BUFFER_BIT);
        glClearColor(0, 0, 0, 0);
        glLoadIdentity();
        $draw_callback->();
        glutSwapBuffers();
    });
    glutKeyboardFunc(sub {
        my ($code) = @_;
        state $fullscreen = 0;
        given (chr($code)) {
            when ('q') { term() }
            when ('w') {
                $fullscreen = $fullscreen
                    ? do { 
                        glutReshapeWindow($c->{w}, $c->{h}); 
                        glutPositionWindow((glutGet(GLUT_SCREEN_WIDTH) - $c->{w}) / 2, (glutGet(GLUT_SCREEN_HEIGHT) - $c->{h}) / 2); 
                        0 
                    } 
                    : do { glutFullScreen(); 1 }
                }
        }
    });
}

sub term {
    glutKeyboardFunc(0);
    glutReshapeFunc(0);
    glutDestroyWindow(glutGetWindow());
    $cond->send;
}

sub shader {
    my $sh = OpenGL::Shader->new('GLSL');
    $sh->Load(# fragment shader
'
uniform sampler2D p0,p1,p2;

void main (void) {
  vec3 yuv = vec3(
                  texture2D(p0, gl_TexCoord[0].xy).r,
                  texture2D(p1, gl_TexCoord[0].xy).r,
                  texture2D(p2, gl_TexCoord[0].xy).r
                  ) - vec3(0,0.5,0.5);
  gl_FragColor = vec4(
                      clamp(yuv.x + (1.1402 * yuv.z), 0., 1.),
                      clamp(yuv.x - (0.34414 * yuv.y) - (0.71414 * yuv.z), 0., 1.),
                      clamp(yuv.x + (1.772 * yuv.y), 0., 1.),
                      1
                      );
}
' , # vert shader
'
void main(void) {
  gl_Position  = ftransform();
  gl_TexCoord[0]  = gl_MultiTexCoord0;
}
');
    $sh;
}
