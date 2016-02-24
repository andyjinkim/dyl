#!/usr/bin/perl
use strict;
use warnings;

use Test::More 'no_plan';

# test base object
use_ok('Slider');

my @games = ();
foreach my $i (1..20)
{
	my $game = undef;	
	eval {
		$game = new Slider(
			'board_size' => $i,
		);
	};
	if ($i < 4 || $i > 10) {
		ok ( ! defined ($game), 'Bad game spec is undefined');
	}
	else
	{
		ok ( defined ($game), 'Good game spec is defined');
	}
	if (defined $game)
	{
		isa_ok( $game, 'Slider' );
		push @games, $game;
	}
}

# test initial start

my $maingame = $games[0];
my $board = $maingame->get_initial_board();
#my $board = [];
my $size = $maingame->{'board_size'};
my %numcheck = ();
foreach my $i (1..(($size * $size) - 1))
{
	$numcheck{$i} = 1;
}

isa_ok( $board, 'ARRAY');
ok ( scalar(@$board) == $size , 'board root array size' );
foreach my $row (@$board)
{
	isa_ok( $row, 'ARRAY');
	ok ( scalar(@$row) == $size , 'row array size');

	foreach my $col (@$row)
	{
		if (! defined ($col))
		{	
			next;
		}
		ok ( exists $numcheck{$col} , 'check for piece' );
		delete $numcheck{$col};
	}
}
ok (scalar(keys( %numcheck )) == 0, 'found all pieces' );

# test moving pieces 

# test winning conditions

# test view

