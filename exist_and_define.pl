# Test the difference of defined() and exists().
# defined() - Check the value is not 'undef'.
# exists()  - Check the key exist in the hash. Check the key is initialized,
#             Not matter the value is 'undef' or defined.
use strict;
use warnings;

sub main {
    my $scalar      = undef;
    if (defined $scalar) {
        print "The scalar is defined, and the value is $scalar.\n";
    }
    else {
        print "Not defined the scalar.\n";  # printed.
    }

    my %hash    = ();
    my $key     = 'key';
    if (exists $hash{$key}) {
        print "The key exist.\n";
    }
    else {
        print "The key does not exist.\n";  # printed.
    }

    if ($hash{$key}) {
        print "The key exist, and the value is defined.\n";
    }
    else {
        print "Either the key don't eixst, nor the value is not defined.\n";    # printed.
    }

    $hash{$key} = undef;
    if (exists $hash{$key}) {
        print "The key exist.\n";   # printed.
    }
    else {
        print "The key does not exist.\n";
    }

    if ($hash{$key}) {
        print "The key exist, and the value is defined.\n";
    }
    else {
        print "Either the key don't eixst, nor the value is not defined.\n";    # printed.
    }

    $hash{$key} = 'Happy New Year.';
    if (exists $hash{$key}) {
        print "The key exist.\n";   # printed.
    }
    else {
        print "The key does not exist.\n";
    }

    if ($hash{$key}) {
        print "The key exist, and the value is defined.\n"; # printed.
    }
    else {
        print "Either the key don't eixst, nor the value is not defined.\n";
    }
    return;
}

main @_;
