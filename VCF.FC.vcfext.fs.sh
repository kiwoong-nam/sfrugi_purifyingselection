#!/bin/bash

cd /home/kiwoong/Projects/sfrugi_purifyingselection/VCF/FC

################## Frameshift
## Global

zcat ../INDEL.filtered.annotated.vcf.gz | grep -P "#|frameshift" | vcftools --vcf - --min-alleles 2 --max-alleles 2  --keep Samples.txt --recode --out frameshift

mv frameshift.recode.vcf frameshift.vcf
bgzip -f frameshift.vcf
tabix -p vcf frameshift.vcf.gz

## Invasive

vcftools --gzvcf frameshift.vcf.gz --keep Invasive.txt --recode --out Invasive/frameshift
mv Invasive/frameshift.recode.vcf Invasive/frameshift.vcf
bgzip -f Invasive/frameshift.vcf
tabix -p vcf Invasive/frameshift.vcf.gz

## Native

vcftools --gzvcf frameshift.vcf.gz --keep Native.txt --recode --out Native/frameshift
mv Native/frameshift.recode.vcf Native/frameshift.vcf
bgzip -f Native/frameshift.vcf
tabix -p vcf Native/frameshift.vcf.gz

## Benin

vcftools --gzvcf frameshift.vcf.gz --keep Benin.txt --recode --out Benin/frameshift
mv Benin/frameshift.recode.vcf Benin/frameshift.vcf
bgzip -f Benin/frameshift.vcf
tabix -p vcf Benin/frameshift.vcf.gz

## India

vcftools --gzvcf frameshift.vcf.gz --keep India.txt --recode --out India/frameshift
mv India/frameshift.recode.vcf India/frameshift.vcf
bgzip -f India/frameshift.vcf
tabix -p vcf India/frameshift.vcf.gz


