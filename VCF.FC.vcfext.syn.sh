#!/bin/bash

cd /home/kiwoong/Projects/sfrugi_purifyingselection/VCF/FC

################## SYNONYMOUS
## Global

zcat ../Invasive.SNP.filtered.annotated.vcf.gz | grep -P "#|synonymous_variant" | vcftools --vcf - --min-alleles 2 --max-alleles 2  --keep Samples.txt --recode --out synonymous

mv synonymous.recode.vcf synonymous.vcf
bgzip -f synonymous.vcf
tabix -p vcf synonymous.vcf.gz

## Invasive

vcftools --gzvcf synonymous.vcf.gz --keep Invasive.txt --recode --out Invasive/synonymous
mv Invasive/synonymous.recode.vcf Invasive/synonymous.vcf
bgzip -f Invasive/synonymous.vcf
tabix -p vcf Invasive/synonymous.vcf.gz

## Native

vcftools --gzvcf synonymous.vcf.gz --keep Native.txt --recode --out Native/synonymous
mv Native/synonymous.recode.vcf Native/synonymous.vcf
bgzip -f Native/synonymous.vcf
tabix -p vcf Native/synonymous.vcf.gz

## Benin

vcftools --gzvcf synonymous.vcf.gz --keep Benin.txt --recode --out Benin/synonymous
mv Benin/synonymous.recode.vcf Benin/synonymous.vcf
bgzip -f Benin/synonymous.vcf
tabix -p vcf Benin/synonymous.vcf.gz

## India

vcftools --gzvcf synonymous.vcf.gz --keep India.txt --recode --out India/synonymous
mv India/synonymous.recode.vcf India/synonymous.vcf
bgzip -f India/synonymous.vcf
tabix -p vcf India/synonymous.vcf.gz


