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
  #    it is enough to fix at one end, but possible multiple 
  # times per line, like this evil: "one8oneight"
  s/one/onee/g;
  s/two/twoo/g;
  s/three/threee/g;
  # four
  s/five/fivee/g;
  # six
  s/seven/sevenn/g;
  s/eight/eightt/g;
  s/nine/ninee/g;
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
  $sum=$sum+$n;
  print "$n.\n"."now sum=$sum.\n";
  }
close(inp);
print "---> final sum is $sum\n";
exit(0);
