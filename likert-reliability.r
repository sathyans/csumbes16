#design for r 3.30
if (!require(psy)){
  install.packages("psy")
}
require(psy)
#sample.size number.of.items alpha
reliability_importance <- cronbach(csumbes16[,62:72])#$alpha
reliability_satisfaction1 <- cronbach(cbind(csumbes16[,73:83],csumbes16[,96:120]))#$alpha
reliability_satisfaction2 <- cronbach(csumbes16[,121:135])#$alpha
reliability_agreement <- cronbach(cbind(csumbes16[,136:146],csumbes16[,161:165]))#$alpha
reliability_often <- cronbach(csumbes16[,147:157])#$alpha
cronbach_labels <- c("Importance","Satisfaction1","Satisfaction2","Agreement","Often")
# reliability <- data.frame(
#   rbind(
#   reliability_importance,
#   reliability_satisfaction1,
#   reliability_satisfaction2,
#   reliability_agreement,
#   reliability_often
#   )
# )
# reliability <- cbind(reliability,cronbach_labels)
reliability <- data.frame(reliability_importance$alpha, reliability_satisfaction1$alpha,reliability_satisfaction2$alpha, reliability_agreement$alpha,  reliability_often$alpha)
   
if(!require(reshape2)){
  install.packages("reshape2")
}
require(reshape2)
#reliability_df <- melt(reliability,measure.vars = c(sample.size,number.of.items,alpha))
reliability_df <- melt(reliability)

View(reliability)
if(!require(ggplot2)) {
  install.packages("ggplot2")
}
require(ggplot2)
cronbach_scale <- "Cronbach's alpha: Internal consistency
_____________________________
α >= 0.9: 	Excellent
0.9 > α >= 0.8: 	Good
0.8 > α >= 0.7: 	Acceptable
0.7 > α >= 0.6: 	Questionable
0.6 > α >= 0.5: 	Poor
0.5 > α: 	Unacceptable"
pdf(file="reliability_r.pdf")
plot.new()
text(x=0.5,y=1,"Cronbach's Alpha for CSUMBES16",col = colorset[4],cex=2,font=2,family="serif")
text(x=0.5, y=0.9,"A commonly accepted rule of thumb 
     for describing internal consistency is as follows:"
     ,col = colorset[4],cex=1,font=1,family="sans")
text(x=0.5, y=0.6,cronbach_scale
     ,col = colorset[4],cex=1,font=1,family="sans")

plot1 <- ggplot(reliability_df,aes(gsub("reliability_","",gsub(".alpha","",variable)),value,fill=variable))+
  geom_bar(stat="identity",position="dodge")+
  ggtitle("Reliability of Likerts")+
  xlab(label(gsub("reliability_","",gsub(".alpha","",reliability_df$variable))))+
  ylab(paste("Cronbach's Alpha"))+
  ylim(0,1)+
  scale_fill_manual(values = cbind(colorset,"#800000"))+
  geom_text(aes(label=format(round(value,3),big.mark = ",")), position=position_dodge(width=0), vjust=-1, hjust=.5)
plot1 + theme(legend.title = element_blank(),legend.position="none")
dev.off()

# plot1 <- ggplot(reliability,aes(cronbach_labels,alpha,fill=cronbach_labels))+
#   geom_bar(stat="identity",position="dodge")+
#   ggtitle("Reliability of Likerts")+
#   xlab(label(reliability$cronbach_labels))+
#   ylab(paste("Cronbach's Alpha"))+
#   ylim(0,1)+
#   scale_fill_manual(values = cbind(colorset,"#800000"))+
#   geom_text(aes(label=format(round(alpha(),3),big.mark = ",")), position=position_dodge(width=0), vjust=-1, hjust=.5)
# plot1 + theme(legend.title = element_blank(),legend.position="none")
