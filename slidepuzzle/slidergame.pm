package Slider;
#use strict;
use warnings;
use Data::Dumper qw(Dumper);
use List::Util qw(shuffle);

#my $initial = join ",", qw(abcd efgh ijkl mnoB);

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
# Instead of hardcoding a game board, create an algorithm that creates a board of x size
# https://metacpan.org/pod/Array::Split
	# my @data = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, undef);
	my @data = @_;

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
	};

my @shuffled = shuffle @data;
my @shuffledarray = \@shuffled;
my @board = distribute(4, @shuffledarray);
print Dumper @board;
}

#my $b = $initial;

get_initial_board($b);

1;
