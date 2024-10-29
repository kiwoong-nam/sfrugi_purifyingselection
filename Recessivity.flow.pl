use strict;

my $inD='/home/kiwoong/Projects/sfrugi_purifyingselection/VCF/FC';
my $outF='/home/kiwoong/Projects/sfrugi_purifyingselection/Recessivity/inv_100kb.e2.txt';
my $WS=100000;

my ($Hfs_share_het,$Hfs_nonshare_het,$Hfs_share_hom,$Hfs_nonshare_hom)=colI("$inD/Native/frameshift.e2.vcf.gz","$inD/Invasive/frameshift.vcf.gz");
my ($Hsyn_share_het,$Hsyn_nonshare_het,$Hsyn_share_hom,$Hsyn_nonshare_hom)=colI("$inD/Native/synonymous.e2.vcf.gz","$inD/Invasive/synonymous.vcf.gz");

my @ws=keys (%$Hsyn_share_het);

my $res="chro\tpos\thet.fs.share\thet.fs.nonshare\thom.fs.share\thom.fs.nonshare\thet.syn.share\thet.syn.nonshare\thom.syn.share\thom.syn.nonshare\n";

foreach my $w (@ws)
{
	$w=~/HiC_scaffold_(\d+)/;
	if($1 < 30) { $res.="$w\t$$Hfs_share_het{$w}\t$$Hfs_nonshare_het{$w}\t$$Hfs_share_hom{$w}\t$$Hfs_nonshare_hom{$w}\t$$Hsyn_share_het{$w}\t$$Hsyn_nonshare_het{$w}\t$$Hsyn_share_hom{$w}\t$$Hsyn_nonshare_hom{$w}\n";}
}

$res=~s/\t\t/\t0\t/g;
$res=~s/\t\t/\t0\t/g;
$res=~s/\t\n/\t0\n/g;
$res=~s/\t\n/\t0\n/g;

open my $fd,">$outF";
print $fd $res;
close $fd;	

sub colI
{
	(my $fN,my $fI)=(@_);

	my %NAT;
	open my $fd,"zcat $fI | ";
	while(<$fd>)
	{
		if($_=~/0[\||\/]1/ or $_=~/1[\||\/]1/)
		{
			my @s=split("\t",$_);	
			my $key="$s[0]\t$s[1]";
			if($_!~/1[\||\/]1/) {$NAT{$key}=1}
			else {$NAT{$key}=2}		
		}
	}
	close $fd;
	
	my %share_het;
	my %nonshare_het;
	my %share_hom;
	my %nonshare_hom;
	
	open my $fd,"zcat $fN | ";
	while(<$fd>)
	{
		if($_=~/0[\||\/]1/ and $_!~/1[\||\/]1/)
		{
			my @s=split("\t",$_);	
			my $key="$s[0]\t$s[1]";
			my $KW="$s[0]\t".int ($s[1]/$WS);

			if($NAT{$key}==1) {$share_het{$KW}++}
			elsif($NAT{$key}!=2) {$nonshare_het{$KW}++}		
		}
		elsif($_=~/1[\||\/]1/)
		{
			my @s=split("\t",$_);	
			my $key="$s[0]\t$s[1]";
			my $KW="$s[0]\t".int ($s[1]/$WS);

			if($NAT{$key}==1 or $NAT{$key}==2) {$share_hom{$KW}++}
			elsif($NAT{$key} eq '') {$nonshare_hom{$KW}++}
		}
	}
	close $fd;

	undef %NAT;

	return(\%share_het,\%nonshare_het,\%share_hom,\%nonshare_hom);

}



