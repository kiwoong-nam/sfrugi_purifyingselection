use strict;

my $inD='/home/kiwoong/Projects/sfrugi_purifyingselection/VCF/FC';
my $outF='/home/kiwoong/Projects/sfrugi_purifyingselection/Count/global.txt';

my $res="origin\tfunc\tnum\n";
$res.="Total\tframeshift\t".nc("$inD/frameshift.vcf.gz")."\n";
$res.="Invasive\tframeshift\t".nc("$inD/Invasive/frameshift.vcf.gz")."\n";
$res.="Native\tframeshift\t".nc("$inD/Native/frameshift.vcf.gz")."\n";

$res.="Total\tsynonymous\t".nc("$inD/synonymous.vcf.gz")."\n";
$res.="Invasive\tsynonymous\t".nc("$inD/Invasive/synonymous.vcf.gz")."\n";
$res.="Native\tsynonymous\t".nc("$inD/Native/synonymous.vcf.gz")."\n";

open my $fd,">$outF";
print $fd $res;
close $fd;

########################################################
sub nc
{
	(my $fi)=(@_);

	my $na=0;
	open my $fd,"zcat $fi | ";
	while(<$fd>)
	{
		if($_=~/0[\||\/]1/ or $_=~/1[\||\/]1/)
		{
			$na++;
		}
	}
	close $fd;

	return $na;
}



