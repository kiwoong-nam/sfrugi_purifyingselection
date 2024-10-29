library("ggplot2")
library(gridExtra)
library(grid)

vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)

Output='/home/kiwoong/Projects/sfrugi_purifyingselection/Recessivity.pdf'

v.e2=read.table("/home/kiwoong/Projects/sfrugi_purifyingselection/Recessivity/inv.e2.cts",h=T,sep="\t")

p=ggplot(v.e2,aes(x=cate,y=mn,fill=mutation))+geom_bar(stat='identity',position='dodge')+theme_bw()+ylab("Proportion of Shared Variations")+xlab("Genotypes in Native Population")+geom_errorbar(aes(min=l.ci,max=u.ci),position = position_dodge(width=0.9), colour="black", width=0.3) + scale_fill_manual(values=c("red","blue"))

pdf(Output,width=12/1.3/2,height=5/1.3)
p
dev.off()


#pdf(Output,width=12/1.3,height=5/1.3)
#grid.newpage()
#pushViewport(viewport(layout = grid.layout(1, 2)))
#print(p1, vp = vplayout(1,1))
#print(p2, vp = vplayout(1,2))
#dev.off()


