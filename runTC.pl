use strict;
use warnings;
use Readonly;

Readonly my $AUTOMATOS_VERSION  => 'Automatos-v3.1.50';
Readonly my $PERL               => 'c:\Perl\\bin\\perl.exe';
#Readonly my $AUTOMATOS          => "c:\\Automatos\\$AUTOMATOS_VERSION\\bin\\automatos.pl";
Readonly my $AUTOMATOS          => "C:\\workspace\\int-block-dedup\\Automatos\\Framework\\Dev\\bin\\automatos.pl";
Readonly my $INCLUDE_DEV        => 'C:\\workspace\\int-block-dedup\\Automatos\\Tests\\Dev';
Readonly my $CONFIGFILE         => 'C:\\workspace\\int-block-dedup\\Automatos\\Tests\\Dev\\ST_Automation\\SYSTEM_KH_SMIS\\mainConfigFile.xml';

my $cmd = "$PERL -I $INCLUDE_DEV $AUTOMATOS --configFile $CONFIGFILE";
print "$cmd\\n";
system $cmd;