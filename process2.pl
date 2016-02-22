#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use Text::CSV_XS qw( csv ); #a module 
# Read/parse CSV
my $csv = Text::CSV_XS->new ({
	'binary' => 1,
	'auto_diag' => 1,
	'allow_loose_quotes' => 1,
});
open my $fh, "<", "prepaid.csv" or die "prepaid.csv: $!";


#### LIST NUMBER OF USERS THAT REBILL ON A GIVEN DATE

my $header = undef;
my %days = ();
my %months = ();
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
foreach my $day (sort keys %days)
{
	print "$day: $days{$day}\n";
}
foreach my $m (sort keys %months)
{
	print "$m: $months{$m}\n";
}