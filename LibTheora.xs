#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <ogg/ogg.h>
#include <theora/codec.h>
#include <theora/theora.h>
#include <theora/theoraenc.h>
#include <theora/theoradec.h>


MODULE = Ogg::Theora::LibTheora		PACKAGE = Ogg::Theora::LibTheora	PREFIX = LibTheora_

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

=cut
