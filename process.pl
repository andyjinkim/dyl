#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use Text::CSV_XS qw( csv );

my @rows;
# Read/parse CSV
# creating an instance of variable $csv, which is defined as a CSV file type.
my $csv = Text::CSV_XS->new ({ 
	'binary' => 1, 
	'auto_diag' => 1,
	'allow_loose_quotes' => 1	
});
# opening the file prepaid.csv
open my $fh, "<", "prepaid.csv" or die "prepaid.csv: $!";
# reading the csv file and turning it into an array, if formatted properly
while (my $row = $csv->getline ($fh)) {
#     $row->[2] =~ m/pattern/ or next; # 3rd field should match
    push @rows, $row;
    }
close $fh;

# print Dumper(\@rows);

#### TOTAL UP THE PREPAID REVENUE OUTSTANDING
my $prepaid = 0;
my $presum = 0;
# $#row == (scalar(@rows)-1)
for my $i (1 .. $#rows){
# s = substitute, ',', with whatever is between the next double slashes, globally
	$rows[$i][5] =~ s/,//g;
	$presum = ($rows[$i][4] * $rows[$i][5]);
	$prepaid = $prepaid + $presum;
}

# print Dumper($prepaid);

#### LIST NUMBER OF USERS THAT REBILL ON A GIVEN DATE
my %days = ();
my %months = ();
my $header = undef;

while (my $row = $csv->getline($fh))
{
	unless (defined $header)
	{
	$header = $row;
	next;
	}
	$days{$row->[2]}++;
	my $month = substr($row->[2], 0, 7);
	$months{$month}++;
	}
	close $fh;

foreach my $day (sort keys %days){
	print "$day: $days{$day}\n";
}

foreach my $m (sort keys %months){
	print "$m: $months{$m}\n";
}

# LIST THE NUMBER OF USERS THAT REBILL ON A GIVEN DATE

# Project 1: Total up the prepaid revenue outstanding DONE
# Project 2: List number of users that rebill on a given date
# 2016-03-15: 4
# 2016-03-16: 23

# try to fill file.csv with the data in prepaid.csv
# go back to rosettacode
# create a script that multiplies the amount times months left, and add it up to one total
# try to create a hash that displays how many users rebill on specific dates