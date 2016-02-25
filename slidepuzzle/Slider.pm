package Slider;
#use strict;
use warnings;
use Data::Dumper qw(Dumper);
use List::Util qw(shuffle);

my @databoard;
my @board;

sub new
{
	my $class = shift;
	# If $_[0] is a reference, copy the underlying data %{$_[0]} into the %param variable. 
	my %param = (ref($_[0])) ? %{$_[0]} : @_;
	my $bsize = $param{'board_size'};
	unless (defined($bsize) && $bsize =~ /^\d+$/)
	{
		return undef;
	}
	if ($bsize < 4 || $bsize > 10) 
	{
		return undef;
	}
	#create_board
	my $obj = {
		'board_size' => $bsize,
	};
	bless $obj, $class;
	return $obj;
}

sub get_initial_board
{
	my $obj = shift;
	my $m = $obj->{'board_size'};
	@data = (1 .. (($m * $m) - 1));
	push @data, undef;				

	my @shuffled = shuffle @data;	
	my $databoard = distribute($m, \@shuffled);
	print Dumper $databoard;
	# $obj is a hash. storing the $databoard value in the key board 
	$obj->{'board'} = $databoard;
	return $databoard;
}

sub distribute
{
	my($n, $array) = @_;
	my @parts;
	my $i = 0;
	foreach my $elem (@$array)
	{
		push @{$parts[$i++ % $n]}, $elem;
	};
	return \@parts;
}

sub print_board
{
	my $obj = shift;
	my $board = $obj->{'board'};
	my $spaces = "--+";
	my $rows = "\n|";
	foreach my $outer (0 .. $#{$board})
	{
		print "$rows";
		my $inner = $board->[$outer];
		foreach my $col (0 .. $#{$inner})
		{
			print "$spaces". [$inner];
		}
	}
	print Dumper $board;
}

1;
