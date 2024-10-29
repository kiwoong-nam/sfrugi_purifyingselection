v=read.table("/home/kiwoong/Projects/sfrugi_purifyingselection/Recessivity/inv_100kb.e2.txt",h=T,sep="\t")

fisher.test(matrix(c(sum(v[3]),sum(v[4]),sum(v[7]),sum(v[8])),ncol=2))


#	Fisher's Exact Test for Count Data
#
#data:  matrix(c(sum(v[3]), sum(v[4]), sum(v[7]), sum(v[8])), ncol = 2)
#p-value = 0.0003664
#alternative hypothesis: true odds ratio is not equal to 1
#95 percent confidence interval:
# 0.6686594 0.8938064
#sample estimates:
#odds ratio 
# 0.7743135 


fisher.test(matrix(c(sum(v[5]),sum(v[6]),sum(v[9]),sum(v[10])),ncol=2))

#	Fisher's Exact Test for Count Data
#
#data:  matrix(c(sum(v[5]), sum(v[6]), sum(v[9]), sum(v[10])), ncol = 2)
#p-value = 0.04597
#alternative hypothesis: true odds ratio is not equal to 1
#95 percent confidence interval:
# 1.003068 1.630472
#sample estimates:
#odds ratio 
#  1.278727 


