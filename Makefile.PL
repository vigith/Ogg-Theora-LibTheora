use 5.008000;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Ogg::Theora::LibTheora',
    VERSION_FROM      => 'lib/Ogg/Theora/LibTheora.pm',
    PREREQ_PM         => {Ogg::LibOgg => 0}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Ogg/Theora/LibTheora.pm', # retrieve abstract from module
       AUTHOR         => 'Vigith Maurice <vigith@cpan.org>') : ()),
    LIBS              => ['-logg', '-ltheora', '-ltheoraenc', '-ltheoradec', ],
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '-I/usr/lib/include -I/opt/local/include -I/usr/lib',
);
