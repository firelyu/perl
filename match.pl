#!/usr/bin/perl

use strict;
use warnings;

my $string  = "line1\nline2\nline3";
$string  =~ /(.*)\n.*/;

my $line1   = $1;

print "$string";
print "line1 : $line1\n";
print "Hello\n";
