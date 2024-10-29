library("ggplot2")
library(gridExtra)
library(grid)

vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)

Output='/home/kiwoong/Projects/sfrugi_purifyingselection/LagPhase.pdf'

v=read.table("/home/kiwoong/Projects/sfrugi_purifyingselection/LagPhase/inv.cts",h=T,sep="\t")

p=ggplot(v,aes(x=Invasive,y=mn,fill=mutation))+geom_bar(stat='identity',position='dodge')+theme_bw()+xlab("Sampling Location & Year")+ylab("Proportion of Shared Variations")+geom_errorbar(aes(min=l.ci,max=u.ci),position = position_dodge(width=0.9), colour="black", width=0.2) + scale_fill_manual(values=c("red","blue"))

pdf(Output,width=5,height=5)
p
dev.off()


