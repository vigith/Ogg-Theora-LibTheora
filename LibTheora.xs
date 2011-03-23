#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <ogg/ogg.h>
#include <theora/codec.h>
#include <theora/theora.h>
#include <theora/theoraenc.h>
#include <theora/theoradec.h>

#include "const-c.inc"

MODULE = Ogg::Theora::LibTheora		PACKAGE = Ogg::Theora::LibTheora	PREFIX = LibTheora_		

INCLUDE: const-xs.inc

PROTOTYPES: DISABLE

=head1 NAME

Ogg::Theora::LibTheora - Perl bindings for Theora Encoder and Decoder

=cut

=head1 Functions (malloc)

L<http://www.theora.org/doc/libtheora-1.0/annotated.html>

=cut

=head1 make_th_info

Creates a memory allocation for th_info.

-Input:
  Void

-Output:
  Memory Pointer

=cut
th_info *
LibTheora_make_th_info()
  PREINIT:
    th_info *memory;
  CODE:
    New(0, memory, 1, th_info);
    RETVAL = memory;
  OUTPUT:
    RETVAL  


=head1 make_th_huff_code

Creates a memory allocation for th_huff_code.

-Input:
  void

-Output:
  Memory Pointer

=cut
th_huff_code *
LibTheora_make_th_huff_code()
  PREINIT:
    th_huff_code *memory;
  CODE:
    New(0, memory, 1, th_huff_code);
    RETVAL = memory;
  OUTPUT:
    RETVAL


=head1 make_th_img_plane

Creates a memory allocation for th_img_plane.

-Input:
  void

-Output:
  Memory Pointer

=cut
th_img_plane *
LibTheora_make_th_img_plane()
  PREINIT:
    th_img_plane *memory;
  CODE:
    New(0, memory, 1, th_img_plane);
    RETVAL = memory;
  OUTPUT:
    RETVAL


=head1 make_th_quant_info

Creates a memory allocation for th_quant_info.

-Input:
  void

-Output:
  Memory Pointer

=cut
th_quant_info *
LibTheora_make_th_quant_info()
  PREINIT:
    th_quant_info *memory;
  CODE:
    New(0, memory, 1, th_quant_info);
    RETVAL = memory;
  OUTPUT:
    RETVAL


=head1 make_th_quant_ranges

Creates a memory allocation for th_quant_ranges.

-Input:
  void

-Output:
  Memory Pointer

=cut
th_quant_ranges *
LibTheora_make_th_quant_ranges()
  PREINIT:
    th_quant_ranges *memory;
  CODE:
    New(0, memory, 1, th_quant_ranges);
    RETVAL = memory;
  OUTPUT:
    RETVAL


=head1 make_th_stripe_callback

Creates a memory allocation for th_stripe_callback.

-Input:
  void

-Output:
  Memory Pointer

=cut
th_stripe_callback *
LibTheora_make_th_stripe_callback()
  PREINIT:
    th_stripe_callback *memory;
  CODE:
    New(0, memory, 1, th_stripe_callback);
    RETVAL = memory;
  OUTPUT:
    RETVAL


=head1 make_th_ycbcr_buffer

Creates a memory allocation for th_ycbcr_buffer.

-Input:
  void

-Output:
  Memory Pointer

=cut
th_ycbcr_buffer *
LibTheora_make_th_ycbcr_buffer()
  PREINIT:
    th_ycbcr_buffer *memory;
  CODE:
    New(0, memory, 1, th_ycbcr_buffer);
    RETVAL = memory;
  OUTPUT:
    RETVAL


=head1 make_th_comment

Creates a memory allocation for th_comment.

-Input:
  void

-Output:
  Memory Pointer

=cut
th_comment *
LibTheora_make_th_comment()
  PREINIT:
    th_comment *memory;
  CODE:
    New(0, memory, 1, th_comment);
    RETVAL = memory;
  OUTPUT:
    RETVAL


=head1 Functions (Basic shared functions)

L<http://www.theora.org/doc/libtheora-1.0/group__basefuncs.html>

=cut

=head1 th_version_number

Retrieves the library version number. 

-Input:
  void

-Output:
  ogg_uint32_t (IV)

=cut
ogg_uint32_t
LibTheora_th_version_number()
  PREINIT:
    ogg_uint32_t version;
  CODE:
    version = th_version_number();
    RETVAL = version;
  OUTPUT:
    RETVAL


=head1 th_version_string

Retrieves a human-readable string to identify the library vendor and version. 

-Input:
  void

-Output:
  const char * (T_PV)

=cut
const char *
LibTheora_th_version_string()
  PREINIT:
    const char *version;
  CODE:
    version = th_version_string();
    RETVAL = version;
  OUTPUT:
    RETVAL


=head1 th_packet_isheader

Determines whether a Theora packet is a header or not. 

-Input:
  _op 	An ogg_packet containing encoded Theora data. 

-Output:
  1 packet is a header packet,
  0 packet is a video data packet. 

=cut
int
LibTheora_th_packet_isheader(_op)
    ogg_packet *	_op
  CODE:
    RETVAL = th_packet_isheader(_op);
  OUTPUT:
    RETVAL


=head1 th_granule_frame

Converts a granule position to an absolute frame index, starting at 0. 

-Input:
  void * _encdec (previously allocated th_enc_ctx or th_dec_ctx handle),
  ogg_int64_t _granpos (granule position to convert).

-Output:
  absolute frame index corresponding to _granpos,
  -1 on error.

=cut
int
LibTheora_th_granule_frame(_encdec, _granpos)
    void *	   _encdec
    ogg_int64_t	   _granpos
  CODE:
    RETVAL = th_granule_frame(_encdec, _granpos);
  OUTPUT:
    RETVAL


=head1 th_granule_time

Converts a granule position to an absolute time in seconds. 

-Input:
  void * _encdec (previously allocated th_enc_ctx or th_dec_ctx handle),
  ogg_int64_t _granpos (granule position to convert).

-Output:
  absolute time in seconds corresponding to _granpos,
  -1 on error.

=cut
double
LibTheora_th_granule_time(_encdec, _granpos)
    void *	   _encdec
    ogg_int64_t	   _granpos
  CODE:
    RETVAL = th_granule_time(_encdec, _granpos);
  OUTPUT:
    RETVAL


=head1 th_packet_iskeyframe

Determines whether a theora packet is a key frame or not. 

-Input:
  _op 	An ogg_packet containing encoded Theora data. 

-Output:
   1 packet is a key frame,
   0 packet is a delta frame,
  -1 packet is not a video data packet. 

=cut
int
LibTheora_th_packet_iskeyframe(_op)
    ogg_packet *	_op
  CODE:
    RETVAL = th_packet_iskeyframe(_op);
  OUTPUT:
    RETVAL



=head1 Functions (Manipulating Header Data)

=cut

=head1 th_comment_init

Initialize a th_comment structure. 

-Input:
  th_comment *

-Output:
  void

=cut
void
LibTheora_th_comment_init(_tc)
    th_comment *	_tc
  CODE:
    th_comment_init(_tc);


=head1 th_info_init

Initializes a th_info structure. 

-Input:
  th_info

-Output:
  void

=cut
void
LibTheora_th_info_init(_info)
    th_info *		_info
  CODE:
    th_info_init(_info);


=head1 th_info_clear

Clears a th_info structure. 

-Input:
  th_info

-Output:
  void

=cut
void
LibTheora_th_info_clear(_info)
    th_info *		_info
  CODE:
    th_info_clear(_info);


=head1 th_comment_add

Add a comment to an initialized th_comment structure. 

-Input:
  th_comment,
  char * (null-terminated UTF-8 string containing the comment in "TAG=the value" form).

-Output:
  void

=cut
void
LibTheora_th_comment_add(_tc, _comment)
    th_comment *	 _tc
    char *     		 _comment
  CODE:
    int i;
    th_comment_add(_tc, _comment);


=head1 th_comment_add_tag

Add a comment to an initialized th_comment structure. 

-Input:
  th_comment,
  char * (null-terminated string containing the tag associated with the comment),
  char * (corresponding value as a null-terminated string).

=cut
void
LibTheora_th_comment_add_tag(_tc, _tag, _val)
    th_comment *	_tc
    char *     		_tag
    char *		_val
  CODE:
    th_comment_add_tag(_tc, _tag, _val);

=head1 th_comment_query_count

Look up the number of instances of a tag.

-Input:
  th_comment,
  char * (tag to look up).

-Output:
  int (number on instances of this particular tag)

=cut
int
LibTheora_th_comment_query_count(_tc, _tag)
    th_comment *	_tc
    char *     		_tag
  CODE:
    RETVAL = th_comment_query_count(_tc, _tag);
  OUTPUT:
    RETVAL

=head1 th_comment_query

Look up a comment value by its tag. 

-Input:
  th_comment,
  char * (tag to look-up)
  int (instance of the tag, it starts from 0)

-Output:
  char * if matched pointer to the queried tag's value,
  NULL if no matching tag is found

=cut
char *
LibTheora_th_comment_query(_tc, _tag, _count)
    th_comment *	_tc
    char *     		_tag
    int	 		_count
  CODE:
    RETVAL = th_comment_query(_tc, _tag, _count);
  OUTPUT:
    RETVAL


=head1 Functions (For Decoding)

L<http://www.theora.org/doc/libtheora-1.0/group__decfuncs.html>

=cut

=head1 th_decode_headerin

Decodes the header packets of a Theora stream. 

-Input:
  th_info,
  th_comment,
  th_setup_info, (initialized to NULL on the first call & returned value be passed on subsequent calls)
  ogg_packet

-Output:
  0 first video data packet was encountered after all required header packets were parsed,
  TH_EFAULT if one of _info, _tc, or _setup was NULL,
  TH_EBADHEADER _op was NULL,
  TH_EVERSION not decodable with current libtheoradec version,
  TH_ENOTFORMAT not a Theora header

=cut
void
LibTheora_th_decode_headerin(_info, _tc, _setup_addr, _op)
    th_info *		_info
    th_comment *	_tc
    int      		_setup_addr
    ogg_packet *  	_op
  PREINIT:
    int status;
    th_setup_info *_setup;
  PPCODE:
    _setup = (th_setup_info *) _setup_addr;
    status = th_decode_headerin(_info, _tc, &_setup, _op);
    XPUSHs(sv_2mortal(newSViv(status)));
    XPUSHs(sv_2mortal(newSViv((unsigned int) _setup)));


=head1 th_decode_alloc

Allocates a decoder instance. 

-Input:
  th_info,
  th_setup_info

-Output:
  th_dec_ctx

=cut
th_dec_ctx *
LibTheora_th_decode_alloc(_info, _setup)
    th_info *		_info
    int	    		_setup
  CODE:
    RETVAL = th_decode_alloc(_info, (th_setup_info *) _setup);
  OUTPUT:
    RETVAL
    

=head1 th_setup_free

Releases all storage used for the decoder setup information.

-Input:
  th_setup_info

-Output:
  void

=cut
void
LibTheora_th_setup_free(_setup)
    int		_setup
  CODE:
    th_setup_free((th_setup_info *) _setup);


=head1 th_decode_packetin

Submits a packet containing encoded video data to the decoder. 

-Input:
  th_dec_ctx,
  ogg_packet,
  ogg_int64_t gran_pos, returns the granule position of the decoded packet

-Output:
  0 success,
  TH_DUPFRAME packet represented a dropped (0-byte) frame,
  TH_EFAULT _dec or _op was NULL,
  TH_EBADPACKET _op does not contain encoded video data,
  TH_EIMPL video data uses bitstream features which this library does not support.

=cut
void
LibTheora_th_decode_packetin(_dec, _op, _granpos)
    th_dec_ctx *	_dec
    ogg_packet *	_op
    unsigned int	_granpos
  PREINIT:
    int status;
  PPCODE:
    status = th_decode_packetin(_dec, _op, (ogg_int64_t *) &_granpos);
    XPUSHs(sv_2mortal(newSViv(status)));
    XPUSHs(sv_2mortal(newSViv((unsigned int) _granpos)));
 

=head1 th_decode_ycbcr_out

Outputs the next available frame of decoded Y'CbCr data. 

-Input:
  th_dec_ctx,
  th_ycbcr_buffer (video buffer structure to fill in)

-Output:
  0 Success

=cut
int
LibTheora_th_decode_ycbcr_out(_dec, _ycbcr)
    th_dec_ctx *	_dec
    th_ycbcr_buffer *	_ycbcr
  CODE:
    RETVAL = th_decode_ycbcr_out(_dec, *_ycbcr);
  OUTPUT:
    RETVAL


=head1 th_decode_free

Frees an allocated decoder instance. 

-Input:
  th_dec_ctx

-Output:
  void

=cut
void
LibTheora_th_decode_free(_dec)
    th_dec_ctx *	_dec
  CODE:
    th_decode_free(_dec);


=head1 th_decode_ctl

Decoder control function. (i haven't tested this)

-Input:
  th_dec_ctx,
  int _req (control code to process),
  void * _buf (parameters for this control code),
  size_t _buf_sz (size of the parameter buffer)

-Output:
  int (not documented)

=cut
int
LibTheora_th_decode_ctl(_dec, _req, _buf, _buf_sz)
    th_dec_ctx *	_dec
    int	       		_req
    void *		_buf
    size_t		_buf_sz
  CODE:
    RETVAL = th_decode_ctl(_dec, _req, _buf, _buf_sz);
  OUTPUT:
    RETVAL



=head1 Function (for Encoding)

L<http://www.theora.org/doc/libtheora-1.0/group__encfuncs.html>

=cut


=head1 th_encode_alloc

Allocates an encoder instance.

-Input:
  th_info.

-Output:
  th_enc_ctx handle,
  NULL (if the encoding parameters were invalid).

=cut
th_enc_ctx *
LibTheora_th_encode_alloc(_info)
    th_info *		_info
  CODE:
    RETVAL = th_encode_alloc(_info);
  OUTPUT:
    RETVAL


=head1 th_encode_flushheader

-Input:
  th_enc_ctx,
  th_comment,
  ogg_packet.

-Output:
  > 1 (indicates that a header packet was successfully produced),
  0 (no packet was produced, and no more header packets remain),
  TH_EFAULT (_enc, _comments, or _op was NULL).

=cut
int
LibTheora_th_encode_flushheader(_enc, _comments, _op)
    th_enc_ctx *	_enc
    th_comment *	_comments
    ogg_packet *	_op
  CODE:
    RETVAL = th_encode_flushheader(_enc, _comments, _op);
  OUTPUT:
    RETVAL


=head1 Miscellaneous Functions 

These functions are not found in libtheora*, but is written by the XS author
to simplify few tasks.

=cut

=head1 get_th_info

Returns a HashRef with th_info struct values.

-Input:
  th_info

-Output:
  HashRef

=cut
HV *
LibTheora_get_th_info(_info)
    th_info *		_info
  PREINIT:
    HV * hash;
  CODE:
    hash = newHV();
    sv_2mortal((SV *)hash);	/* convert the HASH to a mortal */
    hv_store(hash, "frame_width", strlen("frame_width"), newSVnv(_info->frame_width), 0);
    hv_store(hash, "frame_height", strlen("frame_height"), newSVnv(_info->frame_height), 0);
    hv_store(hash, "pic_width", strlen("pic_width"), newSVnv(_info->pic_width), 0);
    hv_store(hash, "pic_height", strlen("pic_height"), newSVnv(_info->pic_height), 0);
    hv_store(hash, "pic_x", strlen("pic_x"), newSVnv(_info->pic_x), 0);
    hv_store(hash, "pic_y", strlen("pic_y"), newSVnv(_info->pic_y), 0);
    hv_store(hash, "colorspace", strlen("colorspace"), newSVnv(_info->colorspace), 0);
    hv_store(hash, "pixel_fmt", strlen("pixel_fmt"), newSVnv(_info->pixel_fmt), 0);
    hv_store(hash, "target_bitrate", strlen("target_bitrate"), newSVnv(_info->target_bitrate), 0);
    hv_store(hash, "quality", strlen("quality"), newSVnv(_info->quality), 0);
    hv_store(hash, "version_major", strlen("version_major"), newSVnv(_info->version_major), 0);
    hv_store(hash, "version_minor", strlen("version_minor"), newSVnv(_info->version_minor), 0);
    hv_store(hash, "version_subminor", strlen("version_subminor"), newSVnv(_info->version_subminor), 0);
    hv_store(hash, "fps_numerator", strlen("fps_numerator"), newSVnv(_info->fps_numerator), 0);
    hv_store(hash, "fps_denominator", strlen("fps_denominator"), newSVnv(_info->fps_denominator), 0);
    hv_store(hash, "aspect_numerator", strlen("aspect_numerator"), newSVnv(_info->aspect_numerator), 0);
    hv_store(hash, "aspect_denominator", strlen("aspect_denominator"), newSVnv(_info->aspect_denominator), 0);
    hv_store(hash, "keyframe_granule_shift", strlen("keyframe_granule_shift"), newSVnv(_info->keyframe_granule_shift), 0);
    
    RETVAL = hash;
  OUTPUT:
    RETVAL


=head1 ycbcr_to_rgb_buffer

reads the data from the ycbcr buffer and converts to its equivalent
rgb buffer. (this is NOT an optimized code, there will be better ycbcr
to rgb convertors, some intel gpu processors have mnemonic that does
the conversion)

-Input:
   th_ycbcr_buffer

-Output:
  RGB string

=cut
SV *
LibTheora_ycbcr_to_rgb_buffer(_ycbcr)
    th_ycbcr_buffer *	_ycbcr;
  PREINIT:
    th_ycbcr_buffer buffer;
    char *rgb;
    long size, size1, size2, size3;
    int i, i2, j, j2;
    long pos, pos1, pos2;
    int Y, U, V;
    int R, G, B;
  CODE:
    memcpy(buffer,_ycbcr, sizeof(buffer));
    size1 = buffer[0].width * buffer[0].height;
    size2 = buffer[1].width * buffer[1].height;
    size3 = buffer[2].width * buffer[2].height;
    size = size1*3;
    // this way, i don't have to worry about free'ing
    RETVAL = newSV(size); // returns a pointer of type (SV *)
    SvPOK_on(RETVAL); 
    // SvPV_nolen returns the pointer to array in RETVAL
    rgb = (char *)SvPV_nolen(RETVAL); 
    // rgb == SvPV(RETVAL, size), i was curious :-)
    for(i=0;i<buffer[0].height;i++) {
      for(j=0;j<buffer[0].width;j++) {
        i2 = (int) i/2;
        j2 = (int) j/2;
        pos = i*buffer[0].stride +j;
        pos1 = i2*buffer[1].stride + j2;
        pos2 = i2*buffer[2].stride + j2;
        Y = (int) buffer[0].data[pos];
        U = (int) buffer[1].data[pos1];
        V = (int) buffer[2].data[pos2];
        Y = Y - 128 - 16;
        U = U - 128;
        V = V - 128;

        R = Y + 1.140*V;
        G = Y - 0.395*U - 0.581*V;
        B = Y + 2.032*U;
        R += 128;
        G += 128;
        B += 128;
        if (R > 255) R = 255;
        if (R < 0) R = 0;
        if (G > 255) G = 255;
        if (G < 0) G = 0;
        if (B > 255) B = 255;
        if (B < 0) B = 0;
        pos2 = (i*buffer[0].width+j)*3;

        rgb[pos2] = R; 
        rgb[pos2+1] = G; 
        rgb[pos2+2] = B; 
      }
    }  	
    SvCUR_set(RETVAL, size);
  OUTPUT:
    RETVAL


=head1 get_th_comment

return an array of comments

-Input:
  th_comment

-Output:
  array of comments

=cut
void
LibTheora_get_th_comment(_tc)
    th_comment *	_tc
  PREINIT:
    int i = 0;
  PPCODE:
    EXTEND(SP, _tc->comments);
    for(i=0; i < _tc->comments; i++) {
      PUSHs((SV *)sv_2mortal(newSVpv(_tc->user_comments[i], strlen(_tc->user_comments[i]))));
    }


=head1 set_th_info

sets the th_info structure to default values unless specified in hash. frame_width and frame_height
is mandatory.

-Input:
  Hash of elements

-Output:
  void

=cut
void
LibTheora_set_th_info(_info, hash)
    th_info *		 _info
    HV *    		 hash
  PREINIT:
    char * key;
    I32 klen;
    SV *val;
    int flag = 0;

    int frame_width  = 0;
    int frame_height = 0;
    int pic_width    = 0;
    int pic_height   = 0;
    int pic_x	     = 0;
    int pic_y	     = 0;
    int colorspace   = TH_CS_ITU_REC_470M;
    int pixel_fmt    = TH_PF_420;
    int quality	     = 0;
    int keyframe_granule_shift = 6;
    int target_bitrate	       = 0;
    int aspect_denominator     = 1;
    int aspect_numerator       = 1;
    int fps_numerator	       = 25000;
    int fps_denominator	       = 1000;
  CODE:
    /* get the values from the hash and override the defaults */
    (void)hv_iterinit(hash);
    while ((val = hv_iternextsv(hash, (char **) &key, &klen))) {
      if (strEQ(key, "frame_width")) {
        frame_width = SvIV(val);
	flag++;
	continue;
      }
      if (strEQ(key, "frame_height")) {
        frame_height = SvIV(val);
	flag++;
	continue;
      }
      if (strEQ(key, "pic_width")) {
        pic_width = SvIV(val);
	continue;
      }
      if (strEQ(key, "pic_height")) {
        pic_height = SvIV(val);
	continue;
      }
      if (strEQ(key, "pic_x")) {
        pic_x = SvIV(val);
	continue;
      }
      if (strEQ(key, "pic_y")) {
        pic_y = SvIV(val);
	continue;
      }
      if (strEQ(key, "colorspace")) {
        colorspace = SvIV(val);
	continue;
      }
      if (strEQ(key, "pixel_fmt")) {
        pixel_fmt = SvIV(val);
	continue;
      }
      if (strEQ(key, "target_bitrate")) {
        target_bitrate = SvIV(val);
	continue;
      }
      if (strEQ(key, "aspect_denominator")) {
        aspect_denominator = SvIV(val);
	continue;
      }
      if (strEQ(key, "aspect_numerator")) {
        aspect_numerator = SvIV(val);
	continue;
      }
      if (strEQ(key, "fps_numerator")) {
        fps_numerator = SvIV(val);
	continue;
      }
      if (strEQ(key, "fps_denominator")) {
        fps_denominator = SvIV(val);
	continue;
      }
      if (strEQ(key, "quality")) {
        quality = SvIV(val);
	continue;
      }
      if (strEQ(key, "keyframe_granule_shift")) {
        keyframe_granule_shift = SvIV(val);
	continue;
      }
    }

    if(flag != 2)
      Perl_croak(aTHX_ "please give 'frame_width' and 'frame_height'");

    _info->frame_width  = frame_width;
    _info->frame_height = frame_height;
    _info->pic_width  = (pic_width == 0  ? frame_width  : pic_width);
    _info->pic_height = (pic_height == 0 ? frame_height : pic_height);
    _info->pic_x = pic_x;
    _info->pic_y = pic_y;
    _info->colorspace = colorspace;
    _info->pixel_fmt  = pixel_fmt;
    _info->target_bitrate = target_bitrate;
    _info->aspect_denominator = aspect_denominator;
    _info->aspect_numerator   = aspect_numerator;
    _info->fps_numerator   = fps_numerator;
    _info->fps_denominator = fps_denominator;
    _info->quality = quality;
    _info->keyframe_granule_shift = keyframe_granule_shift;
