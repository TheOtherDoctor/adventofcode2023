#!/usr/bin/perl -w

#example line: 
# Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green

my %possible=( red => 12, green=>13, blue=>14 );
open(inp,"day02-input") or die;
my $sum=0;
# numberwords:
my @nw=qw( one two three four five six seven eight nine );
# loop over input and grab number from each line:
while(<inp>){
  my $rest; # line content
  my $dn; # draw number
  # grab the number of the game:
  if(m/Game (\d+):(.*)$/){ $dn=$1; $rest=$2; }
  else{ die "oops? did not expect THAT: $_"; }
  # split the runs into an array:
  my @draws=split(';',$rest);
  print "handling content rest '$rest' ...\n";
  my $valid=1;
  # for each run, decompose into hash of draws:
  foreach my $draw (@draws){
    print "  handling draw '$draw' ...\n";
    my @drawcols=split(',',$draw);
    # for each draw, check against avail colorobjects if possible,
    # if not, eject to next line:
    foreach my $c (@drawcols){
      if($c =~ m/\s*(\d+)\s+(\D+)/){ 
        my $drawnum=$1; my $drawcol=$2;
        print "   got $drawnum of color $drawcol.\n";
        if($drawnum > $possible{$drawcol}){ $valid=0; } # else stays valid.
      } else { die "something strange happened."; }
    }
  }
  # all draws of this round fine? then add game number to sum:
  if($valid){ $sum=$sum+$dn; print("game fine, sum updated to $sum ... \n"); } 
  else { print "game invalid, not counting.\n"; }
}
close(inp);
print "end of last game.\n";
exit(0);
