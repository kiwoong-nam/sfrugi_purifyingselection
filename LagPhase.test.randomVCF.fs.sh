#!/bin/bash

cd /home/kiwoong/Projects/sfrugi_purifyingselection/LagPhase/test/VCF

VCFINDEL=/home/kiwoong/Projects/sfrugi_purifyingselection/VCF/FC/frameshift.vcf.gz
VCFSNV=/home/kiwoong/Projects/sfrugi_purifyingselection/VCF/FC/synonymous.vcf.gz

st=0
ed=1000

for b in $(seq $st $ed);
do
  vcftools --gzvcf $VCFINDEL --keep ../pairs/$b.p1 --recode --out frameshift.$b.p1
  mv frameshift.$b.p1.recode.vcf frameshift.$b.p1.vcf
  bgzip -f frameshift.$b.p1.vcf
  tabix -p vcf frameshift.$b.p1.vcf.gz

  vcftools --gzvcf $VCFINDEL --keep ../pairs/$b.p2 --recode --out frameshift.$b.p2
  mv frameshift.$b.p2.recode.vcf frameshift.$b.p2.vcf
  bgzip -f frameshift.$b.p2.vcf
  tabix -p vcf frameshift.$b.p2.vcf.gz
done



