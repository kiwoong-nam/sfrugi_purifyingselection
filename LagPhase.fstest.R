vb=read.table("/home/kiwoong/Projects/sfrugi_purifyingselection/LagPhase/inv_100kb.Benin.txt",h=T,sep="\t")
vi=read.table("/home/kiwoong/Projects/sfrugi_purifyingselection/LagPhase/inv_100kb.India.txt",h=T,sep="\t")

fisher.test(matrix(c(sum(vb[3]),sum(vb[4]),sum(vb[5]),sum(vb[6])),ncol=2))

#> fisher.test(matrix(c(sum(vb[3]),sum(vb[4]),sum(vb[5]),sum(vb[6])),ncol=2))
#
#	Fisher's Exact Test for Count Data
#
#data:  matrix(c(sum(vb[3]), sum(vb[4]), sum(vb[5]), sum(vb[6])), ncol = 2)
#p-value < 2.2e-16
#alternative hypothesis: true odds ratio is not equal to 1
#95 percent confidence interval:
# 0.6514695 0.7323820
#sample estimates:
#odds ratio 
# 0.6909501 

fisher.test(matrix(c(sum(vi[3]),sum(vi[4]),sum(vi[5]),sum(vi[6])),ncol=2))


#> fisher.test(matrix(c(sum(vi[3]),sum(vi[4]),sum(vi[5]),sum(vi[6])),ncol=2))
#
#
#	Fisher's Exact Test for Count Data
#
#data:  matrix(c(sum(vi[3]), sum(vi[4]), sum(vi[5]), sum(vi[6])), ncol = 2)
#p-value < 2.2e-16
#alternative hypothesis: true odds ratio is not equal to 1
#95 percent confidence interval:
# 0.6362530 0.7267931
#sample estimates:
#odds ratio 
# 0.6802737 



