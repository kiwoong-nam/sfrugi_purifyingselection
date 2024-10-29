vi=read.table("/home/kiwoong/Projects/sfrugi_purifyingselection/Recessivity/inv_100kb.e2.txt",h=T,sep="\t")

ot="/home/kiwoong/Projects/sfrugi_purifyingselection/Recessivity/inv.e2.cts"

B=1000

BT=function(h,f,a1,a2)
{
	bg=sum(a1)/(sum(a1)+sum(a2))

	bt=rep(NA,1000)
	for(b in c(1:B))
	{
		si=sample(c(1:length(a1)),replace=T)
		bt[b]=sum(a1[si])/(sum(a1[si])+sum(a2[si]))
	}
	
	bt=sort(bt)

	l=bt[25]
	u=bt[975]

	data.frame(cate=h,mutation=f,mn=bg,l.ci=bt[25],u.ci=bt[975])
}

RES=rbind(
with(vi,BT("hetero","frameshift",het.fs.share,het.fs.nonshare)),
with(vi,BT("hetero","synonymous",het.syn.share,het.syn.nonshare)),
with(vi,BT("homo","frameshift",hom.fs.share,hom.fs.nonshare)),
with(vi,BT("homo","synonymous",hom.syn.share,hom.syn.nonshare))
)

write.table(RES,ot,row.names=F,sep="\t",quote=F)

