
use Ogg::LibOgg ':all';
use strict;

use Test::More tests => 8;
BEGIN { 
  use_ok('Ogg::Theora::LibTheora') 
};


## Make Ogg Structures
my $op = make_ogg_packet();
my $og = make_ogg_page();
my $os = make_ogg_stream_state();
my $oy = make_ogg_sync_state();

my $filename = "t/video_6_2m.ogg";
open IN, $filename or die "can't open [$filename] : $!";

## Ogg Sync Init
ok(ogg_sync_init($oy) == 0, "ogg_sync_init");

## read a page (wrapper for ogg_sync_pageout)
ogg_read_page(*IN, $oy, $og);

my $slno = ogg_page_serialno($og);

## Initializes the Ogg Stream State struct
ok(ogg_stream_init($os, $slno) == 0, "ogg_stream_init");

## add complete page to the bitstream, o create a valid ogg_page struct
## after calling ogg_sync_pageout (read_page does ogg_sync_pageout)
ok(ogg_stream_pagein($os, $og) == 0, "ogg_stream_pagein");

## th_comment
my $th_comment = Ogg::Theora::LibTheora::make_th_comment();
ok($th_comment != 0, "th_comment");

## th_comment_init
Ogg::Theora::LibTheora::th_comment_init($th_comment);
ok(1, "th_comment_init");

## Make th_info
my $th_info = Ogg::Theora::LibTheora::make_th_info();
ok($th_info != 0, "Make th_info");

## th_info_init
Ogg::Theora::LibTheora::th_info_init($th_info);
ok(1, "th_info_init");

diag(TH_EFAULT, "**", TH_EBADHEADER, "**", TH_EVERSION, "**", TH_ENOTFORMAT, "***********");

## Decode Header ##
my $th_setup_info = 0;
diag(Ogg::Theora::LibTheora::th_packet_isheader($op), "+++");

for ((0..4)) {
readPacket();
diag(Ogg::Theora::LibTheora::th_decode_headerin($th_info, $th_comment, $th_setup_info, $op), "-----");
}

close IN;


## ++++++++++++ ##
## SUB ROUTINES ##
## ++++++++++++ ##
sub readPacket {
  while (ogg_stream_packetout($os, $op) == 0) {
    if (not defined ogg_read_page(*IN, $oy, $og)) {
      print "EOF\n";
      return undef
    }
    ogg_stream_pagein($os, $og);
  }
}
