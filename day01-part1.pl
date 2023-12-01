#!/usr/bin/perl -w
open(inp,"day01-input") or die;
my $sum=0;
while(<inp>){
  my $n=0;
  chomp();
  my $s=$_;
  if(m/(\d)[^\d]*$/){$n=$n+$1;}
  if(m/^[^\d]*(\d)/){$n=$n+$1*10;}
  print "num is $n\n";
  $sum=$sum+$n;
  }
close(inp);
print "---> sum is $sum\n";
# bye.
exit(0);
