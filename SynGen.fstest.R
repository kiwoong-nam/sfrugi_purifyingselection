v=read.table("/home/kiwoong/Projects/sfrugi_purifyingselection/SynGen/inv_100kb.m2.txt",h=T,sep="\t")

fisher.test(matrix(c(sum(v[3]),sum(v[4]),sum(v[5]),sum(v[6])),ncol=2))

#	Fisher's Exact Test for Count Data
#
#data:  matrix(c(sum(v[3]), sum(v[4]), sum(v[5]), sum(v[6])), ncol = 2)
#p-value = 1.906e-05
#alternative hypothesis: true odds ratio is not equal to 1
#95 percent confidence interval:
# 0.7739264 0.9104233
#sample estimates:
#odds ratio 
# 0.8396294 

 

