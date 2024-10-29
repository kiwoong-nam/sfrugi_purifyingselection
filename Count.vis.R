library("ggplot2")
library(gridExtra)
library(grid)

vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)

Output='/home/kiwoong/Projects/sfrugi_purifyingselection/Count.pdf'
v=read.table('/home/kiwoong/Projects/sfrugi_purifyingselection/Count/indi.txt',h=T,sep="\t")

p1=ggplot(v,aes(x=origin,y=fs/1000))+geom_boxplot(col="red")+theme_bw()+ylab("Number of Variation Positions (×1000)")+xlab(NULL)+ylim(0,max(v$fs/1000*1.1))+ggtitle("frameshift")+theme(plot.title = element_text(hjust = 0.5))
 
p2=ggplot(v,aes(x=origin,y=syn/1000))+geom_boxplot(col="blue")+theme_bw()+ylab("Number of Variation Positions (×1000)")+xlab(NULL)+ylim(0,max(v$syn/1000*1.1))+ggtitle("synonymous")+theme(plot.title = element_text(hjust = 0.5))

pdf(Output,width=5,height=5)
grid.newpage()
pushViewport(viewport(layout = grid.layout(1, 2)))
print(p1, vp = vplayout(1,1))
print(p2, vp = vplayout(1,2))
dev.off()


