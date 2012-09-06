#define PERL_constant_NOTFOUND	1
#define PERL_constant_NOTDEF	2
#define PERL_constant_ISIV	3
#define PERL_constant_ISNO	4
#define PERL_constant_ISNV	5
#define PERL_constant_ISPV	6
#define PERL_constant_ISPVN	7
#define PERL_constant_ISSV	8
#define PERL_constant_ISUNDEF	9
#define PERL_constant_ISUV	10
#define PERL_constant_ISYES	11

#ifndef NVTYPE
typedef double NV; /* 5.6 and later define NVTYPE, and typedef NV to it.  */
#endif
#ifndef aTHX_
#define aTHX_ /* 5.6 or later define this for threading support.  */
#endif
#ifndef pTHX_
#define pTHX_ /* 5.6 or later define this for threading support.  */
#endif

static int
constant_9 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     OC_EINVAL OC_PF_420 OC_PF_422 OC_PF_444 TH_EFAULT TH_EINVAL TH_PF_420
     TH_PF_422 TH_PF_444 */
  /* Offset 8 gives the best switch position.  */
  switch (name[8]) {
  case '0':
    if (memEQ(name, "OC_PF_42", 8)) {
    /*                       0     */
#ifdef OC_PF_420
      *iv_return = OC_PF_420;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "TH_PF_42", 8)) {
    /*                       0     */
#ifdef TH_PF_420
      *iv_return = TH_PF_420;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case '2':
    if (memEQ(name, "OC_PF_42", 8)) {
    /*                       2     */
#ifdef OC_PF_422
      *iv_return = OC_PF_422;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "TH_PF_42", 8)) {
    /*                       2     */
#ifdef TH_PF_422
      *iv_return = TH_PF_422;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case '4':
    if (memEQ(name, "OC_PF_44", 8)) {
    /*                       4     */
#ifdef OC_PF_444
      *iv_return = OC_PF_444;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "TH_PF_44", 8)) {
    /*                       4     */
#ifdef TH_PF_444
      *iv_return = TH_PF_444;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'L':
    if (memEQ(name, "OC_EINVA", 8)) {
    /*                       L     */
#ifdef OC_EINVAL
      *iv_return = OC_EINVAL;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "TH_EINVA", 8)) {
    /*                       L     */
#ifdef TH_EINVAL
      *iv_return = TH_EINVAL;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'T':
    if (memEQ(name, "TH_EFAUL", 8)) {
    /*                       T     */
#ifdef TH_EFAULT
      *iv_return = TH_EFAULT;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_10 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     OC_PF_RSVD OC_VERSION TH_PF_RSVD */
  /* Offset 4 gives the best switch position.  */
  switch (name[4]) {
  case 'E':
    if (memEQ(name, "OC_VERSION", 10)) {
    /*                   ^            */
#ifdef OC_VERSION
      *iv_return = OC_VERSION;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'F':
    if (memEQ(name, "OC_PF_RSVD", 10)) {
    /*                   ^            */
#ifdef OC_PF_RSVD
      *iv_return = OC_PF_RSVD;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "TH_PF_RSVD", 10)) {
    /*                   ^            */
#ifdef TH_PF_RSVD
      *iv_return = TH_PF_RSVD;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_11 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     OC_DISABLED OC_DUPFRAME TH_DUPFRAME TH_EVERSION */
  /* Offset 10 gives the best switch position.  */
  switch (name[10]) {
  case 'D':
    if (memEQ(name, "OC_DISABLE", 10)) {
    /*                         D      */
#ifdef OC_DISABLED
      *iv_return = OC_DISABLED;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'E':
    if (memEQ(name, "OC_DUPFRAM", 10)) {
    /*                         E      */
#ifdef OC_DUPFRAME
      *iv_return = OC_DUPFRAME;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "TH_DUPFRAM", 10)) {
    /*                         E      */
#ifdef TH_DUPFRAME
      *iv_return = TH_DUPFRAME;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'N':
    if (memEQ(name, "TH_EVERSIO", 10)) {
    /*                         N      */
#ifdef TH_EVERSION
      *iv_return = TH_EVERSION;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_12 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     OC_BADHEADER OC_BADPACKET OC_NEWPACKET OC_NOTFORMAT */
  /* Offset 9 gives the best switch position.  */
  switch (name[9]) {
  case 'D':
    if (memEQ(name, "OC_BADHEADER", 12)) {
    /*                        ^         */
#ifdef OC_BADHEADER
      *iv_return = OC_BADHEADER;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'K':
    if (memEQ(name, "OC_BADPACKET", 12)) {
    /*                        ^         */
#ifdef OC_BADPACKET
      *iv_return = OC_BADPACKET;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "OC_NEWPACKET", 12)) {
    /*                        ^         */
#ifdef OC_NEWPACKET
      *iv_return = OC_NEWPACKET;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'M':
    if (memEQ(name, "OC_NOTFORMAT", 12)) {
    /*                        ^         */
#ifdef OC_NOTFORMAT
      *iv_return = OC_NOTFORMAT;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_13 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     OC_CS_NSPACES TH_CS_NSPACES TH_EBADHEADER TH_EBADPACKET TH_ENOTFORMAT */
  /* Offset 10 gives the best switch position.  */
  switch (name[10]) {
  case 'C':
    if (memEQ(name, "OC_CS_NSPACES", 13)) {
    /*                         ^         */
#ifdef OC_CS_NSPACES
      *iv_return = OC_CS_NSPACES;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "TH_CS_NSPACES", 13)) {
    /*                         ^         */
#ifdef TH_CS_NSPACES
      *iv_return = TH_CS_NSPACES;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'D':
    if (memEQ(name, "TH_EBADHEADER", 13)) {
    /*                         ^         */
#ifdef TH_EBADHEADER
      *iv_return = TH_EBADHEADER;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'K':
    if (memEQ(name, "TH_EBADPACKET", 13)) {
    /*                         ^         */
#ifdef TH_EBADPACKET
      *iv_return = TH_EBADPACKET;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'M':
    if (memEQ(name, "TH_ENOTFORMAT", 13)) {
    /*                         ^         */
#ifdef TH_ENOTFORMAT
      *iv_return = TH_ENOTFORMAT;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_18 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     OC_CS_ITU_REC_470M TH_CS_ITU_REC_470M TH_ENCCTL_2PASS_IN
     TH_NHUFFMAN_TABLES */
  /* Offset 17 gives the best switch position.  */
  switch (name[17]) {
  case 'M':
    if (memEQ(name, "OC_CS_ITU_REC_470", 17)) {
    /*                                M      */
#ifdef OC_CS_ITU_REC_470M
      *iv_return = OC_CS_ITU_REC_470M;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "TH_CS_ITU_REC_470", 17)) {
    /*                                M      */
#ifdef TH_CS_ITU_REC_470M
      *iv_return = TH_CS_ITU_REC_470M;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'N':
    if (memEQ(name, "TH_ENCCTL_2PASS_I", 17)) {
    /*                                N      */
#ifdef TH_ENCCTL_2PASS_IN
      *iv_return = TH_ENCCTL_2PASS_IN;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'S':
    if (memEQ(name, "TH_NHUFFMAN_TABLE", 17)) {
    /*                                S      */
#ifdef TH_NHUFFMAN_TABLES
      *iv_return = TH_NHUFFMAN_TABLES;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_19 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     OC_CS_ITU_REC_470BG TH_CS_ITU_REC_470BG TH_ENCCTL_2PASS_OUT */
  /* Offset 3 gives the best switch position.  */
  switch (name[3]) {
  case 'C':
    if (memEQ(name, "OC_CS_ITU_REC_470BG", 19)) {
    /*                  ^                      */
#ifdef OC_CS_ITU_REC_470BG
      *iv_return = OC_CS_ITU_REC_470BG;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "TH_CS_ITU_REC_470BG", 19)) {
    /*                  ^                      */
#ifdef TH_CS_ITU_REC_470BG
      *iv_return = TH_CS_ITU_REC_470BG;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'E':
    if (memEQ(name, "TH_ENCCTL_2PASS_OUT", 19)) {
    /*                  ^                      */
#ifdef TH_ENCCTL_2PASS_OUT
      *iv_return = TH_ENCCTL_2PASS_OUT;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_21 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     TH_DECCTL_SET_GRANPOS TH_DECCTL_SET_PPLEVEL TH_ENCCTL_GET_SPLEVEL
     TH_ENCCTL_SET_BITRATE TH_ENCCTL_SET_QUALITY TH_ENCCTL_SET_SPLEVEL */
  /* Offset 14 gives the best switch position.  */
  switch (name[14]) {
  case 'B':
    if (memEQ(name, "TH_ENCCTL_SET_BITRATE", 21)) {
    /*                             ^             */
#ifdef TH_ENCCTL_SET_BITRATE
      *iv_return = TH_ENCCTL_SET_BITRATE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'G':
    if (memEQ(name, "TH_DECCTL_SET_GRANPOS", 21)) {
    /*                             ^             */
#ifdef TH_DECCTL_SET_GRANPOS
      *iv_return = TH_DECCTL_SET_GRANPOS;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'P':
    if (memEQ(name, "TH_DECCTL_SET_PPLEVEL", 21)) {
    /*                             ^             */
#ifdef TH_DECCTL_SET_PPLEVEL
      *iv_return = TH_DECCTL_SET_PPLEVEL;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'Q':
    if (memEQ(name, "TH_ENCCTL_SET_QUALITY", 21)) {
    /*                             ^             */
#ifdef TH_ENCCTL_SET_QUALITY
      *iv_return = TH_ENCCTL_SET_QUALITY;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'S':
    if (memEQ(name, "TH_ENCCTL_GET_SPLEVEL", 21)) {
    /*                             ^             */
#ifdef TH_ENCCTL_GET_SPLEVEL
      *iv_return = TH_ENCCTL_GET_SPLEVEL;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "TH_ENCCTL_SET_SPLEVEL", 21)) {
    /*                             ^             */
#ifdef TH_ENCCTL_SET_SPLEVEL
      *iv_return = TH_ENCCTL_SET_SPLEVEL;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_23 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     TH_DECCTL_SET_STRIPE_CB TH_ENCCTL_SET_DUP_COUNT TH_RATECTL_CAP_OVERFLOW */
  /* Offset 15 gives the best switch position.  */
  switch (name[15]) {
  case 'O':
    if (memEQ(name, "TH_RATECTL_CAP_OVERFLOW", 23)) {
    /*                              ^              */
#ifdef TH_RATECTL_CAP_OVERFLOW
      *iv_return = TH_RATECTL_CAP_OVERFLOW;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'T':
    if (memEQ(name, "TH_DECCTL_SET_STRIPE_CB", 23)) {
    /*                              ^              */
#ifdef TH_DECCTL_SET_STRIPE_CB
      *iv_return = TH_DECCTL_SET_STRIPE_CB;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'U':
    if (memEQ(name, "TH_ENCCTL_SET_DUP_COUNT", 23)) {
    /*                              ^              */
#ifdef TH_ENCCTL_SET_DUP_COUNT
      *iv_return = TH_ENCCTL_SET_DUP_COUNT;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_25 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     TH_DECCTL_GET_PPLEVEL_MAX TH_ENCCTL_GET_SPLEVEL_MAX
     TH_ENCCTL_SET_RATE_BUFFER */
  /* Offset 14 gives the best switch position.  */
  switch (name[14]) {
  case 'P':
    if (memEQ(name, "TH_DECCTL_GET_PPLEVEL_MAX", 25)) {
    /*                             ^                 */
#ifdef TH_DECCTL_GET_PPLEVEL_MAX
      *iv_return = TH_DECCTL_GET_PPLEVEL_MAX;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'R':
    if (memEQ(name, "TH_ENCCTL_SET_RATE_BUFFER", 25)) {
    /*                             ^                 */
#ifdef TH_ENCCTL_SET_RATE_BUFFER
      *iv_return = TH_ENCCTL_SET_RATE_BUFFER;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'S':
    if (memEQ(name, "TH_ENCCTL_GET_SPLEVEL_MAX", 25)) {
    /*                             ^                 */
#ifdef TH_ENCCTL_GET_SPLEVEL_MAX
      *iv_return = TH_ENCCTL_GET_SPLEVEL_MAX;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_26 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     TH_DECCTL_SET_TELEMETRY_MV TH_DECCTL_SET_TELEMETRY_QI
     TH_ENCCTL_SET_QUANT_PARAMS */
  /* Offset 25 gives the best switch position.  */
  switch (name[25]) {
  case 'I':
    if (memEQ(name, "TH_DECCTL_SET_TELEMETRY_Q", 25)) {
    /*                                        I      */
#ifdef TH_DECCTL_SET_TELEMETRY_QI
      *iv_return = TH_DECCTL_SET_TELEMETRY_QI;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'S':
    if (memEQ(name, "TH_ENCCTL_SET_QUANT_PARAM", 25)) {
    /*                                        S      */
#ifdef TH_ENCCTL_SET_QUANT_PARAMS
      *iv_return = TH_ENCCTL_SET_QUANT_PARAMS;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'V':
    if (memEQ(name, "TH_DECCTL_SET_TELEMETRY_M", 25)) {
    /*                                        V      */
#ifdef TH_DECCTL_SET_TELEMETRY_MV
      *iv_return = TH_DECCTL_SET_TELEMETRY_MV;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant (pTHX_ const char *name, STRLEN len, IV *iv_return) {
  /* Initially switch on the length of the name.  */
  /* When generated this function returned values for the list of names given
     in this section of perl code.  Rather than manually editing these functions
     to add or remove constants, which would result in this comment and section
     of code becoming inaccurate, we recommend that you edit this section of
     code, and use it to regenerate a new set of constant functions which you
     then use to replace the originals.

     Regenerate these constant functions by feeding this entire source file to
     perl -x

#!/home/egor/perl5/perlbrew/perls/perl-5.16.1/bin/perl -w
use ExtUtils::Constant qw (constant_types C_constant XS_constant);

my $types = {map {($_, 1)} qw(IV)};
my @names = (qw(OC_BADHEADER OC_BADPACKET OC_CS_ITU_REC_470BG
	       OC_CS_ITU_REC_470M OC_CS_NSPACES OC_CS_UNSPECIFIED OC_DISABLED
	       OC_DUPFRAME OC_EINVAL OC_FAULT OC_IMPL OC_NEWPACKET OC_NOTFORMAT
	       OC_PF_420 OC_PF_422 OC_PF_444 OC_PF_RSVD OC_VERSION
	       TH_CS_ITU_REC_470BG TH_CS_ITU_REC_470M TH_CS_NSPACES
	       TH_CS_UNSPECIFIED TH_DECCTL_GET_PPLEVEL_MAX
	       TH_DECCTL_SET_GRANPOS TH_DECCTL_SET_PPLEVEL
	       TH_DECCTL_SET_STRIPE_CB TH_DECCTL_SET_TELEMETRY_BITS
	       TH_DECCTL_SET_TELEMETRY_MBMODE TH_DECCTL_SET_TELEMETRY_MV
	       TH_DECCTL_SET_TELEMETRY_QI TH_DUPFRAME TH_EBADHEADER
	       TH_EBADPACKET TH_EFAULT TH_EIMPL TH_EINVAL TH_ENCCTL_2PASS_IN
	       TH_ENCCTL_2PASS_OUT TH_ENCCTL_GET_SPLEVEL
	       TH_ENCCTL_GET_SPLEVEL_MAX TH_ENCCTL_SET_BITRATE
	       TH_ENCCTL_SET_DUP_COUNT TH_ENCCTL_SET_HUFFMAN_CODES
	       TH_ENCCTL_SET_KEYFRAME_FREQUENCY_FORCE TH_ENCCTL_SET_QUALITY
	       TH_ENCCTL_SET_QUANT_PARAMS TH_ENCCTL_SET_RATE_BUFFER
	       TH_ENCCTL_SET_RATE_FLAGS TH_ENCCTL_SET_SPLEVEL
	       TH_ENCCTL_SET_VP3_COMPATIBLE TH_ENOTFORMAT TH_EVERSION
	       TH_NDCT_TOKENS TH_NHUFFMAN_TABLES TH_PF_420 TH_PF_422 TH_PF_444
	       TH_PF_NFORMATS TH_PF_RSVD TH_RATECTL_CAP_OVERFLOW
	       TH_RATECTL_CAP_UNDERFLOW TH_RATECTL_DROP_FRAMES));

print constant_types(), "\n"; # macro defs
foreach (C_constant ("Ogg::Theora::LibTheora", 'constant', 'IV', $types, undef, 3, @names) ) {
    print $_, "\n"; # C constant subs
}
print "\n#### XS Section:\n";
print XS_constant ("Ogg::Theora::LibTheora", $types);
__END__
   */

  switch (len) {
  case 7:
    if (memEQ(name, "OC_IMPL", 7)) {
#ifdef OC_IMPL
      *iv_return = OC_IMPL;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 8:
    /* Names all of length 8.  */
    /* OC_FAULT TH_EIMPL */
    /* Offset 3 gives the best switch position.  */
    switch (name[3]) {
    case 'E':
      if (memEQ(name, "TH_EIMPL", 8)) {
      /*                  ^          */
#ifdef TH_EIMPL
        *iv_return = TH_EIMPL;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    case 'F':
      if (memEQ(name, "OC_FAULT", 8)) {
      /*                  ^          */
#ifdef OC_FAULT
        *iv_return = OC_FAULT;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    }
    break;
  case 9:
    return constant_9 (aTHX_ name, iv_return);
    break;
  case 10:
    return constant_10 (aTHX_ name, iv_return);
    break;
  case 11:
    return constant_11 (aTHX_ name, iv_return);
    break;
  case 12:
    return constant_12 (aTHX_ name, iv_return);
    break;
  case 13:
    return constant_13 (aTHX_ name, iv_return);
    break;
  case 14:
    /* Names all of length 14.  */
    /* TH_NDCT_TOKENS TH_PF_NFORMATS */
    /* Offset 3 gives the best switch position.  */
    switch (name[3]) {
    case 'N':
      if (memEQ(name, "TH_NDCT_TOKENS", 14)) {
      /*                  ^                 */
#ifdef TH_NDCT_TOKENS
        *iv_return = TH_NDCT_TOKENS;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    case 'P':
      if (memEQ(name, "TH_PF_NFORMATS", 14)) {
      /*                  ^                 */
#ifdef TH_PF_NFORMATS
        *iv_return = TH_PF_NFORMATS;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    }
    break;
  case 17:
    /* Names all of length 17.  */
    /* OC_CS_UNSPECIFIED TH_CS_UNSPECIFIED */
    /* Offset 0 gives the best switch position.  */
    switch (*name++) {
    case 'O':
      if (memEQ(name, "C_CS_UNSPECIFIED", 16)) {
      /*                O                       */
#ifdef OC_CS_UNSPECIFIED
        *iv_return = OC_CS_UNSPECIFIED;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    case 'T':
      if (memEQ(name, "H_CS_UNSPECIFIED", 16)) {
      /*                T                       */
#ifdef TH_CS_UNSPECIFIED
        *iv_return = TH_CS_UNSPECIFIED;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    }
    break;
  case 18:
    return constant_18 (aTHX_ name, iv_return);
    break;
  case 19:
    return constant_19 (aTHX_ name, iv_return);
    break;
  case 21:
    return constant_21 (aTHX_ name, iv_return);
    break;
  case 22:
    if (memEQ(name, "TH_RATECTL_DROP_FRAMES", 22)) {
#ifdef TH_RATECTL_DROP_FRAMES
      *iv_return = TH_RATECTL_DROP_FRAMES;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 23:
    return constant_23 (aTHX_ name, iv_return);
    break;
  case 24:
    /* Names all of length 24.  */
    /* TH_ENCCTL_SET_RATE_FLAGS TH_RATECTL_CAP_UNDERFLOW */
    /* Offset 17 gives the best switch position.  */
    switch (name[17]) {
    case 'D':
      if (memEQ(name, "TH_RATECTL_CAP_UNDERFLOW", 24)) {
      /*                                ^             */
#ifdef TH_RATECTL_CAP_UNDERFLOW
        *iv_return = TH_RATECTL_CAP_UNDERFLOW;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    case 'E':
      if (memEQ(name, "TH_ENCCTL_SET_RATE_FLAGS", 24)) {
      /*                                ^             */
#ifdef TH_ENCCTL_SET_RATE_FLAGS
        *iv_return = TH_ENCCTL_SET_RATE_FLAGS;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    }
    break;
  case 25:
    return constant_25 (aTHX_ name, iv_return);
    break;
  case 26:
    return constant_26 (aTHX_ name, iv_return);
    break;
  case 27:
    if (memEQ(name, "TH_ENCCTL_SET_HUFFMAN_CODES", 27)) {
#ifdef TH_ENCCTL_SET_HUFFMAN_CODES
      *iv_return = TH_ENCCTL_SET_HUFFMAN_CODES;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 28:
    /* Names all of length 28.  */
    /* TH_DECCTL_SET_TELEMETRY_BITS TH_ENCCTL_SET_VP3_COMPATIBLE */
    /* Offset 3 gives the best switch position.  */
    switch (name[3]) {
    case 'D':
      if (memEQ(name, "TH_DECCTL_SET_TELEMETRY_BITS", 28)) {
      /*                  ^                               */
#ifdef TH_DECCTL_SET_TELEMETRY_BITS
        *iv_return = TH_DECCTL_SET_TELEMETRY_BITS;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    case 'E':
      if (memEQ(name, "TH_ENCCTL_SET_VP3_COMPATIBLE", 28)) {
      /*                  ^                               */
#ifdef TH_ENCCTL_SET_VP3_COMPATIBLE
        *iv_return = TH_ENCCTL_SET_VP3_COMPATIBLE;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    }
    break;
  case 30:
    if (memEQ(name, "TH_DECCTL_SET_TELEMETRY_MBMODE", 30)) {
#ifdef TH_DECCTL_SET_TELEMETRY_MBMODE
      *iv_return = TH_DECCTL_SET_TELEMETRY_MBMODE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 38:
    if (memEQ(name, "TH_ENCCTL_SET_KEYFRAME_FREQUENCY_FORCE", 38)) {
#ifdef TH_ENCCTL_SET_KEYFRAME_FREQUENCY_FORCE
      *iv_return = TH_ENCCTL_SET_KEYFRAME_FREQUENCY_FORCE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

