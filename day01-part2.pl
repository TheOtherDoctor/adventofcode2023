#!/usr/bin/perl -w
open(inp,"day01-demo") or die;
my $sum=0;
my @nw=qw( one two three four five six seven eight nine );
while(<inp>){
  my $n=0;
  chomp();
  print "$_ -> ";
  # replace all number words by digits;
  # 0. there are only few special overlap cases:
  # searching digit from left: ( eightwo=>82, eighthree=>83, sevenine=>79, nineight=>98, twone=>2 );
  # searching digit from right: ( twone=>1, eightwo=>2, eighthree=>3, sevenine=>9, nineight=>8 );
  # approach: clean these cases with minimum effort...
  # 1. prepare the ugly interlink cases:
  s/eight/eeightt/;
  s/one/oonee/;
  s/two/ttwoo/;
  s/nine/nninee/;
  s/seven/sevenn/;
  s/three/tthree/;
  # end duplication cannot mess anything up, as we only duplicate letters 
  # in a place where they were already, so no new valid words can appear. ;-)
  my $c=1;
  foreach my $i (@nw){
    s/$i/$c/gi;
    $c=$c+1;
  }
  print "$_ -> ";
  # last digit:
  if($_=~m/(\d)[^\d]*$/){$n=$n+$1;}
  # first digit (might be the same one), take *10:
  if($_=~m/^[^\d]*(\d)/){$n=$n+$1*10;}
  print "$n.\n";
  $sum=$sum+$n;
  }
close(inp);
print "---> sum is $sum\n";
# bye.
exit(0);
