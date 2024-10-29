vb=read.table("/home/kiwoong/Projects/sfrugi_purifyingselection/LagPhase/inv_100kb.Benin.txt",h=T,sep="\t")
vi=read.table("/home/kiwoong/Projects/sfrugi_purifyingselection/LagPhase/inv_100kb.India.txt",h=T,sep="\t")

ot="/home/kiwoong/Projects/sfrugi_purifyingselection/LagPhase/inv.cts"

B=1000


BT=function(f,a1,a2)
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

	data.frame(mutation=f,mn=bg,l.ci=bt[25],u.ci=bt[975])
}

RES.B=rbind(
BT('frameshift',vb$fs.share,vb$fs.nonshare),
BT('synonymous',vb$syn.share,vb$syn.nonshare)
)

RES.I=rbind(
BT('frameshift',vi$fs.share,vi$fs.nonshare),
BT('synonymous',vi$syn.share,vi$syn.nonshare)
)

RES.B$Invasive='Benin, 2017'
RES.I$Invasive='India, 2018'

RES=rbind(RES.B,RES.I)

write.table(RES,ot,row.names=F,sep="\t",quote=F)

