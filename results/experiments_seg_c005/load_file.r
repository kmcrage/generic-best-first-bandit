library('grid')
library('ggplot2')
data=read.csv('seg_mancala_data.csv',sep=",")

# Display for seg=1 and against MC 
v=data[data$seg==1 & data$a2 == "MC",]
vmcdp=data[data$seg==1 & data$a1 == "MC" & data$a2 == "DP",]
if(nrow(vmcdp)>0){
	vmcdp$a1<-"DP"
	vmcdp$a2<-"MC"
	tmp=vmcdp$max_win
	vmcdp$max_win <- vmcdp$min_win
	vmcdp$min_win <- tmp
	v<-rbind(v,vmcdp)
}
print("seg1 length:")
print(nrow(v))
pdf('mc_1.pdf')
print(ggplot(v,aes(x=v$iterations, y=v$max_win, group=a1)) + geom_line(size=1,aes(linetype=a1)) + geom_point(size=4,aes(shape=a1)) +  ylab(" % win rate") + ylim(0,0.9)+ xlab("#iterations (thousands)") + scale_linetype_discrete(name="Seg=1") + theme_bw(base_size = 32, base_family = "Helvetica")+ theme(legend.position = c(0.13,0.88), legend.key.size= unit(1.9,"lines"), legend.title=element_blank()) + geom_hline(yintercept=0.5, linecolor=5, linewidth=1) + scale_x_continuous(labels= function(x) format(x/1000,digits = 2)) + scale_linetype_manual(values=c("solid","dotdash", "dotted"))
+ scale_shape_manual(values=c(16,17,18)))
dev.off()



# Display for seg=4 and against MC 
v=data[data$seg==4 & data$a2 == "MC",]
vmcdp=data[data$seg==4 & data$a1 == "MC" & data$a2 == "DP",]
if(nrow(vmcdp)>0){
	vmcdp$a1<-"DP"
	vmcdp$a2<-"MC"
	tmp=vmcdp$max_win
	vmcdp$max_win <- vmcdp$min_win
	vmcdp$min_win <- tmp
	v<-rbind(v,vmcdp)
}
print("seg4 length")
print(nrow(v))
pdf('mc_4.pdf')
print(ggplot(v,aes(x=v$iterations, y=v$max_win, group=a1)) + geom_line(size=1,aes(linetype=a1)) + geom_point(size=4,aes(shape=a1)) +  ylab(" % win rate") + ylim(0,0.9)+ xlab("#iterations (thousands)") + scale_linetype_discrete(name="Seg=1") + theme_bw(base_size = 32, base_family = "Helvetica")+ theme(legend.position = c(0.13,0.88), legend.key.size= unit(1.9,"lines"), legend.title=element_blank()) + geom_hline(yintercept=0.5, linecolor=5, linewidth=1) + scale_x_continuous(labels= function(x) format(x/1000,digits = 2)) + scale_linetype_manual(values=c("solid","dotdash", "dotted"))
+ scale_shape_manual(values=c(16,17,18)))
dev.off()

# Display for seg=8 and against MC 
v=data[data$seg==8 & data$a2 == "MC",]
vmcdp=data[data$seg==8 & data$a1 == "MC" & data$a2 == "DP",]
if(nrow(vmcdp)>0){
	vmcdp$a1<-"DP"
	vmcdp$a2<-"MC"
	tmp=vmcdp$max_win
	vmcdp$max_win <- vmcdp$min_win
	vmcdp$min_win <- tmp
	v<-rbind(v,vmcdp)
}
print("seg8 length")
print(nrow(v))
pdf('mc_8.pdf')
print(ggplot(v,aes(x=v$iterations, y=v$max_win, group=a1)) + geom_line(size=1,aes(linetype=a1)) + geom_point(size=4,aes(shape=a1)) +  ylab(" % win rate") + ylim(0,0.9)+ xlab("#iterations (thousands)") + scale_linetype_discrete(name="Seg=1") + theme_bw(base_size = 32, base_family = "Helvetica")+ theme(legend.position = c(0.13,0.88), legend.key.size= unit(1.9,"lines"), legend.title=element_blank()) + geom_hline(yintercept=0.5, linecolor=5, linewidth=1) + scale_x_continuous(labels= function(x) format(x/1000,digits = 2)) + scale_linetype_manual(values=c("solid","dotdash", "dotted"))
+ scale_shape_manual(values=c(16,17,18)))
dev.off()


# Display for seg=8 and against MC 
v=data[data$seg==16 & data$a2 == "MC",]
vmcdp=data[data$seg==16 & data$a1 == "MC" & data$a2 == "DP",]
if(nrow(vmcdp)>0){
	vmcdp$a1<-"DP"
	vmcdp$a2<-"MC"
	tmp=vmcdp$max_win
	vmcdp$max_win <- vmcdp$min_win
	vmcdp$min_win <- tmp
	v<-rbind(v,vmcdp)
}
print("seg16 length")
print(nrow(v))
pdf('mc_16.pdf')
print(ggplot(v,aes(x=v$iterations, y=v$max_win, group=a1)) + geom_line(size=1,aes(linetype=a1)) + geom_point(size=4,aes(shape=a1)) +  ylab(" % win rate") + ylim(0,0.9)+ xlab("#iterations (thousands)") + scale_linetype_discrete(name="Seg=1") + theme_bw(base_size = 32, base_family = "Helvetica")+ theme(legend.position = c(0.13,0.88), legend.key.size= unit(1.9,"lines"), legend.title=element_blank()) + geom_hline(yintercept=0.5, linecolor=5, linewidth=1) + scale_x_continuous(labels= function(x) format(x/1000,digits = 2)) + scale_linetype_manual(values=c("solid","dotdash", "dotted"))
+ scale_shape_manual(values=c(16,17,18)))
dev.off()

# Display for seg=8 and against MC 
v=data[data$seg==24 & data$a2 == "MC",]
vmcdp=data[data$seg==24 & data$a1 == "MC" & data$a2 == "DP",]
if(nrow(vmcdp)>0){
	vmcdp$a1<-"DP"
	vmcdp$a2<-"MC"
	tmp=vmcdp$max_win
	vmcdp$max_win <- vmcdp$min_win
	vmcdp$min_win <- tmp
	v<-rbind(v,vmcdp)
}
print("seg24 length")
print(nrow(v))
pdf('mc_24.pdf')
print(ggplot(v,aes(x=v$iterations, y=v$max_win, group=a1)) + geom_line(size=1,aes(linetype=a1)) + geom_point(size=4,aes(shape=a1)) +  ylab(" % win rate") + ylim(0,0.9)+ xlab("#iterations (thousands)") + scale_linetype_discrete(name="Seg=1") + theme_bw(base_size = 32, base_family = "Helvetica")+ theme(legend.position = c(0.13,0.88), legend.key.size= unit(1.9,"lines"), legend.title=element_blank()) + geom_hline(yintercept=0.5, linecolor=5, linewidth=1) + scale_x_continuous(labels= function(x) format(x/1000,digits = 2)) + scale_linetype_manual(values=c("solid","dotdash", "dotted"))
+ scale_shape_manual(values=c(16,17,18)))
dev.off()


# Display for seg=8 and against MC 
v=data[data$seg==48 & data$a2 == "MC",]
vmcdp=data[data$seg==48 & data$a1 == "MC" & data$a2 == "DP",]
if(nrow(vmcdp)>0){
	vmcdp$a1<-"DP"
	vmcdp$a2<-"MC"
	tmp=vmcdp$max_win
	vmcdp$max_win <- vmcdp$min_win
	vmcdp$min_win <- tmp
	v<-rbind(v,vmcdp)
}
print("seg48 length")
print(nrow(v))
pdf('mc_48.pdf')
print(ggplot(v,aes(x=v$iterations, y=v$max_win, group=a1)) + geom_line(size=1,aes(linetype=a1)) + geom_point(size=4,aes(shape=a1)) +  ylab(" % win rate") + ylim(0,0.9)+ xlab("#iterations (thousands)") + scale_linetype_discrete(name="Seg=1") + theme_bw(base_size = 32, base_family = "Helvetica")+ theme(legend.position = c(0.13,0.88), legend.key.size= unit(1.9,"lines"), legend.title=element_blank()) + geom_hline(yintercept=0.5, linecolor=5, linewidth=1) + scale_x_continuous(labels= function(x) format(x/1000,digits = 2)) + scale_linetype_manual(values=c("solid","dotdash", "dotted"))
+ scale_shape_manual(values=c(16,17,18)))
dev.off()



