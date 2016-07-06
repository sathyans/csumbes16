#add sustainability to qsrt
#designed for r 3.3
#export data for qualitative analysis in QSRT
targetfilename <- "csumbes16.RData"
targetfilepath <- "M:\\Institutional Assessment and Research\\private\\COMMON FOLDER\\CSUMB Experience Survey\\Spring 2016\\Final Results\\"
targetfullname <- paste(targetfilepath,targetfilename,sep="")
load(file = targetfullname)
colnames(csumbes16)
library(Hmisc)
label(csumbes16$Q26_11OT)
#target folder
targetPathQual <- "M:\\Institutional Assessment and Research\\private\\COMMON FOLDER\\Qualitative Coding\\CSUMBES\\2016\\"
require(data.table)
sustQual <- data.frame(csumbes16$CASENUM,csumbes16$Q26_11OT,csumbes16$D25_Label,csumbes16$D2_Label,csumbes16$D5_Label,csumbes16$D26_Label
                       ,csumbes16$D23_Label,csumbes16$D6_Label,csumbes16$D24_Label,csumbes16$D28_Label,csumbes16$D31_Label)
setnames(sustQual,c("CaseID","Comment","D25_Label","D2_Label","D5_Label","D26_Label","D23_Label","D6_Label","D24_Label","D28_Label","D31_Label"))
sustQual$K_question_number[sustQual$Comment != ""] <- "Q_26"
sustQual$K_Survey_Name <- "CSUMBES"
sustQual$K_Survey_Year <- "2016"
sustQual <- subset(sustQual,!is.na(sustQual$K_question_number))
require(gdata)
sustQual <- rename.vars(sustQual, from = "CaseID", to="K_CaseID")
sustQual <- rename.vars(sustQual, from = "D25_Label", to="D_ClassLevel")
sustQual <- rename.vars(sustQual, from = "D2_Label", to="D_Gender")
sustQual <- rename.vars(sustQual, from = "D5_Label", to="D_EnrlStatus")
sustQual <- rename.vars(sustQual, from = "D26_Label", to="D_AdmitType")
sustQual <- rename.vars(sustQual, from = "D23_Label", to="D_College")
sustQual <- rename.vars(sustQual, from = "D6_Label", to="D_URM")
sustQual <- rename.vars(sustQual, from = "D24_Label", to="D_Major")
sustQual <- rename.vars(sustQual, from = "D28_Label", to="D_Cohort_Status")
sustQual <- rename.vars(sustQual, from = "D31_Label", to="D_FirstGeneration")
require(plyr)
sustQual$D_AdmitType <- revalue(sustQual$D_AdmitType,c("First-Time Freshmen"="Native","Upper Division Transfer"="Transfer"
                                                             ,"Lower Division Transfer"="Transfer","Transitory"="Transitory"))
sustQual$D_URM <- revalue(sustQual$D_URM,c("Not URM"="NonURM"))  
sustQual$D_FirstGeneration <- revalue(sustQual$D_FirstGeneration,c("First Generation"="Y","Not First Generation"="N"))  
sustQual$D_Department <- revalue(sustQual$D_Major,c("BIO"="SNS","BUS"="BUS","CD"="SCD","CHHS"="HHSPP","CINE"="CART","CSCI"="SCD"
                                                          ,"CSIT"="SCD","ENSTU"="SNS","ESTP"="SNS","GS"="SBSGS","HCOM"="HCOM","ISSM"="ISSM","JLC"="WLC","KIN"="KIN","LS"="LS","MATH"="MATH"
                                                          ,"MS (BS)"="SNS","MUS"="MPA","NURS"="NURS","PSY"="PSY","SBS"="SBSGS","SHM"="BUS","SPAN"="WLC","UNDC"="UNDC","VPA"="VPA","WLC"="WLC")
)
sustQual <- cbind(1:nrow(sustQual),sustQual)
sustQual$`1:nrow(sustQual)` <- sustQual$`1:nrow(sustQual)` + 26000
sustQual$Combined_Key <- paste(sustQual$K_Survey_Name,sustQual$K_Survey_Year,sustQual$K_question_number,sustQual$K_CaseID,sep = "-")
sustQual <- data.frame(sustQual$`1:nrow(sustQual)`,sustQual$K_Survey_Name,sustQual$K_Survey_Year,sustQual$K_question_number,sustQual$K_CaseID
                          ,sustQual$Combined_Key
                          ,sustQual$Comment,sustQual$Comment,sustQual$D_ClassLevel,sustQual$D_Gender,sustQual$D_EnrlStatus,sustQual$D_AdmitType
                          ,sustQual$D_College,sustQual$D_URM,sustQual$D_Major,sustQual$D_Department,sustQual$D_Cohort_Status,sustQual$D_FirstGeneration)
setnames(sustQual,c("RecordID","K_Survey_Name","K_Survey_Year","K_question_number","K_CaseID","Combined_Key","Comment","Comment_Redacted","D_ClassLevel","D_Gender",
                       "D_EnrlStatus","D_AdmitType","D_College","D_URM","D_Major","D_Department","D_Cohort_Status",
                       "D_FirstGeneration"))
save(sustQual,file = paste(targetPathQual,"CSUMBES_Qual_Sustain.RData",sep = ""))
write.table(sustQual,paste(targetPathQual,"SQ_Staging_Responses-Sustain.csv",sep = ""),sep = "\t",quote = F,row.names = F)
