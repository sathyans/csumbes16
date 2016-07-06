#designed for r 3.25
if(!require(Hmisc)){
  install.packages("Hmisc")
}
require(Hmisc)
colnames(csumbes16)[59:218]
surveyVariableList <- data.frame(colnames(csumbes16)[59:218],label(csumbes16)[59:218])
#View(surveyVariableList)
names(surveyVariableList)[1] <- "Variable_Name"
names(surveyVariableList)[2] <- "Variable_Label"
surveyVariableList$Construct <- ""
if(!require(openxlsx)){
  install.packages("openxlsx")
}
require(openxlsx)
hs <- createStyle(textDecoration = "BOLD", fontColour = "#FFFFFF", fontSize=12,
                  fontName="Arial Narrow", fgFill = "#4F80BD", borderStyle = "thick")
wb <- createWorkbook()
addWorksheet(wb,"CSUMBES Survey Questions")
setColWidths(wb,sheet = 1,cols = 1,widths = 20)#name
setColWidths(wb,sheet = 1,cols = 2,widths = 100)#label
setColWidths(wb,sheet = 1,cols = 3,widths = 30)#construct
writeData(wb,sheet=1,x=surveyVariableList,headerStyle = hs, colNames = T, borders = "all")
saveWorkbook(wb,file = "M:\\Institutional Assessment and Research\\private\\COMMON FOLDER\\CSUMB Experience Survey\\Spring 2016\\csumbes_survey_questions.xlsx", overwrite = T)
