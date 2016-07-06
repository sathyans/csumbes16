#Decision trees
if(!require(rpart)){
  install.packages("rpart")
}
require(rpart)
if(!require(rpart.plot)){
  install.packages("rpart.plot")
}
require(rpart.plot)
if(!require(rpart.utils)){
  install.packages("rpart.utils")
}
require(rpart.utils)
formula1 <- Q100 ~ Q19 + Q22 + Q31 + DCumlGPA_Num
formula2 <- Q100 ~  csumbes16$DCumlGPA_Num
formula3 <- Q100 ~  csumbes16$Q46 + csumbes16$Q47 + csumbes16$Q48

ctrl0025 <- rpart.control(minsplit=100, cp=0.0025, xval=10)
ctrl0015 <- rpart.control(minsplit=100, cp=0.0015, xval=10)
ctrl0050 <- rpart.control(minsplit=100, cp=0.0050, xval=10)

mdl1 <- rpart::rpart(formula = formula1, data = csumbes16,method = "poisson", control = ctrl0050 )
#methods: class, anova, poisson, exp
printcp(mdl1)
print(mdl1)
rsq.rpart(mdl1)
rpart.plot::prp(mdl1, extra = 102, varlen = 0, main = "CSUMBES 2016", left = F)


cor.test(csumbes16$DCumlGPA_Num,csumbes16$Q100)
hist(csumbes16$Q100)
