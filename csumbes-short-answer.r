#designed for r 3.25
#short answer
#Q26_11, Q89_5, Q89_7, Q95_17, Q96_17 short answer
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
if(!require(tm)) {
  install.packages("tm")
}
require(tm)
if(!require(wordcloud)) {
  install.packages("wordcloud")
}
require(wordcloud)
defaultStopWords <- read.csv(file = "M:\\Institutional Assessment and Research\\private\\COMMON FOLDER\\CSUMB Experience Survey\\Spring 2016\\Analyses\\stopwords.txt",header = F)
defaultStopWords <- as.character(defaultStopWords)
myStopwords <- c("csumb")
removeslash <- function(x) gsub("/", " ", x)

# if (!require(Rgraphviz)){
#   source("https://bioconductor.org/biocLite.R")
#   biocLite("Rgraphviz")
# }
#require(Rgraphviz)
#browseVignettes("Rgraphviz")

# short_answer_src <- data.frame(csumbes_Selected$Q101_1OT[csumbes_Selected$Q101_1OT != ""])
# short_answer <- DataframeSource(short_answer_src)
# short_answer <- Corpus(short_answer)
# inspect(short_answer)
#data cleanup
# short_answer <- tm_map(short_answer, tolower)
# short_answer <- tm_map(short_answer, removePunctuation)
# short_answer <- tm_map(short_answer, removeNumbers)
# short_answer <- tm_map(short_answer, stripWhitespace)
# 
# short_answer<- tm_map(short_answer, removeslash)
# short_answer <- tm_map(short_answer, removeWords, stopwords('english'))
# short_answer <- tm_map(short_answer, removeWords, defaultStopWords)
# short_answer <- tm_map(short_answer, removeWords, myStopwords)
# short_answer <- tm_map(short_answer, PlainTextDocument)
# Constructs the matrix based on term frequencies
# dtm <- DocumentTermMatrix(short_answer)
# Constructs the matrix based on weighted frequencies
#dtm2 <- DocumentTermMatrix(short_answer, control=list(weighting = weightTfIdf))
# Adds up the counts by column
# dtm_freq <- data.frame(colnames(dtm),colSums(as.matrix(dtm)))
# View(dtm_freq)
# sjt.frq(dtm_freq$colnames.dtm.,weightBy = dtm_freq$colSums.as.matrix.dtm..)
# wordcloud(short_answer,min.freq = length(short_answer)/100,max.words = 100,random.color = T,colors = colorset)
# word_list <- findFreqTerms(dtm,1)
# write.csv(dtm_freq,file = "words.csv")
# wf_time <- data.frame(findAssocs(dtm,"time",corlimit=0.2))
# wf_classes <- data.frame(findAssocs(dtm,"classes",corlimit=0.3))
# wf_transfer <- data.frame(findAssocs(dtm,"transfer",corlimit=0.2))
#plot(dtm)
# Hierarchical cluster analysis using Ward’s minimum variance criteria
#distancematrix <- dist(dtm, method="euclidian")
#wf_model <- hclust(distancematrix, method="ward.D")
#Display dendrogram
#plot(wf_model)
#Add rectangles around the branches of the dendrogram highlighting clusters
#rect.hclust(wf_model, k=4, border="red")

pdf(file = "wordclouds.pdf")
#Sustainability
short_answer_src <- data.frame(csumbes_Selected$Q26_11OT[csumbes_Selected$Q26_11OT != ""])
short_answer <- DataframeSource(short_answer_src)
short_answer <- Corpus(short_answer)
#data cleanup
short_answer <- tm_map(short_answer, tolower)
short_answer <- tm_map(short_answer, removePunctuation)
short_answer <- tm_map(short_answer, removeNumbers)
short_answer <- tm_map(short_answer, stripWhitespace)
short_answer<- tm_map(short_answer, removeslash)
short_answer <- tm_map(short_answer, removeWords, stopwords('english'))
short_answer <- tm_map(short_answer, removeWords, defaultStopWords)
short_answer <- tm_map(short_answer, removeWords, myStopwords)
short_answer <- tm_map(short_answer, PlainTextDocument)
layout(matrix(c(1, 2), nrow=2), heights=c(1, 4))
par(mar=rep(0, 4))
plot.new()
text(x=0.5, y=0.5, label(csumbes_Selected$Q26_11OT))
wordcloud(short_answer,min.freq = length(short_answer)/100,max.words = 100,random.color = T,colors = colorset)
#Advisor
short_answer_src <- data.frame(csumbes_Selected$Q89_5OT[csumbes_Selected$Q89_5OT != ""])
short_answer <- DataframeSource(short_answer_src)
short_answer <- Corpus(short_answer)
#data cleanup
short_answer <- tm_map(short_answer, tolower)
short_answer <- tm_map(short_answer, removePunctuation)
short_answer <- tm_map(short_answer, removeNumbers)
short_answer <- tm_map(short_answer, stripWhitespace)
short_answer<- tm_map(short_answer, removeslash)
short_answer <- tm_map(short_answer, removeWords, stopwords('english'))
short_answer <- tm_map(short_answer, removeWords, defaultStopWords)
short_answer <- tm_map(short_answer, removeWords, myStopwords)
short_answer <- tm_map(short_answer, PlainTextDocument)
layout(matrix(c(1, 2), nrow=2), heights=c(1, 4))
par(mar=rep(0, 4))
plot.new()
text(x=0.5, y=0.5, label(csumbes_Selected$Q89_5OT))
wordcloud(short_answer,min.freq = length(short_answer)/100,max.words = 100,random.color = T,colors = colorset)
#Advisor
short_answer_src <- data.frame(csumbes_Selected$Q89_7OT[csumbes_Selected$Q89_7OT != ""])
short_answer <- DataframeSource(short_answer_src)
short_answer <- Corpus(short_answer)
#data cleanup
short_answer <- tm_map(short_answer, tolower)
short_answer <- tm_map(short_answer, removePunctuation)
short_answer <- tm_map(short_answer, removeNumbers)
short_answer <- tm_map(short_answer, stripWhitespace)
short_answer<- tm_map(short_answer, removeslash)
short_answer <- tm_map(short_answer, removeWords, stopwords('english'))
short_answer <- tm_map(short_answer, removeWords, defaultStopWords)
short_answer <- tm_map(short_answer, removeWords, myStopwords)
short_answer <- tm_map(short_answer, PlainTextDocument)
layout(matrix(c(1, 2), nrow=2), heights=c(1, 4))
par(mar=rep(0, 4))
plot.new()
text(x=0.5, y=0.5, label(csumbes_Selected$Q89_7OT))
wordcloud(short_answer,min.freq = length(short_answer)/100,max.words = 100,random.color = T,colors = colorset)
#Tutoring Need
short_answer_src <- data.frame(csumbes_Selected$Q95_17OT[csumbes_Selected$Q95_17OT != ""])
short_answer <- DataframeSource(short_answer_src)
short_answer <- Corpus(short_answer)
#data cleanup
short_answer <- tm_map(short_answer, tolower)
short_answer <- tm_map(short_answer, removePunctuation)
short_answer <- tm_map(short_answer, removeNumbers)
short_answer <- tm_map(short_answer, stripWhitespace)
short_answer<- tm_map(short_answer, removeslash)
short_answer <- tm_map(short_answer, removeWords, stopwords('english'))
short_answer <- tm_map(short_answer, removeWords, defaultStopWords)
short_answer <- tm_map(short_answer, removeWords, myStopwords)
short_answer <- tm_map(short_answer, PlainTextDocument)
layout(matrix(c(1, 2), nrow=2), heights=c(1, 4))
par(mar=rep(0, 4))
plot.new()
text(x=0.5, y=0.5, label(csumbes_Selected$Q95_17OT))
wordcloud(short_answer,min.freq = length(short_answer)/100,max.words = 100,random.color = T,colors = colorset)
#Tutoring Done
short_answer_src <- data.frame(csumbes_Selected$Q96_17OT[csumbes_Selected$Q96_17OT != ""])
short_answer <- DataframeSource(short_answer_src)
short_answer <- Corpus(short_answer)
#data cleanup
short_answer <- tm_map(short_answer, tolower)
short_answer <- tm_map(short_answer, removePunctuation)
short_answer <- tm_map(short_answer, removeNumbers)
short_answer <- tm_map(short_answer, stripWhitespace)
short_answer<- tm_map(short_answer, removeslash)
short_answer <- tm_map(short_answer, removeWords, stopwords('english'))
short_answer <- tm_map(short_answer, removeWords, defaultStopWords)
short_answer <- tm_map(short_answer, removeWords, myStopwords)
short_answer <- tm_map(short_answer, PlainTextDocument)
layout(matrix(c(1, 2), nrow=2), heights=c(1, 4))
par(mar=rep(0, 4))
plot.new()
text(x=0.5, y=0.5, label(csumbes_Selected$Q96_17OT))
wordcloud(short_answer,min.freq = length(short_answer)/100,max.words = 100,random.color = T,colors = colorset)
#Leavers
short_answer_src <- data.frame(csumbes_Selected$Q101_1OT[csumbes_Selected$Q101_1OT != ""])
short_answer <- DataframeSource(short_answer_src)
short_answer <- Corpus(short_answer)
#data cleanup
short_answer <- tm_map(short_answer, tolower)
short_answer <- tm_map(short_answer, removePunctuation)
short_answer <- tm_map(short_answer, removeNumbers)
short_answer <- tm_map(short_answer, stripWhitespace)
short_answer<- tm_map(short_answer, removeslash)
short_answer <- tm_map(short_answer, removeWords, stopwords('english'))
short_answer <- tm_map(short_answer, removeWords, defaultStopWords)
short_answer <- tm_map(short_answer, removeWords, myStopwords)
short_answer <- tm_map(short_answer, PlainTextDocument)
layout(matrix(c(1, 2), nrow=2), heights=c(1, 4))
par(mar=rep(0, 4))
plot.new()
text(x=0.5, y=0.5, label(csumbes_Selected$Q101_1OT))
wordcloud(short_answer,min.freq = length(short_answer)/100,max.words = 100,random.color = T,colors = colorset)
dev.off()
