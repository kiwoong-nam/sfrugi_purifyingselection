use strict;

########################################################
# real data
#	r= ((0.1415/0.2023))/((0.1950/0.2685)) = 0.9630975
#	diff.fs=0.1950-0.1415 = 0.0535
#	diff.syn=0.2685-0.2023 = 0.0662
########################################################

my $resD='/home/kiwoong/Projects/sfrugi_purifyingselection/LagPhase/test/result';
my $output='/home/kiwoong/Projects/sfrugi_purifyingselection/LagPhase/test/compiled.res.txt';
my $output_report='/home/kiwoong/Projects/sfrugi_purifyingselection/LagPhase/test/report.txt';
my $B=1000;

my $p_r=0;
my $p_fs=0;
my $p_syn=0;

my $rep=0;
my $res="replicate\tp1.fs\tp1.syn\tp2.fs\tp2.syn\tr\n";

for(my $b=0;$b<$B;$b++)
{
	my $F1="$resD/$b.p1.txt";
	my $F2="$resD/$b.p2.txt";
	if (-e $F1 and -e $F2)
	{
		$rep++;

		my @p1=cts($F1);
		my @p2=cts($F2);

		my $r=($p2[0]/$p1[0])/($p2[1]/$p1[1]);
	
		if($r >= 0.9630975) {$p_r++}
		if( ($p1[0]-$p2[0]) >= 0.0535) {$p_fs++}
		if( ($p1[1]-$p2[1]) >= 0.0662) {$p_syn++}
		
		
		print ("$b : ",($p1[0]-$p2[0])," ",($p1[1]-$p2[1])," $r\n");
		$res.="$b\t$p1[0]\t$p1[1]\t$p2[0]\t$p2[1]\t$r\n";
	}
}

$p_r=$p_r/$rep;
$p_syn=$p_syn/$rep;
$p_fs=$p_fs/$rep;

my $report="***real data
	r= ((0.1415/0.2023))/((0.1950/0.2685)) = 0.9630975
	diff.fs=0.1950-0.1415 = 0.0535
	diff.syn=0.2685-0.2023 = 0.0662
***p valus for
	frameshift: $p_fs
	synonymour: $p_syn
	r: $p_r
***number of replications : $rep
";

print $report;

####

open my $fd,">$output";
print $fd $res;
close $fd;

open my $fd,">$output_report";
print $fd $report;
close $fd;

####

sub cts
{
	(my $Fn)=(@_);

	my @Sum;
	open my $fd,$Fn;
	while(<$fd>)
	{
		$_=~s/\n//;
		if($_=~/nonshare/) {next}
		my @s=split("\t",$_);
		$Sum[0]+=$s[2];
		$Sum[1]+=$s[3];
		$Sum[2]+=$s[4];
		$Sum[3]+=$s[5];
	}
	
	my $p1_fs=$Sum[0]/($Sum[0]+$Sum[1]);
	my $p1_syn=$Sum[2]/($Sum[2]+$Sum[3]);
	return ($p1_fs,$p1_syn);
}

