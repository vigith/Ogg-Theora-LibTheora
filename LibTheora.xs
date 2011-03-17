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


=head1 TODO in this section

th_granule_frame
  
th_granule_time

th_packet_iskeyframe

=cut


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
    

=head th_setup_free

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
    status = th_decode_packetin(_dec, _op, (ogg_int64_t *) _granpos);
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



=head1 Miscellaneous Functions 

These functions are not found in libtheora*, but is written by the XS author
to simplify few tasks.

=cut

=head1 get_th_info

Returns a HashRef with th_info struct values.

-Input:
  th_info

-Output:
  Hash

=cut
HV *
LibTheora_get_th_info(_info)
    th_info *		_info
  PREINIT:
    HV * hash;
  CODE:
    hash = newHV();
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

