#!/usr/bin/perl

use strict;
use warnings;

use Readonly;

Readonly my $monthDayList => {
    'jan'   => 31,
    'feb'   => 28,
    'feb_leap' => 29,
    'mar'   => 31,
    'apr'   => 30,
    'may'   => 31,
    'jun'   => 30,
    'jul'   => 31,
    'aug'   => 31,
    'sep'   => 30,
    'oct'   => 31,
    'nov'   => 30,
    'dec'   => 31,
};

Readonly my $yearDayList => {
    'normal_year'   => 365,
    'leap_year'     => 366,
};

sub printDate
{
    my ($day) = @_;
    
    printf "%i, %i, %i\n", ($day->{'year'}, $day->{'month'}, $day->{'day'});
    
    return;
}

sub isLeapYear
{
    my ($year) = @_;
    
    return 1 if ($year % 4 == 0 && $year % 100 != 0);
    return 1 if ($year % 400 == 0);
    
    return 0;
}

sub calculatDeltaDays
{
    my ($startDay, $endDay) = @_;
    
    my $anchorDay = {};
    
    $anchorDay->{'year'} = $startDay->{'year'};
    $anchorDay->{'month'} = 1;
    $anchorDay->{'day'} = 1;
    
    my $deltaDays = calculatDays2Anchor($anchorDay, $endDay)
        - calculatDays2Anchor($anchorDay, $startDay);
    
    return $deltaDays;
}

sub calculatDays2Anchor
{
    my ($anchorDay, $endDay) = @_;
    
    my $sumDays = 0;
    
    $sumDays += calculateDeltaDayDays($anchorDay, $endDay);
    $sumDays += calculateDeltaMonthDays($anchorDay, $endDay);
    $sumDays += calculateDeltaYearDays($anchorDay, $endDay);
    
    return $sumDays;
}

sub calculateDeltaDayDays
{
    my ($anchorDay, $endDay) = @_;
    
    return $endDay->{'day'} - $anchorDay->{'day'};
}

sub calculateDeltaMonthDays
{
    my ($anchorDay, $endDay) = @_;
    
    my $sumDays = 0;
    my $month = $anchorDay->{'month'};
    while ($month < $endDay->{'month'}) {
        $sumDays += $monthDayList->{'jan'} if ($month == 1);
        if ($month == 2) {
            if (isLeapYear($endDay->{'year'})) {
                $sumDays += $monthDayList->{'feb_leap'};
            }
            else {
                $sumDays += $monthDayList->{'feb'};
            }
        }
        $sumDays += $monthDayList->{'mar'} if ($month == 3);
        $sumDays += $monthDayList->{'apr'} if ($month == 4);
        $sumDays += $monthDayList->{'may'} if ($month == 5);
        $sumDays += $monthDayList->{'jun'} if ($month == 6);
        $sumDays += $monthDayList->{'jul'} if ($month == 7);
        $sumDays += $monthDayList->{'aug'} if ($month == 8);
        $sumDays += $monthDayList->{'sep'} if ($month == 9);
        $sumDays += $monthDayList->{'oct'} if ($month == 10);
        $sumDays += $monthDayList->{'nov'} if ($month == 11);
        # $sumDays += $monthDayList->{'dec'} if ($month == 12);
        
        $month ++;
    }
    
    return $sumDays;
}

sub calculateDeltaYearDays
{
    my ($anchorDay, $endDay) = @_;
    
    my $sumDays = 0;
    my $year = $anchorDay->{'year'};
    while ($year < $endDay->{'year'}) {
        $sumDays += $yearDayList->{'normal_year'};
        $sumDays += 1 if (isLeapYear($year));
        
        $year ++;
    }
    
    return $sumDays;
}

# Main
my $startDay = {
    'year'  => 2010,
    'month' => 1,
    'day'   => 1,
};
my $endDay = {
    'year'  => 2013,
    'month' => 1,
    'day'   => 1,
};

print "Start day : ";
printDate($startDay);
print "End day : ";
printDate($endDay);

print "The days between start day and the end day is "
    . calculatDeltaDays($startDay, $endDay) . ".\n";
