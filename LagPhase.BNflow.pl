use strict;

my $inD='/home/kiwoong/Projects/sfrugi_purifyingselection/VCF/FC';
my $outF='/home/kiwoong/Projects/sfrugi_purifyingselection/LagPhase/inv_100kb.Benin.txt';
my $WS=100000;

my ($Hfs_share,$Hfs_nonshare)=colI("$inD/Native/frameshift.vcf.gz","$inD/Benin/frameshift.vcf.gz");
my ($Hsyn_share,$Hsyn_nonshare)=colI("$inD/Native/synonymous.vcf.gz","$inD/Benin/synonymous.vcf.gz");

my @ws=keys (%$Hsyn_share);

my $res="chro\tpos\tfs.share\tfs.nonshare\tsyn.share\tsyn.nonshare\n";
foreach my $w (@ws)
{
	$w=~/HiC_scaffold_(\d+)/;
	if($1 < 30) { $res.="$w\t$$Hfs_share{$w}\t$$Hfs_nonshare{$w}\t$$Hsyn_share{$w}\t$$Hsyn_nonshare{$w}\n"}
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
	
	my %share;
	my %nonshare;
		
	open my $fd,"zcat $fN | ";
	while(<$fd>)
	{
		if($_=~/0[\||\/]1/ and $_!~/1[\||\/]1/)
		{
			my @s=split("\t",$_);	
			my $key="$s[0]\t$s[1]";
			
			my $KW="$s[0]\t".int ($s[1]/$WS);
									
			
			if($NAT{$key}==1) {$share{$KW}++}
			elsif($NAT{$key}!=2) {$nonshare{$KW}++}
		}
	}
	close $fd;

	undef %NAT;
	
	return(\%share,\%nonshare);
}


