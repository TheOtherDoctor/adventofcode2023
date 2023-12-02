#!/usr/bin/perl -w
open(inp,"day01-input") or die;
my $sum=0;
# numberwords:
my @nw=qw( one two three four five six seven eight nine );
# loop over input and grab number from each line:
while(<inp>){
  my $n=0;
  chomp();
  print "$_ -> ";
  # replace all number words by digits;
  # 1. fix the few ugly interlink cases with minimum effort:
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
  # number done.
  print "$n.\n";
  $sum=$sum+$n;
  }
close(inp);
print "---> sum is $sum\n";
exit(0);
