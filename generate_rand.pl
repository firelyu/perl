use strict;
use warnings;

use Readonly;

Readonly my $DEFAULT_RANGE => 512;

sub gen_rand {
    my $range   = shift;
    my $seed    = shift;
    
    if (defined $seed) {
        srand $seed;
    }
    
    $range = defined $range ? $range : $DEFAULT_RANGE;

    if (defined $seed) {
        print("range : $range seed : $seed\n");
    }
    else {
        print("range : $range\n");
    }

    return int(rand($range));
}

sub main {
    my $round   = shift;
    my $range   = shift;
    my $seed    = shift;

    foreach (1..$round) {
        my $number = gen_rand($range, $seed);
        print("generate : $number\n");
    }

    return;
}

main @ARGV;
