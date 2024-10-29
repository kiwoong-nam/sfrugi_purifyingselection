v=read.table("/home/kiwoong/Projects/sfrugi_purifyingselection/Flow/inv_100kb.txt",h=T,sep="\t")

fisher.test(matrix(c(sum(v[3]),sum(v[4]),sum(v[5]),sum(v[6])),ncol=2))

#	Fisher's Exact Test for Count Data
#
#data:  matrix(c(sum(v[3]), sum(v[4]), sum(v[5]), sum(v[6])), ncol = 2)
#p-value < 2.2e-16
#alternative hypothesis: true odds ratio is not equal to 1
#95 percent confidence interval:
# 0.6571062 0.7383592
#sample estimates:
#odds ratio 
# 0.6967324 

