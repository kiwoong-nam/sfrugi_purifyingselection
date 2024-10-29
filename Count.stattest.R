v=read.table('/home/kiwoong/Projects/sfrugi_purifyingselection/Count/indi.txt',h=T,sep="\t")

wilcox.test(subset(v,origin=='Native')$fs,subset(v,origin=='Invasive')$fs)
wilcox.test(subset(v,origin=='Native')$syn,subset(v,origin=='Invasive')$syn)

t.test(subset(v,origin=='Native')$fs,subset(v,origin=='Invasive')$fs)
t.test(subset(v,origin=='Native')$syn,subset(v,origin=='Invasive')$syn)

#	Wilcoxon rank sum test with continuity correction
#
#data:  subset(v, origin == "Native")$fs and subset(v, origin == "Invasive")$fs
#W = 1667.5, p-value = 4.746e-05
#alternative hypothesis: true location shift is not equal to 0
#
#
#	Wilcoxon rank sum test with continuity correction
#
#data:  subset(v, origin == "Native")$syn and subset(v, origin == "Invasive")$syn
#W = 1916, p-value = 3.175e-09
#alternative hypothesis: true location shift is not equal to 0
#
#
#	Welch Two Sample t-test
#
#data:  subset(v, origin == "Native")$fs and subset(v, origin == "Invasive")$fs
#t = 3.4502, df = 74.734, p-value = 0.0009245
#alternative hypothesis: true difference in means is not equal to 0
#95 percent confidence interval:
# 19.30842 72.07571
#sample estimates:
#mean of x mean of y 
# 3030.614  2984.922 
#
#
#	Welch Two Sample t-test
#
#data:  subset(v, origin == "Native")$syn and subset(v, origin == "Invasive")$syn
#t = 4.8911, df = 46.871, p-value = 1.221e-05
#alternative hypothesis: true difference in means is not equal to 0
#95 percent confidence interval:
# 3613.579 8663.611
#sample estimates:
#mean of x mean of y 
# 194257.9  188119.3 

