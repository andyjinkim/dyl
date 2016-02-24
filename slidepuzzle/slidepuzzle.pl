#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

use Slider;

my $game = new Slider(
	'board_size' => 4,
);

#print Dumper($game);

my $board = $game->get_initial_board();

print "Initial Board: ". Dumper($board);

$game->print_board();

#while (! $game->won())
#{
#	$game->move();
#}

#$game->play(); # main loop

