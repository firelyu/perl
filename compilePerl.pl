use strict;
use warnings;
use Readonly;


Readonly my $PERL               => 'c:\Perl\\bin\\perl.exe';
Readonly my $INCLUDE_LIB        => "C:\\workspace\\int-block-dedup\\Automatos\\Framework\\Dev\\lib";
Readonly my $INCLUDE_TEST        => 'C:\\workspace\\int-block-dedup\\Automatos\\Tests\\Dev';

my $testSet = 'SYSTEM_KH_SMIS';
#my $perlFile = 'KH_CLI_Create_LUN.pm';
#my $perlFile = 'KH_CLI_Delete_LUN.pm';
#my $perlFile = 'KH_CLI_Create_NFS_Server.pm';
#my $perlFile = 'KH_CLI_Delete_NFS_Server.pm';
#my $perlFile = 'KH_CLI_Create_Filesystem.pm';
#my $perlFile = 'KH_CLI_Delete_Filesystem.pm';
my $perlFile = 'KH_SMIS_Create_Filesystem.pm';
$perlFile = $INCLUDE_TEST . '\\ST_Automation\\' . $testSet . '\\TestCase\\' . $perlFile;


my $cmd = "$PERL -c -I $INCLUDE_LIB -I  $INCLUDE_TEST $perlFile";
print "$cmd\\n";
system $cmd;
