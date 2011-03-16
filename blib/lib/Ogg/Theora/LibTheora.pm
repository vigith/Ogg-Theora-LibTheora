package Ogg::Theora::LibTheora;

use 5.008000;
use strict;
use warnings;
use Carp;

require Exporter;
use AutoLoader;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Ogg::Theora::LibTheora ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	OC_BADHEADER
	OC_BADPACKET
	OC_CS_ITU_REC_470BG
	OC_CS_ITU_REC_470M
	OC_CS_NSPACES
	OC_CS_UNSPECIFIED
	OC_DISABLED
	OC_DUPFRAME
	OC_EINVAL
	OC_FAULT
	OC_IMPL
	OC_NEWPACKET
	OC_NOTFORMAT
	OC_PF_420
	OC_PF_422
	OC_PF_444
	OC_PF_RSVD
	OC_VERSION
	TH_CS_ITU_REC_470BG
	TH_CS_ITU_REC_470M
	TH_CS_NSPACES
	TH_CS_UNSPECIFIED
	TH_DECCTL_GET_PPLEVEL_MAX
	TH_DECCTL_SET_GRANPOS
	TH_DECCTL_SET_PPLEVEL
	TH_DECCTL_SET_STRIPE_CB
	TH_DECCTL_SET_TELEMETRY_BITS
	TH_DECCTL_SET_TELEMETRY_MBMODE
	TH_DECCTL_SET_TELEMETRY_MV
	TH_DECCTL_SET_TELEMETRY_QI
	TH_DUPFRAME
	TH_EBADHEADER
	TH_EBADPACKET
	TH_EFAULT
	TH_EIMPL
	TH_EINVAL
	TH_ENCCTL_2PASS_IN
	TH_ENCCTL_2PASS_OUT
	TH_ENCCTL_GET_SPLEVEL
	TH_ENCCTL_GET_SPLEVEL_MAX
	TH_ENCCTL_SET_BITRATE
	TH_ENCCTL_SET_DUP_COUNT
	TH_ENCCTL_SET_HUFFMAN_CODES
	TH_ENCCTL_SET_KEYFRAME_FREQUENCY_FORCE
	TH_ENCCTL_SET_QUALITY
	TH_ENCCTL_SET_QUANT_PARAMS
	TH_ENCCTL_SET_RATE_BUFFER
	TH_ENCCTL_SET_RATE_FLAGS
	TH_ENCCTL_SET_SPLEVEL
	TH_ENCCTL_SET_VP3_COMPATIBLE
	TH_ENOTFORMAT
	TH_EVERSION
	TH_NDCT_TOKENS
	TH_NHUFFMAN_TABLES
	TH_PF_420
	TH_PF_422
	TH_PF_444
	TH_PF_NFORMATS
	TH_PF_RSVD
	TH_RATECTL_CAP_OVERFLOW
	TH_RATECTL_CAP_UNDERFLOW
	TH_RATECTL_DROP_FRAMES
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	OC_BADHEADER
	OC_BADPACKET
	OC_CS_ITU_REC_470BG
	OC_CS_ITU_REC_470M
	OC_CS_NSPACES
	OC_CS_UNSPECIFIED
	OC_DISABLED
	OC_DUPFRAME
	OC_EINVAL
	OC_FAULT
	OC_IMPL
	OC_NEWPACKET
	OC_NOTFORMAT
	OC_PF_420
	OC_PF_422
	OC_PF_444
	OC_PF_RSVD
	OC_VERSION
	TH_CS_ITU_REC_470BG
	TH_CS_ITU_REC_470M
	TH_CS_NSPACES
	TH_CS_UNSPECIFIED
	TH_DECCTL_GET_PPLEVEL_MAX
	TH_DECCTL_SET_GRANPOS
	TH_DECCTL_SET_PPLEVEL
	TH_DECCTL_SET_STRIPE_CB
	TH_DECCTL_SET_TELEMETRY_BITS
	TH_DECCTL_SET_TELEMETRY_MBMODE
	TH_DECCTL_SET_TELEMETRY_MV
	TH_DECCTL_SET_TELEMETRY_QI
	TH_DUPFRAME
	TH_EBADHEADER
	TH_EBADPACKET
	TH_EFAULT
	TH_EIMPL
	TH_EINVAL
	TH_ENCCTL_2PASS_IN
	TH_ENCCTL_2PASS_OUT
	TH_ENCCTL_GET_SPLEVEL
	TH_ENCCTL_GET_SPLEVEL_MAX
	TH_ENCCTL_SET_BITRATE
	TH_ENCCTL_SET_DUP_COUNT
	TH_ENCCTL_SET_HUFFMAN_CODES
	TH_ENCCTL_SET_KEYFRAME_FREQUENCY_FORCE
	TH_ENCCTL_SET_QUALITY
	TH_ENCCTL_SET_QUANT_PARAMS
	TH_ENCCTL_SET_RATE_BUFFER
	TH_ENCCTL_SET_RATE_FLAGS
	TH_ENCCTL_SET_SPLEVEL
	TH_ENCCTL_SET_VP3_COMPATIBLE
	TH_ENOTFORMAT
	TH_EVERSION
	TH_NDCT_TOKENS
	TH_NHUFFMAN_TABLES
	TH_PF_420
	TH_PF_422
	TH_PF_444
	TH_PF_NFORMATS
	TH_PF_RSVD
	TH_RATECTL_CAP_OVERFLOW
	TH_RATECTL_CAP_UNDERFLOW
	TH_RATECTL_DROP_FRAMES
);

our $VERSION = '0.01';

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.

    my $constname;
    our $AUTOLOAD;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "&Ogg::Theora::LibTheora::constant not defined" if $constname eq 'constant';
    my ($error, $val) = constant($constname);
    if ($error) { croak $error; }
    {
	no strict 'refs';
	# Fixed between 5.005_53 and 5.005_61
#XXX	if ($] >= 5.00561) {
#XXX	    *$AUTOLOAD = sub () { $val };
#XXX	}
#XXX	else {
	    *$AUTOLOAD = sub { $val };
#XXX	}
    }
    goto &$AUTOLOAD;
}

require XSLoader;
XSLoader::load('Ogg::Theora::LibTheora', $VERSION);

# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Ogg::Theora::LibTheora - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Ogg::Theora::LibTheora;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Ogg::Theora::LibTheora, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.

=head2 Exportable constants

  OC_BADHEADER
  OC_BADPACKET
  OC_CS_ITU_REC_470BG
  OC_CS_ITU_REC_470M
  OC_CS_NSPACES
  OC_CS_UNSPECIFIED
  OC_DISABLED
  OC_DUPFRAME
  OC_EINVAL
  OC_FAULT
  OC_IMPL
  OC_NEWPACKET
  OC_NOTFORMAT
  OC_PF_420
  OC_PF_422
  OC_PF_444
  OC_PF_RSVD
  OC_VERSION
  TH_CS_ITU_REC_470BG
  TH_CS_ITU_REC_470M
  TH_CS_NSPACES
  TH_CS_UNSPECIFIED
  TH_DECCTL_GET_PPLEVEL_MAX
  TH_DECCTL_SET_GRANPOS
  TH_DECCTL_SET_PPLEVEL
  TH_DECCTL_SET_STRIPE_CB
  TH_DECCTL_SET_TELEMETRY_BITS
  TH_DECCTL_SET_TELEMETRY_MBMODE
  TH_DECCTL_SET_TELEMETRY_MV
  TH_DECCTL_SET_TELEMETRY_QI
  TH_DUPFRAME
  TH_EBADHEADER
  TH_EBADPACKET
  TH_EFAULT
  TH_EIMPL
  TH_EINVAL
  TH_ENCCTL_2PASS_IN
  TH_ENCCTL_2PASS_OUT
  TH_ENCCTL_GET_SPLEVEL
  TH_ENCCTL_GET_SPLEVEL_MAX
  TH_ENCCTL_SET_BITRATE
  TH_ENCCTL_SET_DUP_COUNT
  TH_ENCCTL_SET_HUFFMAN_CODES
  TH_ENCCTL_SET_KEYFRAME_FREQUENCY_FORCE
  TH_ENCCTL_SET_QUALITY
  TH_ENCCTL_SET_QUANT_PARAMS
  TH_ENCCTL_SET_RATE_BUFFER
  TH_ENCCTL_SET_RATE_FLAGS
  TH_ENCCTL_SET_SPLEVEL
  TH_ENCCTL_SET_VP3_COMPATIBLE
  TH_ENOTFORMAT
  TH_EVERSION
  TH_NDCT_TOKENS
  TH_NHUFFMAN_TABLES
  TH_PF_420
  TH_PF_422
  TH_PF_444
  TH_PF_NFORMATS
  TH_PF_RSVD
  TH_RATECTL_CAP_OVERFLOW
  TH_RATECTL_CAP_UNDERFLOW
  TH_RATECTL_DROP_FRAMES



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Vigith Maurice, E<lt>vigith@nonetE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Vigith Maurice

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.9 or,
at your option, any later version of Perl 5 you may have available.


=cut
