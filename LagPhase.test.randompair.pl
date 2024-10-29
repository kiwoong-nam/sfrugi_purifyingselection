use strict;
use List::Util qw/shuffle/;

my $p1F='/home/kiwoong/Projects/sfrugi_purifyingselection/VCF/FC/Benin.txt';
my $p2F='/home/kiwoong/Projects/sfrugi_purifyingselection/VCF/FC/India.txt';
my $outD='/home/kiwoong/Projects/sfrugi_purifyingselection/LagPhase/test/pairs';

my $B=1000;

my @samples;

my $nP1=0;
open my $fd,$p1F;
while(<$fd>)
{
	$_=~s/\n//;
	$nP1++;
	push @samples,$_;
}
close $fd;

my $nP2=0;
open my $fd,$p2F;
while(<$fd>)
{
	$_=~s/\n//;
	$nP2++;
	push @samples,$_;
}
close $fd;

for(my $b=0;$b<$B;$b++)
{
	my $bFP1="$outD/$b.p1";
	my $bFP2="$outD/$b.p2";
	
	my @bsample=shuffle @samples;

	my @bP1;
	my @bP2;
	
	for(my $i=0;$i<$nP1;$i++) {push @bP1,$bsample[$i]}
	for(my $i=$nP1;$i<($nP1+$nP2);$i++) {push @bP2,$bsample[$i]}
	
	my $bP1=join("\n",@bP1);
	my $bP2=join("\n",@bP2);
	
	open my $fd,">$bFP1";
	print $fd $bP1;
	close $fd;
	
	open my $fd,">$bFP2";
	print $fd $bP2;
	close $fd;

}
