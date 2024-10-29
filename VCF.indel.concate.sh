#!/bin/bash

cd /home/kiwoong/Projects/sfrugi_purifyingselection/VCF/indel/

vcf-concat *.INDEL.filtered.vcf.gz | bgzip -f > ../INDEL.filtered.vcf.gz

cd ..

tabix -p vcf  INDEL.filtered.vcf.gz

