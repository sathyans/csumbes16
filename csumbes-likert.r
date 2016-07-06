#designed for r 3.25
if(!require(Hmisc)) {
  install.packages("Hmisc")
}
require(Hmisc)
if(!require(sjPlot)) {
  install.packages("sjPlot")
}
require(sjPlot)
if(!require(sjmisc)) {
  install.packages("sjmisc")
}
require(sjmisc)
if(!require(gridExtra)) {
  install.packages("gridExtra")
}
require(gridExtra)
if(!require(grid)) {
  install.packages("grid")
}
require(grid)
if(!require(ggplot2)) {
  install.packages("ggplot2")
}
require(ggplot2)
if(!require(gplots)) {
  install.packages("gplots")
}
require(gplots)
if(!require(gdata)) {
  install.packages("gdata")
}
require(gdata)
if(!require(reshape2)) {
  install.packages("reshape2")
}
require(reshape2)

everyone <- sort(unique(csumbes16$dummy))
everyone_labels <- c("CSUMB")
colleges <- sort(unique(csumbes16$D23))
majors <- sort(unique(csumbes16$D24))
colleges_labels = c("CAHSS","HSHS","COS","EDUC","UGS","COB")
majors_labels = c("BIO","BUS","CD","CHHS","CINE","CSCI","CSIT","ENSTU","ESTP","GS","HCOM","ISSM","JLC","KIN","LS","MATH","MS (BS)","MUS","NURS","PSY","SBS","SHM","SPAN","UNDC","VPA","WLC")

#swapping grouping variables requires 4 changes by commenting/uncommenting the relevant lines
#1. assignment of grp_labels
#2. inList in _for_ condition
#3. csumb_Selected subset condition variable
#4. csumb_Selected subset condition list


#sjp.setTheme()
theme_set(theme_bw(base_size=12,base_family = ""))
sjp.setTheme(base = theme_classic(),axis.textsize.x =  .9, axis.textsize.y = 1, legend.item.size = .5)


rColors <- "PRGn"
excelColors <- c("#8064A2","#9BBB59" ,"#C0504D","#4F81BD") 
csumbColors <- c("#4F81BD","#8B7E56","#446A59","#002A4E")
colorset <- csumbColors
neutralColor <- "grey70"
label_length <- 10

grp_labels <- everyone_labels
#grp_labels <- colleges_labels
#grp_labels <- majors_labels


for (i in everyone){
#for (i in colleges){
#for (i in majors){
  print(grp_labels[i])

csumbes_Selected <- subset(csumbes16,csumbes16$dummy == everyone[i])
#csumbes_Selected <- subset(csumbes16,csumbes16$D23 == colleges[i])
#csumbes_Selected <- subset(csumbes16,csumbes16$D24 == majors[i])
cases <- as.numeric(dim(csumbes_Selected)[1])

pdf(file=paste(grp_labels[i],"_CSUMBES16_Charts.pdf"), height = 8.5, width = 11)

#Title page
plot.new()
text(x=0.5, y=0.7,paste("CSUMB Experience Survey 2016: ",grp_labels[i]),col = colorset[4],cex=1.5,font=2,family="serif")
text(x=0.5, y=0.5,paste("Students Responding: n=",format(cases,big.mark = ",")),col = colorset[4],font=3,family="serif")
text(x=0.5, y=0.1,paste("Prepared by Institutional Assessment and Research, California State University Monterey Bay"),col = colorset[4],cex=.8,family="serif")

#Q1
sjp.frq(factor(csumbes_Selected$Q1_Label),coord.flip = T,geom.colors = colorset[4],sort.frq = "asc"
        ,axisTitle.x=get_label(csumbes_Selected$Q1_Label),title="")

#Q2-3 (freq)
plot1 <- sjp.frq(factor(csumbes_Selected$Q2_Label),printPlot = F, coord.flip = T,geom.colors = colorset[4]
                 ,axisTitle.x=get_label(csumbes_Selected$Q2_Label),title = "",axisLimits.y = c(0,cases * 1.25))
plot2 <- sjp.frq(factor(csumbes_Selected$Q3_Label),printPlot = F,coord.flip = T,geom.colors = colorset[4]
                   ,axisTitle.x=get_label(csumbes_Selected$Q3_Label),title="",axisLimits.y = c(0,cases * .8))
grid.arrange(plot1$plot, plot2$plot, ncol = 2)

#Q4-Q14 set (importance)
csumbes_likerts_importance <- data.frame(csumbes_Selected$Q4,csumbes_Selected$Q5,csumbes_Selected$Q6,csumbes_Selected$Q7,csumbes_Selected$Q8
                                           ,csumbes_Selected$Q9,csumbes_Selected$Q10,csumbes_Selected$Q11,csumbes_Selected$Q12,csumbes_Selected$Q13
                                         ,csumbes_Selected$Q14)
csumbes_likerts_importance[csumbes_likerts_importance == 0] <- NA
csumbes_likerts_importance[csumbes_likerts_importance == 3] <- 9
csumbes_likerts_importance[csumbes_likerts_importance == 4] <- 3
csumbes_likerts_importance[csumbes_likerts_importance == 5] <- 4
csumbes_likerts_importance[csumbes_likerts_importance == 9] <- 5
labels <- c("Not important at all","Somewhat important","Important","Very important","Neutral")
set_labels(csumbes_likerts_importance) <- labels
items <- c(label(csumbes_Selected$Q4), label(csumbes_Selected$Q5),label(csumbes_Selected$Q6), label(csumbes_Selected$Q7)
           ,label(csumbes_Selected$Q8),label(csumbes_Selected$Q9),label(csumbes_Selected$Q10), label(csumbes_Selected$Q11),
           label(csumbes_Selected$Q12),label(csumbes_Selected$Q13),label(csumbes_Selected$Q14))
sjp.likert(csumbes_likerts_importance,
           geom.colors=colorset,reverse.colors=T,
           catcount=4, cat.neutral=5,cat.neutral.color = neutralColor,
           showPercentageSign=T, legendTitle="Response",includeN=T,showItemLabels=T,value.labels="sum.outside",
           hideLegend=F,expand.grid=F, labelDigits=0,axisTitle.x="Statement",gridRange = 1.4, printPlot=T
           ,axisLabels.y = items,legendLabels = labels
           ,title = paste(grp_labels[i]," CSUMBES16: Importance - Questions 4 - 14"))

#Q15-25 set
csumbes_likerts_satisfaction <- data.frame(csumbes_Selected$Q15,csumbes_Selected$Q16,csumbes_Selected$Q17,csumbes_Selected$Q18,csumbes_Selected$Q19
                                           ,csumbes_Selected$Q20,csumbes_Selected$Q21,csumbes_Selected$Q22,csumbes_Selected$Q23,csumbes_Selected$Q24
                                           ,csumbes_Selected$Q25)
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 0] <- NA
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 3] <- 9
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 4] <- 3
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 5] <- 4
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 9] <- 5
#summary(csumbes_likerts_satisfaction)

# create labels
labels <- c("Very dissatisfied", "Dissatisfied", "Satisfied", "Very satisfied","Neither satisfied nor dissatisfied")
#Not applicable/No basis to judge
set_labels(csumbes_likerts_satisfaction) <- labels
# create item labels
items <- c(label(csumbes_Selected$Q15), label(csumbes_Selected$Q16),label(csumbes_Selected$Q17), label(csumbes_Selected$Q18)
           ,label(csumbes_Selected$Q19),label(csumbes_Selected$Q20),label(csumbes_Selected$Q21), label(csumbes_Selected$Q22),
           label(csumbes_Selected$Q23),label(csumbes_Selected$Q24),label(csumbes_Selected$Q25))
sjp.likert(csumbes_likerts_satisfaction,
           geom.colors=colorset, 
           reverse.colors=T,
           catcount=4, 
           cat.neutral=5,cat.neutral.color = neutralColor,
           showPercentageSign=T, 
           legendTitle="Response",
           includeN=T,
           showItemLabels=T,
           value.labels="sum.outside",
           hideLegend=F,
           expand.grid=F, 
           labelDigits=0, 
           axisTitle.x="Statement",
           gridRange = 1.4,
           printPlot=T
           ,axisLabels.y = items
           ,legendLabels = labels
           ,title = paste(grp_labels[i]," CSUMBES16: Satisfaction - Questions 15 - 25"))
csumbes_likerts_satisfaction_1 <- csumbes_likerts_satisfaction
#sjt.frq(csumbes_likerts_satisfaction,file=paste(grp_labels[i]," CSUMBES.html"))
#Q27-36 set
csumbes_likerts_satisfaction <- data.frame(csumbes_Selected$Q27,csumbes_Selected$Q28,csumbes_Selected$Q29,csumbes_Selected$Q30,csumbes_Selected$Q31
                                           ,csumbes_Selected$Q32,csumbes_Selected$Q33,csumbes_Selected$Q34,csumbes_Selected$Q35,csumbes_Selected$Q36)
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 0] <- NA
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 3] <- 9
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 4] <- 3
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 5] <- 4
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 9] <- 5
labels <- c("Very dissatisfied", "Dissatisfied", "Satisfied", "Very satisfied","Neither satisfied nor dissatisfied")
set_labels(csumbes_likerts_satisfaction) <- labels
items <- c(label(csumbes_Selected$Q27), label(csumbes_Selected$Q28),label(csumbes_Selected$Q29), label(csumbes_Selected$Q30)
           ,label(csumbes_Selected$Q31),label(csumbes_Selected$Q32),label(csumbes_Selected$Q33), label(csumbes_Selected$Q34),
           label(csumbes_Selected$Q35),label(csumbes_Selected$Q36))
sjp.likert(csumbes_likerts_satisfaction,
           geom.colors=colorset,reverse.colors=T,
           catcount=4, cat.neutral=5,cat.neutral.color = neutralColor,
           showPercentageSign=T, legendTitle="Response",includeN=T,showItemLabels=T,value.labels="sum.outside",
           hideLegend=F,expand.grid=F, labelDigits=0,axisTitle.x="Statement",gridRange = 1.4, printPlot=T
           ,axisLabels.y = items,legendLabels = labels
           ,title = paste(grp_labels[i]," CSUMBES16: Satisfaction - Questions 27 - 36"))
csumbes_likerts_satisfaction_2 <- csumbes_likerts_satisfaction
#Q37-45 set
csumbes_likerts_satisfaction <- data.frame(csumbes_Selected$Q37,csumbes_Selected$Q38,csumbes_Selected$Q39,csumbes_Selected$Q40,csumbes_Selected$Q41
                                           ,csumbes_Selected$Q42,csumbes_Selected$Q43,csumbes_Selected$Q44,csumbes_Selected$Q45)
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 0] <- NA
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 3] <- 9
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 4] <- 3
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 5] <- 4
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 9] <- 5
labels <- c("Very dissatisfied", "Dissatisfied", "Satisfied", "Very satisfied","Neither satisfied nor dissatisfied")
set_labels(csumbes_likerts_satisfaction) <- labels
items <- c(label(csumbes_Selected$Q37), label(csumbes_Selected$Q38),label(csumbes_Selected$Q39), label(csumbes_Selected$Q40)
           ,label(csumbes_Selected$Q41),label(csumbes_Selected$Q42),label(csumbes_Selected$Q43), label(csumbes_Selected$Q44),
           label(csumbes_Selected$Q45))
sjp.likert(csumbes_likerts_satisfaction,
           geom.colors=colorset,reverse.colors=T,
           catcount=4, cat.neutral=5,cat.neutral.color = neutralColor,
           showPercentageSign=T, legendTitle="Response",includeN=T,showItemLabels=T,value.labels="sum.outside",
           hideLegend=F,expand.grid=F, labelDigits=0,axisTitle.x="Statement",gridRange = 1.4, printPlot=T
           ,axisLabels.y = items,legendLabels = labels
           ,title = paste(grp_labels[i]," CSUMBES16: Satisfaction - Questions 37 - 45"))
csumbes_likerts_satisfaction_3 <- csumbes_likerts_satisfaction
#Q46-51 set
csumbes_likerts_satisfaction <- data.frame(csumbes_Selected$Q46,csumbes_Selected$Q47,csumbes_Selected$Q48,csumbes_Selected$Q49,csumbes_Selected$Q50
                                           ,csumbes_Selected$Q51)
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 0] <- NA
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 3] <- 9
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 4] <- 3
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 5] <- 4
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 9] <- 5
labels <- c("Very dissatisfied", "Dissatisfied", "Satisfied", "Very satisfied","Neither satisfied nor dissatisfied")
set_labels(csumbes_likerts_satisfaction) <- labels
items <- c(label(csumbes_Selected$Q46), label(csumbes_Selected$Q47),label(csumbes_Selected$Q48), label(csumbes_Selected$Q49)
           ,label(csumbes_Selected$Q50),label(csumbes_Selected$Q51))
sjp.likert(csumbes_likerts_satisfaction,
           geom.colors=colorset,reverse.colors=T,
           catcount=4, cat.neutral=5,cat.neutral.color = neutralColor,
           showPercentageSign=T, legendTitle="Response",includeN=T,showItemLabels=T,value.labels="sum.outside",
           hideLegend=F,expand.grid=F, labelDigits=0,axisTitle.x="Statement",gridRange = 1.4, printPlot=T
           ,axisLabels.y = items,legendLabels = labels
           ,title = paste(grp_labels[i]," CSUMBES16: Satisfaction - Questions 46 - 51"))
csumbes_likerts_satisfaction_4 <- csumbes_likerts_satisfaction
#Q52-59 set
csumbes_likerts_satisfaction <- data.frame(csumbes_Selected$Q52,csumbes_Selected$Q53,csumbes_Selected$Q54,csumbes_Selected$Q55
                                           ,csumbes_Selected$Q56,csumbes_Selected$Q57,csumbes_Selected$Q58,csumbes_Selected$Q59)
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 6] <- NA
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 3] <- 9
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 1] <- 11
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 2] <- 12
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 4] <- 14
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 5] <- 15
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 9] <- 5
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 11] <- 4
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 12] <- 3
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 14] <- 2
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 15] <- 1

labels <- c("Very dissatisfied", "Dissatisfied", "Satisfied", "Very satisfied","Neither satisfied nor dissatisfied")
set_labels(csumbes_likerts_satisfaction) <- labels
items <- c(label(csumbes_Selected$Q52), label(csumbes_Selected$Q53),label(csumbes_Selected$Q54), label(csumbes_Selected$Q55)
           ,label(csumbes_Selected$Q56),label(csumbes_Selected$Q57),label(csumbes_Selected$Q58),label(csumbes_Selected$Q59))
sjp.likert(csumbes_likerts_satisfaction,
           geom.colors=colorset,reverse.colors=T,
           catcount=4, cat.neutral=5,cat.neutral.color = neutralColor,
           showPercentageSign=T, legendTitle="Response",includeN=T,showItemLabels=T,value.labels="sum.outside",
           hideLegend=F,expand.grid=F, labelDigits=0,axisTitle.x="Statement",gridRange = 1.4, printPlot=T
           ,axisLabels.y = items,legendLabels = labels
           ,title = paste(grp_labels[i]," CSUMBES16: Satisfaction - Questions 52 - 59"))
csumbes_likerts_satisfaction_5 <- csumbes_likerts_satisfaction
#Q60-66 set
csumbes_likerts_satisfaction <- data.frame(csumbes_Selected$Q60,csumbes_Selected$Q61,csumbes_Selected$Q62,csumbes_Selected$Q63
                                           ,csumbes_Selected$Q64,csumbes_Selected$Q65,csumbes_Selected$Q66)
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 6] <- NA
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 3] <- 9
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 1] <- 11
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 2] <- 12
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 4] <- 14
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 5] <- 15
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 9] <- 5
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 11] <- 4
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 12] <- 3
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 14] <- 2
csumbes_likerts_satisfaction[csumbes_likerts_satisfaction == 15] <- 1

labels <- c("Very dissatisfied", "Dissatisfied", "Satisfied", "Very satisfied","Neither satisfied nor dissatisfied")
set_labels(csumbes_likerts_satisfaction) <- labels
items <- c(label(csumbes_Selected$Q60), label(csumbes_Selected$Q61),label(csumbes_Selected$Q62), label(csumbes_Selected$Q63)
           ,label(csumbes_Selected$Q64),label(csumbes_Selected$Q65),label(csumbes_Selected$Q66))
sjp.likert(csumbes_likerts_satisfaction,
           geom.colors=colorset,reverse.colors=T,
           catcount=4, cat.neutral=5,cat.neutral.color = neutralColor,
           showPercentageSign=T, legendTitle="Response",includeN=T,showItemLabels=T,value.labels="sum.outside",
           hideLegend=F,expand.grid=F, labelDigits=0,axisTitle.x="Statement",gridRange = 1.4, printPlot=T
           ,axisLabels.y = items,legendLabels = labels
           ,title = paste(grp_labels[i]," CSUMBES16: Satisfaction - Questions 60 - 66"))
csumbes_likerts_satisfaction_6 <- csumbes_likerts_satisfaction
#Q67-72 set agreement
csumbes_likerts_agreement <- data.frame(csumbes_Selected$Q67,csumbes_Selected$Q68,csumbes_Selected$Q69,csumbes_Selected$Q70
                                           ,csumbes_Selected$Q71,csumbes_Selected$Q72)
csumbes_likerts_agreement[csumbes_likerts_agreement == 0] <- NA
csumbes_likerts_agreement[csumbes_likerts_agreement == 3] <- 9
csumbes_likerts_agreement[csumbes_likerts_agreement == 4] <- 3
csumbes_likerts_agreement[csumbes_likerts_agreement == 5] <- 4
csumbes_likerts_agreement[csumbes_likerts_agreement == 9] <- 5

labels <- c("Strongly disagree", "Disagree", "Agree", "Strongly agree","Neither agree nor disagree")
set_labels(csumbes_likerts_agreement) <- labels
items <- c(label(csumbes_Selected$Q67), label(csumbes_Selected$Q68),label(csumbes_Selected$Q69), label(csumbes_Selected$Q70)
           ,label(csumbes_Selected$Q71),label(csumbes_Selected$Q72))
sjp.likert(csumbes_likerts_agreement,
           geom.colors=colorset,reverse.colors=T,
           catcount=4, cat.neutral=5,cat.neutral.color = neutralColor,
           showPercentageSign=T, legendTitle="Response",includeN=T,showItemLabels=T,value.labels="sum.outside",
           hideLegend=F,expand.grid=F, labelDigits=0,axisTitle.x="Statement",gridRange = 1.4, printPlot=T
           ,axisLabels.y = items,legendLabels = labels
           ,title = paste(grp_labels[i]," CSUMBES16: Agreement - Questions 67 - 72"))
csumbes_likerts_agreement_1 <- csumbes_likerts_agreement
#Q73-77 set agreement
csumbes_likerts_agreement <- data.frame(csumbes_Selected$Q73
                                        ,csumbes_Selected$Q74,csumbes_Selected$Q75,csumbes_Selected$Q76,csumbes_Selected$Q77)
csumbes_likerts_agreement[csumbes_likerts_agreement == 0] <- NA
csumbes_likerts_agreement[csumbes_likerts_agreement == 3] <- 9
csumbes_likerts_agreement[csumbes_likerts_agreement == 4] <- 3
csumbes_likerts_agreement[csumbes_likerts_agreement == 5] <- 4
csumbes_likerts_agreement[csumbes_likerts_agreement == 9] <- 5

labels <- c("Strongly disagree", "Disagree", "Agree", "Strongly agree","Neither agree nor disagree")
set_labels(csumbes_likerts_agreement) <- labels
items <- c(label(csumbes_Selected$Q73)
           ,label(csumbes_Selected$Q74),label(csumbes_Selected$Q75),label(csumbes_Selected$Q76),label(csumbes_Selected$Q77))
sjp.likert(csumbes_likerts_agreement,
           geom.colors=colorset,reverse.colors=T,
           catcount=4, cat.neutral=5,cat.neutral.color = neutralColor,
           showPercentageSign=T, legendTitle="Response",includeN=T,showItemLabels=T,value.labels="sum.outside",
           hideLegend=F,expand.grid=F, labelDigits=0,axisTitle.x="Statement",gridRange = 1.4, printPlot=T
           ,axisLabels.y = items,legendLabels = labels
           ,title = paste(grp_labels[i]," CSUMBES16: Agreement - Questions 73 - 77"))
csumbes_likerts_agreement_2 <- csumbes_likerts_agreement
#Q78-88 - likert How often have professors provided
csumbes_likerts_often <- data.frame(csumbes_Selected$Q78,csumbes_Selected$Q79,csumbes_Selected$Q80,csumbes_Selected$Q81
                                    ,csumbes_Selected$Q82,csumbes_Selected$Q83,csumbes_Selected$Q84,csumbes_Selected$Q85
                                    ,csumbes_Selected$Q86,csumbes_Selected$Q87,csumbes_Selected$Q88)
csumbes_likerts_often[csumbes_likerts_often == 0] <- NA

labels <- c("Never", "Occasionally", "Often", "Very Often")
set_labels(csumbes_likerts_often) <- labels
items <- c(label(csumbes_Selected$Q78),label(csumbes_Selected$Q79),label(csumbes_Selected$Q80),label(csumbes_Selected$Q81)
           ,label(csumbes_Selected$Q82),label(csumbes_Selected$Q83),label(csumbes_Selected$Q84),label(csumbes_Selected$Q85)
           ,label(csumbes_Selected$Q86),label(csumbes_Selected$Q87),label(csumbes_Selected$Q88))
sjp.likert(csumbes_likerts_often,
           geom.colors=colorset,reverse.colors=T,
           catcount=4, 
           showPercentageSign=T, legendTitle="Response",includeN=T,showItemLabels=T,value.labels="sum.outside",
           hideLegend=F,expand.grid=F, labelDigits=0,axisTitle.x="Statement",gridRange = 1.4, printPlot=T
           ,axisLabels.y = items,legendLabels = labels
           ,title = paste(grp_labels[i]," CSUMBES16: Professors Provided - Questions 78 - 88"))

#Q89 - Freq - Advisor type
sjp.frq(factor(csumbes_Selected$Q89_Label),coord.flip = T,geom.colors = colorset[4],sort.frq = "asc"
        ,axisTitle.x=get_label(csumbes_Selected$Q89_Label),title="",axisLimits.y = c(0,cases))

#Q91-94 set agreement
csumbes_likerts_agreement <- data.frame(csumbes_Selected$Q90
                                        ,csumbes_Selected$Q91,csumbes_Selected$Q92,csumbes_Selected$Q93,csumbes_Selected$Q94)
csumbes_likerts_agreement[csumbes_likerts_agreement == 1] <- NA
csumbes_likerts_agreement[csumbes_likerts_agreement == 2] <- 1
csumbes_likerts_agreement[csumbes_likerts_agreement == 3] <- 2
csumbes_likerts_agreement[csumbes_likerts_agreement == 4] <- 9
csumbes_likerts_agreement[csumbes_likerts_agreement == 5] <- 3
csumbes_likerts_agreement[csumbes_likerts_agreement == 6] <- 4
csumbes_likerts_agreement[csumbes_likerts_agreement == 9] <- 5

labels <- c("Strongly disagree", "Disagree", "Agree", "Strongly agree","Neither agree nor disagree")
set_labels(csumbes_likerts_agreement) <- labels
items <- c(label(csumbes_Selected$Q90)
           ,label(csumbes_Selected$Q91),label(csumbes_Selected$Q92),label(csumbes_Selected$Q93),label(csumbes_Selected$Q94))
sjp.likert(csumbes_likerts_agreement,
           geom.colors=colorset,reverse.colors=T,
           catcount=4, cat.neutral=5,cat.neutral.color = neutralColor,
           showPercentageSign=T, legendTitle="Response",includeN=T,showItemLabels=T,value.labels="sum.outside",
           hideLegend=F,expand.grid=F, labelDigits=0,axisTitle.x="Statement",gridRange = 1.4, printPlot=T
           ,axisLabels.y = items,legendLabels = labels
           ,title = paste(grp_labels[i]," CSUMBES16: My Advisor - Questions 90 - 94"))
csumbes_likerts_agreement_3 <- csumbes_likerts_agreement
#Q97 - res hall
sjp.frq(factor(csumbes_Selected$Q97_Label),coord.flip = T,geom.colors = colorset[4],sort.frq = "asc"
        ,axisTitle.x=get_label(csumbes_Selected$Q97_Label),title="")

#Q98 - family support
plot1 <- sjp.frq(factor(csumbes_Selected$Q98_Label),coord.flip = T,geom.colors = colorset[4],sort.frq = "asc"
        ,axisTitle.x=get_label(csumbes_Selected$Q98_Label),title="",printPlot = F,axisLimits.y = c(0,cases))

#Q99 - hours outside of school csumbes_Selected
plot2 <- sjp.frq(factor(csumbes_Selected$Q99_Label),coord.flip = T,geom.colors = colorset[4],sort.frq = "asc"
        ,axisTitle.x=get_label(csumbes_Selected$Q99_Label),title="",printPlot = F,axisLimits.y = c(0,cases/2))
grid.arrange(plot1$plot, plot2$plot, ncol = 2)

#Q100 - confidence
plot1 <- sjp.frq(factor(csumbes_Selected$Q100_Label),coord.flip = T,geom.colors = colorset[4],sort.frq = "asc"
        ,axisTitle.x=get_label(csumbes_Selected$Q100_Label),title="",printPlot = F,axisLimits.y = c(0,cases))

#Q102 - plans
Q102_Cases <- as.numeric(length(which(csumbes_Selected$Q102 != "NA")))
plot2 <- sjp.frq(factor(csumbes_Selected$Q102_Label),coord.flip = T,geom.colors = colorset[4],sort.frq = "asc"
        ,axisTitle.x=get_label(csumbes_Selected$Q102_Label),title="",printPlot = F,axisLimits.y = c(0,Q102_Cases))
grid.arrange(plot1$plot, plot2$plot, ncol = 2)

#Q103
plot1 <- sjp.frq(factor(csumbes_Selected$Q103_Label),coord.flip = T,geom.colors = colorset[4]
                 ,axisTitle.x=get_label(csumbes_Selected$Q103_Label),title="",printPlot = F,axisLimits.y = c(0,cases/2))
#Q104
plot2 <- sjp.frq(factor(csumbes_Selected$Q104_Label),coord.flip = T,geom.colors = colorset[4]
                 ,axisTitle.x=get_label(csumbes_Selected$Q104_Label),title="",printPlot = F,axisLimits.y = c(0,cases))
grid.arrange(plot1$plot, plot2$plot, ncol = 2)

#demographic frequencies
plot1 <- sjp.frq(factor(csumbes_Selected$D2_Label),coord.flip = T,geom.colors = colorset[4]
        ,axisTitle.x=get_label(csumbes_Selected$D2_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
plot2 <- sjp.frq(factor(csumbes_Selected$D5_Label),coord.flip = T,geom.colors = colorset[4]
        ,axisTitle.x=get_label(csumbes_Selected$D5_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
plot3 <- sjp.frq(factor(csumbes_Selected$D6_Label),coord.flip = T,geom.colors = colorset[4]
        ,axisTitle.x=get_label(csumbes_Selected$D6_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
plot4 <- sjp.frq(factor(csumbes_Selected$D11_Label),coord.flip = T,geom.colors = colorset[4]
                 ,axisTitle.x=get_label(csumbes_Selected$D11_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
grid.arrange(plot1$plot, plot2$plot,plot3$plot, plot4$plot,  ncol = 2, nrow = 2)

sjp.frq(factor(csumbes_Selected$D3_Label),coord.flip = T,geom.colors = colorset[4]
        ,axisTitle.x=get_label(csumbes_Selected$D3_Label),title="",axisLimits.y = c(0,cases/2))

sjp.frq(factor(csumbes_Selected$D9_Label),coord.flip = T,geom.colors = colorset[4]
        ,axisTitle.x=get_label(csumbes_Selected$D9_Label),title="",axisLimits.y = c(0,cases/2))

plot1 <- sjp.frq(factor(csumbes_Selected$D13_Label),coord.flip = T,geom.colors = colorset[4]
                 ,axisTitle.x=get_label(csumbes_Selected$D13_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
plot2 <- sjp.frq(factor(csumbes_Selected$D14_Label),coord.flip = T,geom.colors = colorset[4]
                 ,axisTitle.x=get_label(csumbes_Selected$D14_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
plot3 <- sjp.frq(factor(csumbes_Selected$D15_Label),coord.flip = T,geom.colors = colorset[4]
                 ,axisTitle.x=get_label(csumbes_Selected$D15_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
plot4 <- sjp.frq(factor(csumbes_Selected$D16_Label),coord.flip = T,geom.colors = colorset[4]
                 ,axisTitle.x=get_label(csumbes_Selected$D16_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
grid.arrange(plot1$plot, plot2$plot,plot3$plot, plot4$plot,  ncol = 2, nrow = 2)

plot1 <- sjp.frq(factor(csumbes_Selected$D17_Label),coord.flip = T,geom.colors = colorset[4]
                 ,axisTitle.x=get_label(csumbes_Selected$D17_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
plot2 <- sjp.frq(factor(csumbes_Selected$D18_Label),coord.flip = T,geom.colors = colorset[4]
                 ,axisTitle.x=get_label(csumbes_Selected$D18_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
plot3 <- sjp.frq(factor(csumbes_Selected$D21_Label),coord.flip = T,geom.colors = colorset[4]
                 ,axisTitle.x=get_label(csumbes_Selected$D21_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
plot4 <- sjp.frq(factor(csumbes_Selected$D20_Label),coord.flip = T,geom.colors = colorset[4]
                 ,axisTitle.x=get_label(csumbes_Selected$D20_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
grid.arrange(plot1$plot, plot2$plot,plot3$plot, plot4$plot,  ncol = 2, nrow = 2)

plot1 <- sjp.frq(factor(csumbes_Selected$D22_Label),coord.flip = T,geom.colors = colorset[4]
                 ,axisTitle.x=get_label(csumbes_Selected$D22_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
plot2 <- sjp.frq(factor(csumbes_Selected$D30_Label),coord.flip = T,geom.colors = colorset[4]
                 ,axisTitle.x=get_label(csumbes_Selected$D30_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
plot3 <- sjp.frq(factor(csumbes_Selected$D31_Label),coord.flip = T,geom.colors = colorset[4]
                 ,axisTitle.x=get_label(csumbes_Selected$D31_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
plot4 <- sjp.frq(factor(csumbes_Selected$D29_Label),coord.flip = T,geom.colors = colorset[4]
                 ,axisTitle.x=get_label(csumbes_Selected$D29_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
grid.arrange(plot1$plot, plot2$plot,plot3$plot, plot4$plot,  ncol = 2, nrow = 2)

sjp.frq(factor(csumbes_Selected$D23_Label),coord.flip = T,geom.colors = colorset[4]
        ,axisTitle.x=get_label(csumbes_Selected$D23_Label),title="",axisLimits.y = c(0,cases/2))
sjp.frq(factor(csumbes_Selected$D24_Label),coord.flip = T,geom.colors = colorset[4]
        ,axisTitle.x=get_label(csumbes_Selected$D24_Label),title="")

plot1 <- sjp.frq(factor(csumbes_Selected$D25_Label),coord.flip = T,geom.colors = colorset[4]
        ,axisTitle.x=get_label(csumbes_Selected$D25_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
plot2 <- sjp.frq(factor(csumbes_Selected$D26_Label),coord.flip = T,geom.colors = colorset[4]
        ,axisTitle.x=get_label(csumbes_Selected$D26_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
plot3 <- sjp.frq(factor(csumbes_Selected$D28_Label),coord.flip = T,geom.colors = colorset[4]
        ,axisTitle.x=get_label(csumbes_Selected$D28_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.8))
plot4 <- sjp.frq(factor(csumbes_Selected$D32_Label),coord.flip = T,geom.colors = colorset[4]
        ,axisTitle.x=get_label(csumbes_Selected$D32_Label),title="",printPlot = F,axisLimits.y = c(0,cases * 1.5))
grid.arrange(plot1$plot, plot2$plot,plot3$plot, plot4$plot,  ncol = 2, nrow = 2)

sjp.frq(factor(csumbes_Selected$D33_Label),coord.flip = T,geom.colors = colorset[4]
        ,axisTitle.x=get_label(csumbes_Selected$D33_Label),title="")
sjp.frq(csumbes_Selected$DAge,coord.flip = T,geom.colors = colorset[4]
        ,axisTitle.x=get_label(csumbes_Selected$DAge),title="",type = "hist",showNormalCurve = T
        ,showValueLabels = T,geom.size = 1)
#sjp.frq(factor(csumbes_Selected$DCumlGPA_Cat),coord.flip = T,geom.colors = colorset[4]
#        ,axisTitle.x=get_label(csumbes_Selected$DCumlGPA),title="")
sjp.frq(csumbes_Selected$DCumlGPA_Rounded,coord.flip = T,geom.colors = colorset[4]
        ,axisTitle.x=get_label(csumbes_Selected$DCumlGPA),title="",type = "hist",showNormalCurve = T)



#multi select - Q95 and Q96
multi95 <- data.frame(csumbes_Selected$Q95_1,csumbes_Selected$Q95_2,csumbes_Selected$Q95_3,csumbes_Selected$Q95_4,csumbes_Selected$Q95_5,
                    csumbes_Selected$Q95_6,csumbes_Selected$Q95_7,csumbes_Selected$Q95_8,csumbes_Selected$Q95_9,csumbes_Selected$Q95_10,
                    csumbes_Selected$Q95_11,csumbes_Selected$Q95_12,csumbes_Selected$Q95_13,csumbes_Selected$Q95_14,csumbes_Selected$Q95_15,
                    csumbes_Selected$Q95_16)
multi95[!is.na(multi95)] <- 1
multi95[is.na(multi95)] <- 0
multi96 <- data.frame(csumbes_Selected$Q96_1,csumbes_Selected$Q96_2,csumbes_Selected$Q96_3,csumbes_Selected$Q96_4,csumbes_Selected$Q96_5,
                      csumbes_Selected$Q96_6,csumbes_Selected$Q96_7,csumbes_Selected$Q96_8,csumbes_Selected$Q96_9,csumbes_Selected$Q96_10,
                      csumbes_Selected$Q96_11,csumbes_Selected$Q96_12,csumbes_Selected$Q96_13,csumbes_Selected$Q96_14,csumbes_Selected$Q96_15,
                      csumbes_Selected$Q96_16)
multi96[!is.na(multi96)] <- 1
multi96[is.na(multi96)] <- 0


multi_counts <- data.frame(
  c("Talking to my professor","Graduate school prep","Study Skills","Time Management","Goal Setting","Note Taking","Collaborating with others","Technology","Writing Assignments Projects",
    "Identifying Resources","Math","Science","English as Second Language resources","Grammar Editing","Research and Academic Writing"),
  c(
  sum(multi95$csumbes_Selected.Q95_1),
  sum(multi95$csumbes_Selected.Q95_2),
  sum(multi95$csumbes_Selected.Q95_3),
  sum(multi95$csumbes_Selected.Q95_4),
  sum(multi95$csumbes_Selected.Q95_5),
  sum(multi95$csumbes_Selected.Q95_6),
  sum(multi95$csumbes_Selected.Q95_7),
  sum(multi95$csumbes_Selected.Q95_8),
  sum(multi95$csumbes_Selected.Q95_9),
  sum(multi95$csumbes_Selected.Q95_10),
  sum(multi95$csumbes_Selected.Q95_11),
  sum(multi95$csumbes_Selected.Q95_12),
  sum(multi95$csumbes_Selected.Q95_13),
  sum(multi95$csumbes_Selected.Q95_14),
  sum(multi95$csumbes_Selected.Q95_15)
),
c(
  sum(multi96$csumbes_Selected.Q96_1),
  sum(multi96$csumbes_Selected.Q96_2),
  sum(multi96$csumbes_Selected.Q96_3),
  sum(multi96$csumbes_Selected.Q96_4),
  sum(multi96$csumbes_Selected.Q96_5),
  sum(multi96$csumbes_Selected.Q96_6),
  sum(multi96$csumbes_Selected.Q96_7),
  sum(multi96$csumbes_Selected.Q96_8),
  sum(multi96$csumbes_Selected.Q96_9),
  sum(multi96$csumbes_Selected.Q96_10),
  sum(multi96$csumbes_Selected.Q96_11),
  sum(multi96$csumbes_Selected.Q96_12),
  sum(multi96$csumbes_Selected.Q96_13),
  sum(multi96$csumbes_Selected.Q96_14),
  sum(multi96$csumbes_Selected.Q96_15)
)
)

multi_counts <- rename.vars(multi_counts,from="c..Talking.to.my.professor....Graduate.school.prep....Study.Skills...",to="TutoringNeed")
multi_counts <- rename.vars(multi_counts,from="c.sum.multi95.csumbes_Selected.Q95_1...sum.multi95.csumbes_Selected.Q95_2...",to="Q95")
multi_counts <- rename.vars(multi_counts,from="c.sum.multi96.csumbes_Selected.Q96_1...sum.multi96.csumbes_Selected.Q96_2...",to="Q96")
label(multi_counts$TutoringNeed) <- "Tutoring Topic"
label(multi_counts$Q95) <- "Need Help"
label(multi_counts$Q96) <- "Had Tutoring"

mc_df <- melt(multi_counts)
#factor(mc_df$variable,levels = c("Q95","Q96"), labels = c(label(multi_counts$Q95),label(multi_counts$Q96)))
mc_df$variableLabel[mc_df$variable == "Q95"] <- label(multi_counts$Q95)
mc_df$variableLabel[mc_df$variable == "Q96"] <- label(multi_counts$Q96)
#View(mc_df)
plot1 <- ggplot(mc_df,aes(TutoringNeed,value,fill=variableLabel))+
  geom_bar(stat="identity",position="dodge")+
  coord_flip()+ 
  ggtitle("Students who Need Help or Had Tutoring")+
  xlab(label(multi_counts$TutoringNeed))+
  ylab(paste("Students"))+
  ylim(0,max(mc_df$value) * 1.25)+
  scale_fill_manual(values = colorset[3:4])+
  geom_text(aes(label=format(value,big.mark = ",")), position=position_dodge(width=0.9), vjust=0.3, hjust=-0.1)
plot1 + theme(legend.title = element_blank())



#Q101, Q105-107 should go to QSRT

dev.off()
} #for loop closes here

