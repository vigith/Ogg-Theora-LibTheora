
use strict;
use Ogg::LibOgg ':all';

use Ogg::Theora::LibTheora;

## Make Ogg Structures
my $op = make_ogg_packet();
my $og = make_ogg_page();
my $os = make_ogg_stream_state();
my $oy = make_ogg_sync_state();

my $filename = "theora_encode.ogg";
open IN, $filename or die "can't open [$filename] : $!";

## Ogg Sync Init
ogg_sync_init($oy);

## read a page (wrapper for ogg_sync_pageout)
ogg_read_page(*IN, $oy, $og);

my $slno = ogg_page_serialno($og);

## Initializes the Ogg Stream State struct
ogg_stream_init($os, $slno);

## add complete page to the bitstream, o create a valid ogg_page struct
## after calling ogg_sync_pageout (read_page does ogg_sync_pageout)
ogg_stream_pagein($os, $og);

## th_comment
my $th_comment = Ogg::Theora::LibTheora::make_th_comment();

## th_comment_init
Ogg::Theora::LibTheora::th_comment_init($th_comment);

## Make th_info
my $th_info = Ogg::Theora::LibTheora::make_th_info();

## th_info_init
Ogg::Theora::LibTheora::th_info_init($th_info);


###############################################################################################
# (1) Parse the header packets by repeatedly calling th_decode_headerin().      	      #
# (2) Allocate a th_dec_ctx handle with th_decode_alloc().		      		      #
# (3) Call th_setup_free() to free any memory used for codec setup information. 	      #
# (4) Perform any additional decoder configuration with th_decode_ctl().	    	      #
# (5) For each video data packet:						    	      #
#     (5.a) Submit the packet to the decoder via th_decode_packetin().	    		      #
#     (5.b) Retrieve the uncompressed video data via th_decode_ycbcr_out().	    	      #
# (6) Call th_decode_free() to release all decoder memory. 		      		      #
###############################################################################################


## (1) ##

## Decode Header and parse the stream till the first VIDEO packet gets in
my $th_setup_info_addr = 0;
my $ret = undef;
Ogg::Theora::LibTheora::th_packet_isheader($op);
Ogg::Theora::LibTheora::th_packet_iskeyframe($op);

do {
  ($ret, $th_setup_info_addr) = Ogg::Theora::LibTheora::th_decode_headerin($th_info, $th_comment, $th_setup_info_addr, $op);
  ## $ret > 0 indicates that a Theora header was successfully processed. 
  readPacket() if $ret != 0;
} while ($ret != 0); ## ret == 0 means, first video data packet was encountered


## (2) ##

## th_decode_alloc
my $th_dec_ctx = Ogg::Theora::LibTheora::th_decode_alloc($th_info, $th_setup_info_addr);

## (3) ##

## th_setup_free
Ogg::Theora::LibTheora::th_setup_free($th_setup_info_addr);

my $h_info = Ogg::Theora::LibTheora::get_th_info($th_info);

## Make th_ycbcr_buffer
my $th_ycbcr_buffer = Ogg::Theora::LibTheora::make_th_ycbcr_buffer();

## (4) ##
## None

my $gpos = 0;

for (0..2) {

  ## (5) ##

  ## (5.a) ##

  ## th_decode_packetin

  $ret = undef;
  ($ret, $gpos) = Ogg::Theora::LibTheora::th_decode_packetin($th_dec_ctx, $op, $gpos);

  ## (5.b) ##

  ## th_decode_ycbcr_out
  Ogg::Theora::LibTheora::th_decode_ycbcr_out($th_dec_ctx, $th_ycbcr_buffer);

  my $rgb_buf = Ogg::Theora::LibTheora::ycbcr_to_rgb_buffer($th_ycbcr_buffer);

  my $info = Ogg::Theora::LibTheora::get_th_ycbcr_buffer_info($th_ycbcr_buffer);


  ## testing inside testing :-)
  open OUT, ">", "dec_pic$_.raw" or die( "can't open $!");
  binmode OUT;
  print OUT $rgb_buf;
  close OUT;

  Ogg::Theora::LibTheora::th_granule_frame($th_dec_ctx, $gpos);

  Ogg::Theora::LibTheora::th_granule_time($th_dec_ctx, $gpos);

  readPacket();

}

## Clean Ups ##

## (6) ##

## th_decode_free
Ogg::Theora::LibTheora::th_decode_free($th_dec_ctx);

Ogg::Theora::LibTheora::th_info_clear($th_info);

close IN;


## ++++++++++++ ##
## SUB ROUTINES ##
## ++++++++++++ ##

sub readPacket {
  while (ogg_stream_packetout($os, $op) == 0) {
    if (not defined ogg_read_page(*IN, $oy, $og)) {
      return undef
    }
    ogg_stream_pagein($os, $og);
  }
}
