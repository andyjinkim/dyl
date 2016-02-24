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
# Instead of hardcoding a game board, create an algorithm that creates a board of x size
# https://metacpan.org/pod/Array::Split
	# my @data = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, undef);
	
	print "How many rows (3-6) do you want in your game board? ";
	defined(my $m = <>) or return;
	#chomp($m);
	#return($m);
	if($m == 3)
	{
		@data = (1 .. 8);
		push @data, 'undef';			
	}
	elsif($m == 4)
	{
		@data = (1 .. 15);
		push @data, 'undef';
	}
	elsif($m == 5)
	{
		@data = (1 .. 24);
		push @data, undef;
	}
	elsif($m == 6)
	{
		@data = (1 .. 35);
		push @data, undef;
	}
	else
	{
	print "Invalid number, restart game";
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
	};

#print Dumper \@data;
@databoard = distribute($m, \@data);
#print Dumper @databoard;
my @shuffled = shuffle @data;
my @shuffledarray = \@shuffled;
@board = distribute($m, @shuffledarray);
#print Dumper @board;
# swaps indexes
#($board[0][0][0], $board[0][0][1]) = ($board[0][0][1], $board[0][0][0]);
print Dumper @board;
}

get_initial_board($b);
#if(@board == @data)
#{
#	print Dumper "board", @board;
#	print Dumper "data", @data;
#	print "Congrats, you've completed the puzzle!\n" 
#}
#else
print Dumper @board, @databoard;
until(@board == @data)
{	
	print "Which number would you like to switch with undefined?";
	defined(my $p = <>) or return;
	my $index1;
	my $index2;
	my $index3;
	my $index4;
	for($i=0; $i<3; $i++)
	{
		for($j=0; $j<3; $j++)
		{
			if($p == $board[0][$i][$j])
			{
				# This currently prints the index of the user input value				
				#print($i, " ",  $j, "\n");
				$index1 = $i;
				$index2 = $j;	
				print Dumper @board;
			};
		}; 
	};
	for($q=0; $q<3; $q++)
	{
		for($r=0; $r<3; $r++)
		{
			if($board[0][$q][$r] == undef)
			{
				#print($q, " ", $r, "\n");
				$index3 = $q;
				$index4 = $r;
			};
		};
	};
	print Dumper $index1;
	($board[0][$index1][$index2], $board[0][$index3][$index4]) = ($board[0][$index3][$index4], $board[0][$index1][$index2]);
	#($board[0][$i][$j], $board[0][$q][$r]) = ($board[0][$q][$r], $board[0][$i][$j]);
	#print Dumper([$board[0][$i][$j], $board[0][$q][$r]]);
	print Dumper @board;
};
#$index++ until $board[$index] == $p;# or $index > $#a;
#print $index; 

1;
