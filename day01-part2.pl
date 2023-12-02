#!/usr/bin/perl -w
open(inp,"day01-demo") or die;
my $sum=0;
my @nw=qw( one two three four five six seven eight nine );
while(<inp>){
  my $n=0;
  chomp();
  print "$_ -> ";
  # replace all number words by digits:
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
