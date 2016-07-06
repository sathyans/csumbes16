#designed for r 3.3
#export data for qualitative analysis in QSRT
targetfilename <- "csumbes16.RData"
targetfilepath <- "M:\\Institutional Assessment and Research\\private\\COMMON FOLDER\\CSUMB Experience Survey\\Spring 2016\\Final Results\\"
targetfullname <- paste(targetfilepath,targetfilename,sep="")
load(file = targetfullname)
colnames(csumbes16)
#target folder
targetPathQual <- "M:\\Institutional Assessment and Research\\private\\COMMON FOLDER\\Qualitative Coding\\CSUMBES\\2016\\"
# make the mapping
idmapping <- data.frame(csumbes16$CASENUM,FixEmplid(csumbes16$DEmplid))
if(!require(data.table)) {
  install.packages("data.table")
}
require(data.table)
setnames(idmapping,c("CaseID","Emplid"))
write.table(idmapping,file = paste(targetPathQual,"idmapping.csv",sep = ""),sep = "\t",quote = F,row.names = F)

#K_CaseID CASENUM [1]
#Q_101 Q101_1OT [209]
#Q_105 Q105_1OT [214]
#Q_106 Q106_1OT [216]
#Q_107 Q107_1OT [218]
#D_ClassLevel D25_Label [249]
#D_Gender D2_Label [232]
#D_EnrlStatus D5_Label [234]
#D_AdmitType D26_Label [250]
#D_College D23_Label [247]
#D_URM D6_Label [235]
#D_Major D24_Label [248]
#D_Department []
#D_Cohort_Status D28_Label [252]
#D_FirstGeneration D31_Label [255]


#Q101
tempQual <- data.frame(csumbes16$CASENUM,csumbes16$Q101_1OT,csumbes16$D25_Label,csumbes16$D2_Label,csumbes16$D5_Label,csumbes16$D26_Label
                       ,csumbes16$D23_Label,csumbes16$D6_Label,csumbes16$D24_Label,csumbes16$D28_Label,csumbes16$D31_Label)
setnames(tempQual,c("CaseID","Comment","D25_Label","D2_Label","D5_Label","D26_Label","D23_Label","D6_Label","D24_Label","D28_Label","D31_Label"))
tempQual$K_question_number[tempQual$Comment != ""] <- "Q_101"
tempQual <- subset(tempQual,!is.na(tempQual$K_question_number))
csumbesQual <- tempQual
rm(tempQual)

#105
tempQual <- data.frame(csumbes16$CASENUM,csumbes16$Q105_1OT,csumbes16$D25_Label,csumbes16$D2_Label,csumbes16$D5_Label,csumbes16$D26_Label
                       ,csumbes16$D23_Label,csumbes16$D6_Label,csumbes16$D24_Label,csumbes16$D28_Label,csumbes16$D31_Label)
setnames(tempQual,c("CaseID","Comment","D25_Label","D2_Label","D5_Label","D26_Label","D23_Label","D6_Label","D24_Label","D28_Label","D31_Label"))
tempQual$K_question_number[tempQual$Comment != ""] <- "Q_105"
tempQual <- subset(tempQual,!is.na(tempQual$K_question_number))
csumbesQual <- rbind(csumbesQual,tempQual)
rm(tempQual)

#106
tempQual <- data.frame(csumbes16$CASENUM,csumbes16$Q106_1OT,csumbes16$D25_Label,csumbes16$D2_Label,csumbes16$D5_Label,csumbes16$D26_Label
                       ,csumbes16$D23_Label,csumbes16$D6_Label,csumbes16$D24_Label,csumbes16$D28_Label,csumbes16$D31_Label)
setnames(tempQual,c("CaseID","Comment","D25_Label","D2_Label","D5_Label","D26_Label","D23_Label","D6_Label","D24_Label","D28_Label","D31_Label"))
tempQual$K_question_number[tempQual$Comment != ""] <- "Q_106"
tempQual <- subset(tempQual,!is.na(tempQual$K_question_number))
csumbesQual <- rbind(csumbesQual,tempQual)
rm(tempQual)

#107
tempQual <- data.frame(csumbes16$CASENUM,csumbes16$Q107_1OT,csumbes16$D25_Label,csumbes16$D2_Label,csumbes16$D5_Label,csumbes16$D26_Label
                       ,csumbes16$D23_Label,csumbes16$D6_Label,csumbes16$D24_Label,csumbes16$D28_Label,csumbes16$D31_Label)
setnames(tempQual,c("CaseID","Comment","D25_Label","D2_Label","D5_Label","D26_Label","D23_Label","D6_Label","D24_Label","D28_Label","D31_Label"))
tempQual$K_question_number[tempQual$Comment != ""] <- "Q_107"
tempQual <- subset(tempQual,!is.na(tempQual$K_question_number))
csumbesQual <- rbind(csumbesQual,tempQual)
rm(tempQual)

#combined
csumbesQual$K_Survey_Name <- "CSUMBES"
csumbesQual$K_Survey_Year <- "2016"
if(!require(gdata)) {
  install.packages("gdata")
}
require(gdata)
csumbesQual <- rename.vars(csumbesQual, from = "CaseID", to="K_CaseID")
csumbesQual <- rename.vars(csumbesQual, from = "D25_Label", to="D_ClassLevel")
csumbesQual <- rename.vars(csumbesQual, from = "D2_Label", to="D_Gender")
csumbesQual <- rename.vars(csumbesQual, from = "D5_Label", to="D_EnrlStatus")
csumbesQual <- rename.vars(csumbesQual, from = "D26_Label", to="D_AdmitType")
csumbesQual <- rename.vars(csumbesQual, from = "D23_Label", to="D_College")
csumbesQual <- rename.vars(csumbesQual, from = "D6_Label", to="D_URM")
csumbesQual <- rename.vars(csumbesQual, from = "D24_Label", to="D_Major")
csumbesQual <- rename.vars(csumbesQual, from = "D28_Label", to="D_Cohort_Status")
csumbesQual <- rename.vars(csumbesQual, from = "D31_Label", to="D_FirstGeneration")

#recode to match DB
if(!require(plyr)){
  install.packages("plyr")
}
require(plyr)
csumbesQual$D_AdmitType <- revalue(csumbesQual$D_AdmitType,c("First-Time Freshmen"="Native","Upper Division Transfer"="Transfer"
         ,"Lower Division Transfer"="Transfer","Transitory"="Transitory"))
csumbesQual$D_URM <- revalue(csumbesQual$D_URM,c("Not URM"="NonURM"))  
csumbesQual$D_FirstGeneration <- revalue(csumbesQual$D_FirstGeneration,c("First Generation"="Y","Not First Generation"="N"))  
csumbesQual$D_Department <- revalue(csumbesQual$D_Major,c("BIO"="SNS","BUS"="BUS","CD"="SCD","CHHS"="HHSPP","CINE"="CART","CSCI"="SCD"
        ,"CSIT"="SCD","ENSTU"="SNS","ESTP"="SNS","GS"="SBSGS","HCOM"="HCOM","ISSM"="ISSM","JLC"="WLC","KIN"="KIN","LS"="LS","MATH"="MATH"
        ,"MS (BS)"="SNS","MUS"="MPA","NURS"="NURS","PSY"="PSY","SBS"="SBSGS","SHM"="BUS","SPAN"="WLC","UNDC"="UNDC","VPA"="VPA","WLC"="WLC")
        )

#reorder data frame
# csumbesQual <- data.frame(csumbesQual$K_Survey_Name,csumbesQual$K_Survey_Year,csumbesQual$K_question_number,csumbesQual$K_CaseID
#               ,csumbesQual$Comment,csumbesQual$D_ClassLevel,csumbesQual$D_Gender,csumbesQual$D_EnrlStatus,csumbesQual$D_AdmitType
#               ,csumbesQual$D_College,csumbesQual$D_URM,csumbesQual$D_Major,csumbesQual$D_Department,csumbesQual$D_Cohort_Status,csumbesQual$D_FirstGeneration)
# setnames(csumbesQual,c("K_Survey_Name","K_Survey_Year","K_question_number","K_CaseID","Comment","D_ClassLevel","D_Gender",
#                        "D_EnrlStatus","D_AdmitType","D_College","D_URM","D_Major","D_Department","D_Cohort_Status",
#                        "D_FirstGeneration"))
csumbesQual <- cbind(1:nrow(csumbesQual),csumbesQual)
csumbesQual$`1:nrow(csumbesQual)` <- csumbesQual$`1:nrow(csumbesQual)` + 19000
csumbesQual$Combined_Key <- paste(csumbesQual$K_Survey_Name,csumbesQual$K_Survey_Year,csumbesQual$K_question_number,csumbesQual$K_CaseID,sep = "-")
csumbesQual <- data.frame(csumbesQual$`1:nrow(csumbesQual)`,csumbesQual$K_Survey_Name,csumbesQual$K_Survey_Year,csumbesQual$K_question_number,csumbesQual$K_CaseID
                          ,csumbesQual$Combined_Key
                          ,csumbesQual$Comment,csumbesQual$Comment,csumbesQual$D_ClassLevel,csumbesQual$D_Gender,csumbesQual$D_EnrlStatus,csumbesQual$D_AdmitType
                          ,csumbesQual$D_College,csumbesQual$D_URM,csumbesQual$D_Major,csumbesQual$D_Department,csumbesQual$D_Cohort_Status,csumbesQual$D_FirstGeneration)
setnames(csumbesQual,c("RecordID","K_Survey_Name","K_Survey_Year","K_question_number","K_CaseID","Combined_Key","Comment","Comment_Redacted","D_ClassLevel","D_Gender",
                       "D_EnrlStatus","D_AdmitType","D_College","D_URM","D_Major","D_Department","D_Cohort_Status",
                       "D_FirstGeneration"))


#save file
save(csumbesQual,file = paste(targetPathQual,"CSUMBES_Qual.RData",sep = ""))

#export to pipe delimited text responses file - separate file for each question
# qualQtns <- unique(csumbesQual$K_question_number)
# for (i in qualQtns){
#   print(paste("Processing ...",i))
#   qualOutput <- subset(csumbesQual,csumbesQual$K_question_number == i)
#   qualOutput <- rename.vars(qualOutput, from = "Comment", to = i)
#   write.table(qualOutput,paste(targetPathQual,"Survey_Qual_Response_",i,".txt",sep = ""),sep = "|",quote = F,row.names = F)
#   
# }

write.table(csumbesQual,paste(targetPathQual,"SQ_Staging_Responses.csv",sep = ""),sep = "\t",quote = F,row.names = F)

# qual107 <- subset(csumbesQual,csumbesQual$K_question_number == 'Q_107')
# write.table(qual107,paste(targetPathQual,"SQ_Staging_Responses107.csv",sep = ""),sep = "\t",quote = F,row.names = F)


#export to excel route to SPSS TAS
# if(!require(openxlsx)){
#   install.packages("openxlsx")
# }
# require(openxlsx)
# Sys.setenv("R_ZIPCMD" = "C:\\Program Files\\R\\R-3.3.0\\Rtools\\bin\\zip.exe")
# excel_data <- paste(targetPathQual,"Survey_Qual_Response.xlsx",sep = "")
# wbout <- createWorkbook()
# addWorksheet(wbout,"CSUMBES16Qual")
# writeData(wbout,sheet=1,x=csumbesQual, colNames = T, borders = "all")
# #next line has this error
# #Error: zipping up workbook failed. Please make sure Rtools is installed or a zip application is available to R.
# #Try installr::install.rtools() on Windows.
# #need to run as administrator
# #install.packages("installr")
# #installr::install.rtools()
# saveWorkbook(wbout,file = excel_data, overwrite = T)   
# rm(wbout,excel_data)

