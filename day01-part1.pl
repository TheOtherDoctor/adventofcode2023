#!/usr/bin/perl -w
# AoC 2023 day01 part 1. CarpeNoctem.
open(inp,"day01-input") or die;
my $sum=0;
while(<inp>){
  my $n=0;
  chomp();
  if(m/(\d)[^\d]*$/){$n=$n+$1;}
  if(m/^[^\d]*(\d)/){$n=$n+$1*10;}
  print "num is $n\n";
  $sum=$sum+$n;
  }
close(inp);
print "---> sum is $sum\n";
exit(0);
