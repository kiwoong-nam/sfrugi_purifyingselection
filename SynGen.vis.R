library("ggplot2")
library(gridExtra)
library(grid)

vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)

Output='/home/kiwoong/Projects/sfrugi_purifyingselection/SynGen.pdf'

v=read.table("/home/kiwoong/Projects/sfrugi_purifyingselection/SynGen/inv.cts",h=T,sep="\t")

p=ggplot(v,aes(x=mutation,y=mn,fill=mutation))+geom_bar(stat='identity',show.legend = FALSE)+theme_bw()+xlab(NULL)+ylab("Proportion of Shared Variations")+geom_errorbar(aes(min=l.ci,max=u.ci),width=0.2)+ scale_fill_manual(values=c("red","blue"))

pdf(Output,width=3,height=4)
p
dev.off()

