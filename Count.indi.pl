use strict;

my $inD='/home/kiwoong/Projects/sfrugi_purifyingselection/VCF/FC';
my $outF='/home/kiwoong/Projects/sfrugi_purifyingselection/Count/indi.txt';

my @cate=qw(Native Invasive);
my $res="origin\tsN\tfs\tsyn\n";

foreach my $ct (@cate)
{
	my @fs=cts("$inD/$ct/frameshift.vcf.gz");
	my @syn=cts("$inD/$ct/synonymous.vcf.gz");

	for(my $i=0;$i<=$#fs;$i++)
	{
		$res.="$ct\t$i\t$fs[$i]\t$syn[$i]\n";
	}
}

open my $fd,">$outF";
print $fd $res;
close $fd;

sub cts
{
	(my $fileIn)=(@_);
	
	my @ccts;
	open my $fd,"zcat $fileIn | ";
	while(<$fd>)
	{
		if($_=~/0[\||\/]1/ or $_=~/1[\||\/]1/)
		{
			$_=~s/\n//;
			my @s=split("\t",$_);	
			
			for(my $i=9;$i<=$#s;$i++)
			{	
				$s[$i]=~s/:.*$//;
				if($s[$i]=~/1/) {$ccts[$i]++}
			}
		}
	}
	close $fd;

	for(my $i=0;$i<9;$i++) {shift @ccts}
	return @ccts
}

