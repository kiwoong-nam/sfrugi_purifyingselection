#!/bin/bash

cd /home/kiwoong/Projects/sfrugi_purifyingselection/VCF/indel/

for i in $(seq 21 25);
do
  echo $i
  /home/kiwoong/bioinformatics/gatk-4.1.2.0/gatk SelectVariants -R /mnt/md0/sfrugiperda_SNP/Invasive/ref/$i.fa -select-type INDEL -V /mnt/md0/sfrugiperda_SNP/Invasive/vcf/$i.vcf.gz -O $i.INDEL.vcf.gz --max-indel-size 2 

  /home/kiwoong/bioinformatics/gatk-4.1.2.0/gatk VariantFiltration -R /mnt/md0/sfrugiperda_SNP/Invasive/ref/$i.fa -V /home/kiwoong/Projects/sfrugi_purifyingselection/VCF/indel/$i.INDEL.vcf.gz --filter-expression "QD < 2.0 || FS > 60.0 || MQ < 40.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" --filter-name "my_snp_filter" -O $i.INDEL.annotated.vcf.gz
  
  zcat $i.INDEL.annotated.vcf.gz | grep -P '#|PASS' | vcftools --vcf - --max-missing 0.5  --recode -c | bgzip -f > $i.INDEL.filtered.vcf.gz

  tabix -p vcf  $i.INDEL.filtered.vcf.gz
done

