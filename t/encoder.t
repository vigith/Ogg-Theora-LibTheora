
use Ogg::LibOgg;
use strict;

use Test::More tests => 7;
BEGIN { 
  use_ok('Ogg::Theora::LibTheora') 
};


## Make th_info
my $th_info = Ogg::Theora::LibTheora::make_th_info();
ok($th_info != 0, "Make th_info");

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
