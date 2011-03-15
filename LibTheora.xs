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
  Void

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
  Void

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
  Void

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
  Void

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
  Void

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

