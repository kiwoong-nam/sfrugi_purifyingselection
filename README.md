### Identification of frameshift or synonymous mutations
VCF.indel.ext.1.sh: The extraction of indel mutations, followed by filtering for the chromosomes between 1 and 5

VCF.indel.ext.2.sh: The extraction of indel mutations, followed by filtering for the chromosomes between 6 and 10

VCF.indel.ext.3.sh: The extraction of indel mutations, followed by filtering for the chromosomes between 11 and 15

VCF.indel.ext.4.sh: The extraction of indel mutations, followed by filtering for the chromosomes between 16 and 20

VCF.indel.ext.5.sh: The extraction of indel mutations, followed by filtering for the chromosomes between 21 and 55

VCF.indel.ext.6.sh: The extraction of indel mutations, followed by filtering for the chromosomes between 25 and 29

VCF.indel.concate.sh: The concatenation of the vcf files containing indel mutations

VCF.FC.vcfext.fs.sh: The extraction of biallelic frameshift mutations

VCF.FC.vcfext.syn.sh The extraction of biallelic synonymous mutations

VCF.FC.mac.sh: Generation of a VCF file excluding singleton polymorphisms or retaining non-reference genotypes with an allele frequency of 2.

### Counting the number of synonymous or frameshift genetic variant positions
Count.global.pl: Counting the total number of synonymous or frameshift genetic variant positions in invasive or native populations

Count.indi.pl: Counting the number of synonymous or frameshift genetic variant positions for each sample in invasive or native populations

Count.stattest.R: Fisher's exact test to compare the number of synonymous or frameshift genetic variant positions between invasive or native populations

Count.vis.R: To generate Fig 1A

### Counting the number of shared polymorphisms between native and invasive populations
Flow.inv.pl: Counting the number of shared synonymous or frameshift genetic variant positions between invasive and native populations in 100kb windows

Flow.CI.R: Calculating the proportion of shared synonymous or frameshift genetic variant positions with 95% bootstrapping confidence intervals

Flow.fstest.R: Fisher's exact test to compare the proportions of shared synonymous and frameshift genetic variant positions

Flow.vis.R: To generate Fig 1B

### Counting the number of synonymous or frameshift genetic variant positions without singleton polymorphisms in native populations
SynGen.flow.pl: Counting the total number of synonymous or frameshift genetic variant positions in invasive or native populations without singleton polymorphisms

SynGen.CI.R: Counting the number of synonymous or frameshift genetic variant positions without singleton polymorphisms for each sample in invasive or native populations

SynGen.fstest.R: Fisher's exact test to compare the number of synonymous or frameshift genetic variant positions without singleton polymorphisms between invasive or 
native populations

SynGen.vis.R: To generate Fig 1C

### Counting the number of synonymous or frameshift genetic variant positions existing heterozysity or homozygosity in native populations
Recessivity.flow.pl: Counting the total number of synonymous or frameshift genetic variant positions in invasive or native populations for the variations existing heterozysity or homozygosity in native populations

Recessivity.CI.R: Counting the number of synonymous or frameshift genetic variant positions for the variations existing heterozygosity or homozygosity in native populations

Recessivity.fstest.R: Fisher's exact test to compare the number of synonymous or frameshift genetic variant positions for the variations existing heterozysity or homozygosity in native populations

Recessivity.vis.R: To generate Fig 2

### Counting the number of shared polymorphisms between native and Beninese or Indian populations
LagPhase.BNflow.pl: Counting the number of shared synonymous or frameshift genetic variant positions between Beninese and native populations in 100kb windows

LagPhase.INflow.pl: Counting the number of shared synonymous or frameshift genetic variant positions between Indian and native populations in 100kb windows

LagPhase.CI.R: Calculating the proportion of shared synonymous or frameshift genetic variant positions between native populations and the Beninese or Indian populations with 95% bootstrapping confidence intervals

LagPhase.fstest.R: Fisher's exact test to compare the proportions of shared synonymous and frameshift genetic variant positions for the Beninese or Indian samples

LagPhase.vis.R: Generation of Fig 3

#permutation test
LagPhase.test.randompair.pl: Generation of 1,000 random pairs for permutation test

LagPhase.test.randomVCF.fs.sh: Generation of vcf files containing frameshift mutations based on the random pairs 

LagPhase.test.flow.1.pl: Counting the number of shared synonymous or frameshift genetic variant positions between the random pairs in 100kb windows for the 
bootstrapping between 1-500

LagPhase.test.flow.2.pl: Counting the number of shared synonymous or frameshift genetic variant positions between the random pairs in 100kb windows for the bootstrapping between 501-1000

LagPhase.test.finalizing.pl: Calculation of p values 

