use strict;
use warnings;

LINE:
while (my $line = <>) {
    exit if $line =~ m/quit/x;
    next LINE if $line !~ qr/ \A \# ([^\n]+ \n?) \z/mx;
    print $1;
}