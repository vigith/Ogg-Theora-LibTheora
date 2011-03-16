
use strict;
use Ogg::LibOgg ':all';

use Test::More tests => 14;

BEGIN { 
  use_ok('Ogg::Theora::LibTheora') 
};

## Make Ogg Structures
my $op = make_ogg_packet();
my $og = make_ogg_page();
my $os = make_ogg_stream_state();
my $oy = make_ogg_sync_state();

## Make th_info
my $th_info = Ogg::Theora::LibTheora::make_th_info();
ok($th_info != 0, "Make th_info");

Ogg::Theora::LibTheora::th_info_init($th_info);
ok(1, "th_info_init");

## Make th_huff_code
my $th_huff_code = Ogg::Theora::LibTheora::make_th_huff_code();
ok($th_huff_code != 0, "Make th_huff_code");

## Make th_img_plane
my $th_img_plane = Ogg::Theora::LibTheora::make_th_img_plane();
ok($th_img_plane != 0, "Make th_img_plane");

## Make th_quant_info
my $th_quant_info = Ogg::Theora::LibTheora::make_th_quant_info();
ok($th_quant_info != 0, "Make th_quant_info");

## Make th_quant_ranges
my $th_quant_ranges = Ogg::Theora::LibTheora::make_th_quant_ranges();
ok($th_quant_ranges != 0, "Make th_quant_ranges");

## Make th_stripe_callback
my $th_stripe_callback = Ogg::Theora::LibTheora::make_th_stripe_callback();
ok($th_stripe_callback != 0, "Make th_stripe_callback");

## Make th_ycbcr_buffer
my $th_ycbcr_buffer = Ogg::Theora::LibTheora::make_th_ycbcr_buffer();
ok($th_ycbcr_buffer != 0, "Make th_ycbcr_buffer");

## th_version_number
ok(Ogg::Theora::LibTheora::th_version_number() != 0, "th_version_number");

## th_version_string
ok(Ogg::Theora::LibTheora::th_version_string ne '', "th_version_string");

## th_comment
my $th_comment = Ogg::Theora::LibTheora::make_th_comment();
ok($th_comment != 0, "th_comment");

## th_comment_init
Ogg::Theora::LibTheora::th_comment_init($th_comment);
ok(1, "th_comment_init");

## is_header
ok(Ogg::Theora::LibTheora::th_packet_isheader($op) == 0, "th_packet_isheader");
