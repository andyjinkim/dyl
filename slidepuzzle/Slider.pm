package Slider;
#use strict;
use warnings;
use Data::Dumper qw(Dumper);

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
	my @array1 = (1, 2, 3, 4);
	my $ref1 = \@array1;
	my @array2 = (5, 6, 7, 8);
	my $ref2 = \@array2;
	my @array3 = (9, 10, 11, 12);
	my $ref3 = \@array3;
	my @array4 = (13, 14, 15, undef);
	my $ref4 = \@array4;

	my @board = ($ref1, $ref2, $ref3, $ref4);
	my $boardref = \@board;
	
	print Dumper $boardref;

	#return $boardref;
	#print @$initial, "\n";
	#my ($b) = @_;
	#$b =~ s/\B/|/g;
	#$b =~ s/,/\n-+-+-+-\n/g;
	#print $b, "\n";
}

sub move
{
	if 
}

#my $b = $initial;

get_initial_board($b);

1;
