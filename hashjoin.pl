############################
# http://rosettacode.org/wiki/Hash_join#Perl
# Understand hashjoins by Monday
# http://www.amazon.com/Programming-Perl-Edition-Larry-Wall/dp/0596000278
# http://qntm.org/files/perl/perl.html 

# import the Dumper() subroutine
use Data::Dumper qw(Dumper);
 
#  defining table1 & table2 arrays
@table1 = ([27, "Jonah"],
           [18, "Alan"],
           [28, "Glory"],
           [18, "Popeye"],
           [28, "Alan"]);
           
@table2 = (["Jonah", "Whales"],
           ["Jonah", "Spiders"],
           ["Alan", "Ghosts"],
           ["Alan", "Zombies"],
           ["Glory", "Buffy"]);
 
#  function hashJoin
sub hashJoin {
# $table1 = @table1, the full array
# $table2 = @table2, the full array
# $index1 is the first instance of a string or substring in $table1, so $index1 = 1, since "Jonah" is in position 1
# $index2 is the first instance of a string or substring in $table2, so $index2 = 0, since "Jonah" is in position 0
    my ($table1, $index1, $table2, $index2) = @_;
# instantiating new hash %h, with undefined key value pairs
# how does it know to create 5 key value pairs?
    my %h;
# hash phase
# iterating over @$table1. $s is like "i" in JS
    foreach my $s (@$table1) {
#     pushing object values into undefined hash $h. 		
	push @{ $h{$s->[$index1]} }, $s;
    }

    print Dumper(\%h), "\n";
    # join phase
    map { my $r = $_;
	  map [$_, $r], @{ $h{$r->[$index2]} }
    } @$table2;
}
 

 
$Data::Dumper::Indent = 0;
# 1 signifies matching the 1st index of @table1, with 0 index of @table2
foreach my $row (hashJoin(\@table1, 1, \@table2, 0)) {
#     print Dumper($row), "\n";
}
