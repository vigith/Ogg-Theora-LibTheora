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

