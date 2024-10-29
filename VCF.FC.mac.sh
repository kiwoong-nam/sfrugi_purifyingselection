#!/bin/bash

cd /home/kiwoong/Projects/sfrugi_purifyingselection/VCF/FC/Native

vcftools --gzvcf frameshift.vcf.gz --mac 2 --recode -c | gzip -f > frameshift.m2.vcf.gz
vcftools --gzvcf synonymous.vcf.gz --mac 2 --recode -c | gzip -f > synonymous.m2.vcf.gz

vcftools --gzvcf frameshift.vcf.gz --mac 2 --max-mac 2 --recode -c | gzip -f > frameshift.e2.vcf.gz
vcftools --gzvcf synonymous.vcf.gz --mac 2 --max-mac 2 --recode -c | gzip -f > synonymous.e2.vcf.gz


