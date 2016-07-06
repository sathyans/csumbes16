#designed for r 3.25
#pull in csumbes file
surveyfilename <- "exportResults_20160601.txt"
surveyfilepath <- "M:\\Institutional Assessment and Research\\private\\COMMON FOLDER\\CSUMB Experience Survey\\Spring 2016\\Final Results\\"
surveyfullname <- paste(surveyfilepath,surveyfilename,sep="")
targetfilename <- "csumbes16.RData"
targetfilepath <- "M:\\Institutional Assessment and Research\\private\\COMMON FOLDER\\CSUMB Experience Survey\\Spring 2016\\Final Results\\"
targetfullname <- paste(targetfilepath,targetfilename,sep="")

csumbes16 <- read.csv(surveyfullname,header = T,sep = "\t",encoding = "UTF-8")
csumbes16[with(csumbes16,order("DateTime","RespondentId")),]
csumbes16 <- cbind(1:nrow(csumbes16), csumbes16)

dim(csumbes16)
head(csumbes16)
names(csumbes16)

backup <- csumbes16
#restore
#csumbes16 <- backup
data <- csumbes16
if(!require(gdata)) {
  install.packages("gdata")
}
require(gdata)
if(!require(Hmisc)) {
  install.packages("Hmisc")
}
require(Hmisc)

#shorten the variable names
#demographics
data <- rename.vars(data, from = "1:nrow(csumbes16)", to="CASENUM")
data <- rename.vars(data, from="Q1_1.Name.", to="D1_1")
data <- rename.vars(data, from="Q1_2.Last.Name.", to="D1_2")
data <- rename.vars(data, from="Q1_3.First.Name.", to="D1_3")
data <- rename.vars(data, from="Q1_4.Middle.Name.", to="D1_4")
data <- rename.vars(data, from="Q1_5.Email.Address.", to="D1_5")
data <- rename.vars(data, from="Q1_6.OtterID.", to="D1_6")
data <- rename.vars(data, from="Q1_7.EmplID.", to="D1_7")
data <- rename.vars(data, from="Q1_1OT", to="DFullName")
data <- rename.vars(data, from="Q1_2OT", to="DLastName")
data <- rename.vars(data, from="Q1_3OT", to="DFirstName")
data <- rename.vars(data, from="Q1_4OT", to="DMiddleName")
data <- rename.vars(data, from="Q1_5OT", to="DEmail")
data <- rename.vars(data, from="Q1_6OT", to="DOtterID")
data <- rename.vars(data, from="Q1_7OT", to="DEmplid")
data <- rename.vars(data, from="Q2..Gender.", to="D2")
data <- rename.vars(data, from="Q3..Race.Ethnicity.", to="D3")
data <- rename.vars(data, from="Q4..Beginning.of.Spring.2016.Term.CumGPA." , to="D4")
#data <- rename.vars(data, from="Q4_1OT", to="DCumlGPA")
data$DCumlGPA <- as.numeric(as.character(data$Q4_1OT))
data <- rename.vars(data, from= "Q5..FT...PT.Status.", to="D5")
data <- rename.vars(data, from="Q6..URM.", to="D6")
data <- rename.vars(data, from="Q7..Age.", to="D7")
data <- rename.vars(data, from="Q7_1OT", to="DAge")
data <- rename.vars(data, from="Q8..Csu.Co.Resid.Loc.",to="D8")                                                                                                                                                                                              
data <- rename.vars(data, from="Q8_1OT",to="DResidence")                                                                                                                                                                                                             
data <- rename.vars(data, from="Q9..Region.",to="D9")                                                                                                                                                                                                        
data <- rename.vars(data, from="Q10..Csu.Co.Resid.Stat."   ,to="D10")                                                                                                                                                                                         
data <- rename.vars(data, from="Q11..Residency."      ,to="D11")                                                                                                                                                                                              
data <- rename.vars(data, from="Q12..Institution.of.Origin.",to="D12")                                                                                                                                                                                        
data <- rename.vars(data, from="Q12_1OT",to="DIOC")                                                                                                                                                                                                            
data <- rename.vars(data, from="Q13..Please.answer.the.following....EOP" ,to="D13")                                                                                                                                                                           
data <- rename.vars(data, from="Q14..Please.answer.the.following....SDR" ,to="D14")                                                                                                                                                                           
data <- rename.vars(data, from="Q15..Please.answer.the.following....Athletics" ,to="D15")                                                                                                                                                                     
data <- rename.vars(data, from="Q16..Please.answer.the.following....SB.1440",to="D16")                                                                                                                                                                        
data <- rename.vars(data, from="Q17..Please.answer.the.following....CAMP"  ,to="D17")                                                                                                                                                                         
data <- rename.vars(data, from="Q18..Please.answer.the.following....Former.Foster.Youth" ,to="D18")                                                                                                                                                           
data <- rename.vars(data, from="Q19..Please.answer.the.following....STEM"    ,to="D19")                                                                                                                                                                       
data <- rename.vars(data, from="Q20..Please.answer.the.following....Student.Support.Services",to="D20")                                                                                                                                                       
data <- rename.vars(data, from="Q21..Please.answer.the.following....Super.Seniors" ,to="D21")                                                                                                                                                                 
data <- rename.vars(data, from="Q22..Please.answer.the.following....UROC"   ,to="D22")                                                                                                                                                                        
data <- rename.vars(data, from="Q23..College."  ,to="D23")                                                                                                                                                                                                    
data <- rename.vars(data, from="Q24..Major." ,to="D24")                                                                                                                                                                                                       
data <- rename.vars(data, from="Q25..Class.Level."    ,to="D25")                                                                                                                                                                                              
data <- rename.vars(data, from="Q26..Admission.Basis."  ,to="D26")                                                                                                                                                                                            
data <- rename.vars(data, from="Q27..Matric.Term."   ,to="D27")                                                                                                                                                                                               
data <- rename.vars(data, from="Q28..Cohort_Status."   ,to="D28")                                                                                                                                                                                             
data <- rename.vars(data, from="Q29..Pell.Eligibility." ,to="D29")                                                                                                                                                                                            
data <- rename.vars(data, from="Q30..Income."    ,to="D30")                                                                                                                                                                                                   
data <- rename.vars(data, from="Q31..First.Generation."  ,to="D31")                                                                                                                                                                                           
data <- rename.vars(data, from="Q32..Housing."  ,to="D32")                                                                                                                                                                                                    
data <- rename.vars(data, from="Q33..Housing.Location."    ,to="D33")                                                                                                                                                                                         
data <- rename.vars(data, from="Q34..Campus.Area.",to="D34")
#survey questions
data <- rename.vars(data, from="Q1..Which.best.reflects.your.anticipated.profession.occupation."                                                                                                                                                    ,to="Q1")
data <- rename.vars(data, from="Q2..Are.you.considering.changing.your.major."                                                                                                                                                                       ,to="Q2")
data <- rename.vars(data, from="Q3..What.is.the.highest.academic.degree.or.credential.that.you.plan.to.attain."                                                                                                                                     ,to="Q3")
data <- rename.vars(data, from="Q4..How.important.were.the.following.factors.in.your.initial.decision.to.attend.CSUMB....Academic.programs.majors"                                                                                                  ,to="Q4")
data <- rename.vars(data, from="Q5..How.important.were.the.following.factors.in.your.initial.decision.to.attend.CSUMB....Academic.reputation"                                                                                                       ,to="Q5")
data <- rename.vars(data, from="Q6..How.important.were.the.following.factors.in.your.initial.decision.to.attend.CSUMB....Athletic.opportunities"                                                                                                    ,to="Q6")
data <- rename.vars(data, from="Q7..How.important.were.the.following.factors.in.your.initial.decision.to.attend.CSUMB....Class.size"                                                                                                                ,to="Q7")
data <- rename.vars(data, from="Q8..How.important.were.the.following.factors.in.your.initial.decision.to.attend.CSUMB....CSUMB.s.overall.commitment.to.students"                                                                                    ,to="Q8")
data <- rename.vars(data, from="Q9..How.important.were.the.following.factors.in.your.initial.decision.to.attend.CSUMB....Diversity.of.student.body"                                                                                                 ,to="Q9")
data <- rename.vars(data, from="Q10..How.important.were.the.following.factors.in.your.initial.decision.to.attend.CSUMB....Financial.aid.offered.by.CSUMB"                                                                                           ,to="Q10")
data <- rename.vars(data, from="Q11..How.important.were.the.following.factors.in.your.initial.decision.to.attend.CSUMB....Friendliness.of.people.on.campus"                                                                                         ,to="Q11")
data <- rename.vars(data, from="Q12..How.important.were.the.following.factors.in.your.initial.decision.to.attend.CSUMB....Residence.hall"                                                                                                           ,to="Q12")
data <- rename.vars(data, from="Q13..How.important.were.the.following.factors.in.your.initial.decision.to.attend.CSUMB....Sense.of.community.or.belonging.on.campus"                                                                                ,to="Q13")
data <- rename.vars(data, from="Q14..How.important.were.the.following.factors.in.your.initial.decision.to.attend.CSUMB....Campus.commitment.to.Sustainability"                                                                                      ,to="Q14")
data <- rename.vars(data, from="Q15..How.satisfied.have.you.been.with.the.following.since.enrolling.at.CSUMB....Academic.programs.majors"                                                                                                           ,to="Q15")
data <- rename.vars(data, from="Q16..How.satisfied.have.you.been.with.the.following.since.enrolling.at.CSUMB....Academic.reputation"                                                                                                                ,to="Q16")
data <- rename.vars(data, from="Q17..How.satisfied.have.you.been.with.the.following.since.enrolling.at.CSUMB....Athletic.opportunities"                                                                                                             ,to="Q17")
data <- rename.vars(data, from="Q18..How.satisfied.have.you.been.with.the.following.since.enrolling.at.CSUMB....Class.size"                                                                                                                         ,to="Q18")
data <- rename.vars(data, from="Q19..How.satisfied.have.you.been.with.the.following.since.enrolling.at.CSUMB....CSUMB.s.overall.commitment.to.students"                                                                                             ,to="Q19")
data <- rename.vars(data, from="Q20..How.satisfied.have.you.been.with.the.following.since.enrolling.at.CSUMB....Diversity.of.student.body"                                                                                                          ,to="Q20")
data <- rename.vars(data, from="Q21..How.satisfied.have.you.been.with.the.following.since.enrolling.at.CSUMB....Financial.aid.offered.by.CSUMB"                                                                                                     ,to="Q21")
data <- rename.vars(data, from="Q22..How.satisfied.have.you.been.with.the.following.since.enrolling.at.CSUMB....Friendliness.of.people.on.campus"                                                                                                   ,to="Q22")
data <- rename.vars(data, from="Q23..How.satisfied.have.you.been.with.the.following.since.enrolling.at.CSUMB....Residence.hall"                                                                                                                     ,to="Q23")
data <- rename.vars(data, from="Q24..How.satisfied.have.you.been.with.the.following.since.enrolling.at.CSUMB....Sense.of.community.or.belonging.on.campus"                                                                                          ,to="Q24")
data <- rename.vars(data, from="Q25..How.satisfied.have.you.been.with.the.following.since.enrolling.at.CSUMB....Campus.commitment.to.Sustainability"                                                                                                ,to="Q25")
data <- rename.vars(data, from="Q26_1.Availability.of.water.bottle.filling.stations"                                                                                                                                                                ,to="Q26_1")
data <- rename.vars(data, from="Q26_2.Water.efficiency.measures..low.flow.showers..faucets..landscaping.etc.."                                                                                                                                      ,to="Q26_2")
data <- rename.vars(data, from="Q26_3.Energy.efficiency.measures..energy.efficient.lighting..equipment..plug.load.management..etc.."                                                                                                                ,to="Q26_3")
data <- rename.vars(data, from="Q26_4.Alternative.transportation.support..bike.parking.and.bike.lanes..bus.access..etc.."                                                                                                                           ,to="Q26_4")
data <- rename.vars(data, from="Q26_5.Recycling.and.composting.options..adequate.bins..signage..etc.."                                                                                                                                              ,to="Q26_5")
data <- rename.vars(data, from="Q26_6.Academic.integration.of.sustainability.topics"                                                                                                                                                                ,to="Q26_6")
data <- rename.vars(data, from="Q26_7.Access.to.natural.areas.for.recreation"                                                                                                                                                                       ,to="Q26_7")
data <- rename.vars(data, from="Q26_8.Access.to.natural.areas.for.education"                                                                                                                                                                        ,to="Q26_8")
data <- rename.vars(data, from="Q26_9.Social.support.systems"                                                                                                                                                                                       ,to="Q26_9")
data <- rename.vars(data, from="Q26_10.Availability.of.sustainable.food..local..organic..humane..fair.trade."                                                                                                                                       ,to="Q26_10")
data <- rename.vars(data, from="Q26_11.Other..please.specify."                                                                                                                                                                                      ,to="Q26_11")
data <- rename.vars(data, from="Q26_11OT"                                                                                                                                                                                                           ,to="Q26_11OT")
data <- rename.vars(data, from="Q27..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Academic.Advising.services"                                                                                                    ,to="Q27")
data <- rename.vars(data, from="Q28..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Availability.of.courses.in.your.major"                                                                                         ,to="Q28")
data <- rename.vars(data, from="Q29..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Availability.of.public.transportation"                                                                                         ,to="Q29")
data <- rename.vars(data, from="Q30..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Variety.of.student.clubs.organizations"                                                                                        ,to="Q30")
data <- rename.vars(data, from="Q31..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Availability.of.channels.for.expressing.student.complaints"                                                                    ,to="Q31")
data <- rename.vars(data, from="Q32..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Campus.health.services"                                                                                                        ,to="Q32")
data <- rename.vars(data, from="Q33..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....My.safety.and.security.on.campus"                                                                                              ,to="Q33")
data <- rename.vars(data, from="Q34..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Campus.social.life.in.general"                                                                                                 ,to="Q34")
data <- rename.vars(data, from="Q35..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Clarity.of.requirements.in.the.major..including.number.of.credit.hours."                                                       ,to="Q35")
data <- rename.vars(data, from="Q36..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Classroom.facilities"                                                                                                          ,to="Q36")
data <- rename.vars(data, from="Q37..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Internship.opportunities"                                                                                                      ,to="Q37")
data <- rename.vars(data, from="Q38..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Intramural.or.recreational.facilities..Gym..Pool..Fields..etc.."                                                               ,to="Q38")
data <- rename.vars(data, from="Q39..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Career.services"                                                                                                               ,to="Q39")
data <- rename.vars(data, from="Q40..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Personal.Growth...Counseling.Center..PGCC."                                                                                    ,to="Q40")
data <- rename.vars(data, from="Q41..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Laboratory.facilities..science.labs..computer.labs..music.labs..language.labs..etc.."                                          ,to="Q41")
data <- rename.vars(data, from="Q42..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Leadership.opportunities..e.g...in.clubs..Associated.Students..and.other.organizations."                                       ,to="Q42")
data <- rename.vars(data, from="Q43..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Library.hours"                                                                                                                 ,to="Q43")
data <- rename.vars(data, from="Q44..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Library.resources..e.g...availability.of.books..journals..reference.materials."                                                ,to="Q44")
data <- rename.vars(data, from="Q45..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Library.services..e.g...borrowing.returning.materials..support.assistance.from.staff."                                         ,to="Q45")
data <- rename.vars(data, from="Q46..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Quality.of.teaching.in.Lower.Division.Courses..e.g...General.Education."                                                       ,to="Q46")
data <- rename.vars(data, from="Q47..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Quality.of.teaching.in.Upper.Division.Courses..e.g...Majors..Minors..and.Concentrations."                                      ,to="Q47")
data <- rename.vars(data, from="Q48..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Quality.of.teaching.in.courses.in.your.major"                                                                                  ,to="Q48")
data <- rename.vars(data, from="Q49..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Quality.or.condition.of.student.housing"                                                                                       ,to="Q49")
data <- rename.vars(data, from="Q50..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Quiet.places.for.studying"                                                                                                     ,to="Q50")
data <- rename.vars(data, from="Q51..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Course.registration.process"                                                                                                   ,to="Q51")
data <- rename.vars(data, from="Q52..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Support.or.helpfulness.from.staff.in.the.Campus.Service.Center..located.in.Building.47."                                       ,to="Q52")
data <- rename.vars(data, from="Q53..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Support.or.helpfulness.from.staff.in.the.Financial.Aid.Office"                                                                 ,to="Q53")
data <- rename.vars(data, from="Q54..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Support.or.helpfulness.from.staff.in.the.Registrar.s.Office"                                                                   ,to="Q54")
data <- rename.vars(data, from="Q55..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Support.or.helpfulness.from.Technology.staff..e.g...assistance..services."                                                     ,to="Q55")
data <- rename.vars(data, from="Q56..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Support.or.helpfulness.from.other.staff.members"                                                                               ,to="Q56")
data <- rename.vars(data, from="Q57..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Support.or.helpfulness.from.fellow.students"                                                                                   ,to="Q57")
data <- rename.vars(data, from="Q58..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Student.Disability.Resources"                                                                                                  ,to="Q58")
data <- rename.vars(data, from="Q59..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Tolerance.of.different.viewpoints..e.g...political..cultural..religious."                                                      ,to="Q59")
data <- rename.vars(data, from="Q60..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Tutoring.services.at.the.Collaborative.Learning.Center..Formerly.ASAP."                                                        ,to="Q60")
data <- rename.vars(data, from="Q61..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Center.for.Student.Success..CSS..services..located.in.the.Advising.Center."                                                    ,to="Q61")
data <- rename.vars(data, from="Q62..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Variety.of.intramural.activities.offered..e.g...flag.football..bowling..volleyball..basketball."                               ,to="Q62")
data <- rename.vars(data, from="Q63..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Variety.of.multicultural.activities"                                                                                           ,to="Q63")
data <- rename.vars(data, from="Q64..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Variety.of.recreational.activities.offered..e.g...biking..camping..hiking."                                                    ,to="Q64")
data <- rename.vars(data, from="Q65..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Variety.of.campus.events..e.g...concerts..dances..speakers."                                                                   ,to="Q65")
data <- rename.vars(data, from="Q66..Please.indicate.your.level.of.satisfaction.with.the.following.areas.at.CSUMB....Overall.CSUMB.experience"                                                                                                      ,to="Q66")
data <- rename.vars(data, from="Q67..Please.indicate.your.agreement.with.the.following.statements.In.my.courses.at.CSUMB.........Exams.or.assessments.have.accurately.measured.what.I.have.learned"                                                 ,to="Q67")
data <- rename.vars(data, from="Q68..Please.indicate.your.agreement.with.the.following.statements.In.my.courses.at.CSUMB.........Grades.have.reflected.the.degree.to.which.I.have.achieved.the.course.learning.outcomes"                            ,to="Q68")
data <- rename.vars(data, from="Q69..Please.indicate.your.agreement.with.the.following.statements.In.my.courses.at.CSUMB.........Grades.have.provided.the.best.measure.of.what.I.have.learned"                                                      ,to="Q69")
data <- rename.vars(data, from="Q70..Please.indicate.your.agreement.with.the.following.statements.In.my.courses.at.CSUMB.........Faculty.have.done.a.good.job.of.assessing.what.I.have.learned"                                                     ,to="Q70")
data <- rename.vars(data, from="Q71..Please.indicate.your.agreement.with.the.following.statements.In.my.courses.at.CSUMB.........Faculty.have.used.assessments.to.provide.feedback.on.my.learning.progress"                                         ,to="Q71")
data <- rename.vars(data, from="Q72..Please.indicate.your.agreement.with.the.following.statements.In.my.courses.at.CSUMB.........Faculty.have.consistently.assessed.my.learning"                                                                    ,to="Q72")
data <- rename.vars(data, from="Q73..Please.indicate.your.agreement.with.the.following.statements.In.my.courses.at.CSUMB.........Written.exams.and.assessments.have.allowed.me.to.express.what.I.have.learned"                                      ,to="Q73")
data <- rename.vars(data, from="Q74..Please.indicate.your.agreement.with.the.following.statements.In.my.courses.at.CSUMB.........Multiple.choice.or.fill.in.the.blank.type.exams.and.assessments.have.allowed.me.to.demonstrate.what.I.have.learned",to="Q74")
data <- rename.vars(data, from="Q75..Please.indicate.your.agreement.with.the.following.statements.In.my.courses.at.CSUMB.........Written.assignments.or.projects.have.allowed.me.to.demonstrate.what.I.have.learned"                                ,to="Q75")
data <- rename.vars(data, from="Q76..Please.indicate.your.agreement.with.the.following.statements.In.my.courses.at.CSUMB.........I.have.had.ample.opportunity.to.demonstrate.what.I.have.learned"                                                   ,to="Q76")
data <- rename.vars(data, from="Q77..Please.indicate.your.agreement.with.the.following.statements.In.my.courses.at.CSUMB.........Faculty.have.explained.how.learning.experiences.relate.to.course..major..or.institutional.learning.outcomes"       ,to="Q77")
data <- rename.vars(data, from="Q78..How.often.have.professors.at.CSUMB.provided.you.with.the.following....Advice.about.your.academic.program"                                                                                                      ,to="Q78")
data <- rename.vars(data, from="Q79..How.often.have.professors.at.CSUMB.provided.you.with.the.following....An.opportunity.to.apply.classroom.work.to.life.outside.the.classroom"                                                                    ,to="Q79")
data <- rename.vars(data, from="Q80..How.often.have.professors.at.CSUMB.provided.you.with.the.following....An.opportunity.to.interact.with.faculty.outside.of.class"                                                                                ,to="Q80")
data <- rename.vars(data, from="Q81..How.often.have.professors.at.CSUMB.provided.you.with.the.following....Assistance.to.achieve.any.of.your.goals"                                                                                                 ,to="Q81")
data <- rename.vars(data, from="Q82..How.often.have.professors.at.CSUMB.provided.you.with.the.following....Assistance.to.improve.your.writing"                                                                                                      ,to="Q82")
data <- rename.vars(data, from="Q83..How.often.have.professors.at.CSUMB.provided.you.with.the.following....Challenging.coursework..assignments..tests..or.exams"                                                                                    ,to="Q83")
data <- rename.vars(data, from="Q84..How.often.have.professors.at.CSUMB.provided.you.with.the.following....An.opportunity.to.do.research.with.a.faculty.member..other.students..or.independently"                                                   ,to="Q84")
data <- rename.vars(data, from="Q85..How.often.have.professors.at.CSUMB.provided.you.with.the.following....Constructive.feedback.about.your.academic.work"                                                                                          ,to="Q85")
data <- rename.vars(data, from="Q86..How.often.have.professors.at.CSUMB.provided.you.with.the.following....Encouragement.to.pursue.graduate.or.professional.studies"                                                                                ,to="Q86")
data <- rename.vars(data, from="Q87..How.often.have.professors.at.CSUMB.provided.you.with.the.following....Opportunity.to.engage.in.critical.thinking"                                                                                              ,to="Q87")
data <- rename.vars(data, from="Q88..How.often.have.professors.at.CSUMB.provided.you.with.the.following....Respect.as.an.individual"                                                                                                                ,to="Q88")
data <- rename.vars(data, from="Q89..Which.best.describes.your.Academic.Advisor."                                                                                                                                                                   ,to="Q89")
data <- rename.vars(data, from="Q89_5OT"                                                                                                                                                                                                            ,to="Q89_5OT")
data <- rename.vars(data, from="Q89_7OT"                                                                                                                                                                                                            ,to="Q89_7OT")
data <- rename.vars(data, from="Q90..Please.indicate.your.level.of.agreement.with.the.following...My.Academic.Advisor.effectively.........Taught.me.how.to.use.my.academic.requirement.page.to.track.my.progress.toward.my.degree"                  ,to="Q90")
data <- rename.vars(data, from="Q91..Please.indicate.your.level.of.agreement.with.the.following...My.Academic.Advisor.effectively.........Assisted.me.in.coping.with.academic.problems.or.referred.me.to.the.appropriate.department.s."             ,to="Q91")
data <- rename.vars(data, from="Q92..Please.indicate.your.level.of.agreement.with.the.following...My.Academic.Advisor.effectively.........Taught.me.how.to.use.the.catalog.to.identify.required.courses.in.my.major"                                ,to="Q92")
data <- rename.vars(data, from="Q93..Please.indicate.your.level.of.agreement.with.the.following...My.Academic.Advisor.effectively.........Provided.me.with.accurate.information.regarding.academic.requirements"                                    ,to="Q93")
data <- rename.vars(data, from="Q94..Please.indicate.your.level.of.agreement.with.the.following...My.Academic.Advisor.effectively.........Prepared.a.two.or.four.year.academic.plan.for.me"                                                         ,to="Q94")
data <- rename.vars(data, from="Q95_1.Talking.to.my.professor"                                                                                                                                                                                      ,to="Q95_1")
data <- rename.vars(data, from="Q95_2.Graduate.school.prep"                                                                                                                                                                                         ,to="Q95_2")
data <- rename.vars(data, from="Q95_3.Study.Skills"                                                                                                                                                                                                 ,to="Q95_3")
data <- rename.vars(data, from="Q95_4.Time.Management"                                                                                                                                                                                              ,to="Q95_4")
data <- rename.vars(data, from="Q95_5.Goal.Setting"                                                                                                                                                                                                 ,to="Q95_5")
data <- rename.vars(data, from="Q95_6.Note.Taking"                                                                                                                                                                                                  ,to="Q95_6")
data <- rename.vars(data, from="Q95_7.Collaborating.with.others"                                                                                                                                                                                    ,to="Q95_7")
data <- rename.vars(data, from="Q95_8.Technology"                                                                                                                                                                                                   ,to="Q95_8")
data <- rename.vars(data, from="Q95_9.Writing.Assignments.Projects"                                                                                                                                                                                 ,to="Q95_9")
data <- rename.vars(data, from="Q95_10.Identifying.Resources"                                                                                                                                                                                       ,to="Q95_10")
data <- rename.vars(data, from="Q95_11.Math"                                                                                                                                                                                                        ,to="Q95_11")
data <- rename.vars(data, from="Q95_12.Science"                                                                                                                                                                                                     ,to="Q95_12")
data <- rename.vars(data, from="Q95_13.English.as.Second.Language.resources"                                                                                                                                                                        ,to="Q95_13")
data <- rename.vars(data, from="Q95_14.Grammar.Editing"                                                                                                                                                                                             ,to="Q95_14")
data <- rename.vars(data, from="Q95_15.Research.and.Academic.Writing"                                                                                                                                                                               ,to="Q95_15")
data <- rename.vars(data, from="Q95_16.Language.courses"                                                                                                                                                                                            ,to="Q95_16")
data <- rename.vars(data, from="Q95_17.Other..please.specify."                                                                                                                                                                                      ,to="Q95_17")
data <- rename.vars(data, from="Q95_18.Not.applicable"                                                                                                                                                                                              ,to="Q95_18")
data <- rename.vars(data, from="Q95_17OT"                                                                                                                                                                                                           ,to="Q95_17OT")
data <- rename.vars(data, from="Q96_1.Talking.to.my.professor"                                                                                                                                                                                      ,to="Q96_1")
data <- rename.vars(data, from="Q96_2.Graduate.school.prep"                                                                                                                                                                                         ,to="Q96_2")
data <- rename.vars(data, from="Q96_3.Study.Skills"                                                                                                                                                                                                 ,to="Q96_3")
data <- rename.vars(data, from="Q96_4.Time.Management"                                                                                                                                                                                              ,to="Q96_4")
data <- rename.vars(data, from="Q96_5.Goal.Setting"                                                                                                                                                                                                 ,to="Q96_5")
data <- rename.vars(data, from="Q96_6.Note.Taking"                                                                                                                                                                                                  ,to="Q96_6")
data <- rename.vars(data, from="Q96_7.Collaborating.with.others"                                                                                                                                                                                    ,to="Q96_7")
data <- rename.vars(data, from="Q96_8.Technology"                                                                                                                                                                                                   ,to="Q96_8")
data <- rename.vars(data, from="Q96_9.Writing.Assignments.Projects"                                                                                                                                                                                 ,to="Q96_9")
data <- rename.vars(data, from="Q96_10.Identifying.Resources"                                                                                                                                                                                       ,to="Q96_10")
data <- rename.vars(data, from="Q96_11.Math"                                                                                                                                                                                                        ,to="Q96_11")
data <- rename.vars(data, from="Q96_12.Science"                                                                                                                                                                                                     ,to="Q96_12")
data <- rename.vars(data, from="Q96_13.English.as.Second.Language.resources"                                                                                                                                                                        ,to="Q96_13")
data <- rename.vars(data, from="Q96_14.Grammar.Editing"                                                                                                                                                                                             ,to="Q96_14")
data <- rename.vars(data, from="Q96_15.Research.and.Academic.Writing"                                                                                                                                                                               ,to="Q96_15")
data <- rename.vars(data, from="Q96_16.Language.courses"                                                                                                                                                                                            ,to="Q96_16")
data <- rename.vars(data, from="Q96_17.Other..please.specify."                                                                                                                                                                                      ,to="Q96_17")
data <- rename.vars(data, from="Q96_18.Not.applicable"                                                                                                                                                                                              ,to="Q96_18")
data <- rename.vars(data, from="Q96_17OT"                                                                                                                                                                                                           ,to="Q96_17OT")
data <- rename.vars(data, from="Q97..Where.do.you.reside.presently."                                                                                                                                                                                ,to="Q97")
data <- rename.vars(data, from="Q98..How.supportive.is.your.family.to.your.full.time.commitment.to.undergraduate.studies."                                                                                                                          ,to="Q98")
data <- rename.vars(data, from="Q99..How.many.hours.per.week.do.you.spend.on.commitments.obligations.outside.your.college.education...e.g..employment.not.related.to.your.studies..family.responsibilities..etc.."                                  ,to="Q99")
data <- rename.vars(data, from="Q100..How.confident.are.you.that.you.will.complete.your.undergraduate.studies.at.CSUMB."                                                                                                                            ,to="Q100")
data <- rename.vars(data, from="Q101..Please.describe.why.you.believe.you.might.not.complete.your.studies.at.CSUMB."                                                                                                                                ,to="Q101")
data <- rename.vars(data, from="Q101_1OT"                                                                                                                                                                                                           ,to="Q101_1OT")
data <- rename.vars(data, from="Q102..If.you.plan.to.complete.your.higher.education.studies.elsewhere..where.would.you.choose.to.do.so."                                                                                                            ,to="Q102")
data <- rename.vars(data, from="Q103..If.you.could.make.your.college.choice.over.again..would.you.still.choose.to.attend.CSUMB."                                                                                                                    ,to="Q103")
data <- rename.vars(data, from="Q104..Would.you.recommend.CSUMB.to.prospective.students."                                                                                                                                                           ,to="Q104")
data <- rename.vars(data, from="Q105..What.aspects.of.CSUMB.have.enhanced.your.undergraduate.experience."                                                                                                                                           ,to="Q105")
data <- rename.vars(data, from="Q105_1OT"                                                                                                                                                                                                           ,to="Q105_1OT")
data <- rename.vars(data, from="Q106..What.aspects.of.CSUMB.would.you.like.to.see.changed.or.improved."                                                                                                                                             ,to="Q106")
data <- rename.vars(data, from="Q106_1OT"                                                                                                                                                                                                           ,to="Q106_1OT")
data <- rename.vars(data, from="Q107..What.suggestions.do.you.have.for.CSUMB.to.better.help.future.students.meet.their.undergraduate.education.goals."                                                                                              ,to="Q107")
data <- rename.vars(data, from="Q107_1OT"  ,to="Q107_1OT")
names(data)
csumbes16 <- data
rm(data)

if(!require(Hmisc)) {
  install.packages("Hmisc")
}
require(Hmisc)

#apply label attribute
#demographics
label(csumbes16$D1_1) <- "Name Flag"
label(csumbes16$D1_2) <- "Last Name Flag"
label(csumbes16$D1_3) <- "First Name Flag"
label(csumbes16$D1_4) <- "Middle Name Flag"
label(csumbes16$D1_5) <- "Email Address Flag"
label(csumbes16$D1_6) <- "OtterID Flag"
label(csumbes16$D1_7) <- "Emplid Flag"
label(csumbes16$DFullName) <- "Full Name"
label(csumbes16$DLastName) <- "Last Name"
label(csumbes16$DFirstName) <- "First Name"
label(csumbes16$DMiddleName) <- "Middle Name"
label(csumbes16$DEmail) <- "Email Address"
label(csumbes16$DOtterID) <- "Otter ID"
label(csumbes16$DEmplid) <- "Student ID"
label(csumbes16$D2) <- "Gender"
label(csumbes16$D3) <- "Race / Ethnicity"
label(csumbes16$D4) <- "Cuml GPA Flag"
label(csumbes16$DCumlGPA) <- "Cumulative GPA,  start of 2016 Spring"
csumbes16$DCumlGPA_Num <- as.numeric(as.character(csumbes16$DCumlGPA))
label(csumbes16$D5) <- "Time Status"
label(csumbes16$D6) <- "URM"
label(csumbes16$D7) <- "Age Flag"
label(csumbes16$DAge) <- "Age"
label(csumbes16$D8) <- "Residence Flag"
label(csumbes16$DResidence) <- "Residence Location"
label(csumbes16$D8) <- "Residence Flag"
label(csumbes16$D9) <- "Region"
label(csumbes16$D10) <- "Residence Status Code"
label(csumbes16$D11) <- "Residency"
label(csumbes16$D12) <- "IOC Flag"
label(csumbes16$DIOC) <- "Institution of Origin"
label(csumbes16$D13) <- "EOP"
label(csumbes16$D14) <- "SDR"
label(csumbes16$D15) <- "Athletics"
label(csumbes16$D16) <- "SB 1440"
label(csumbes16$D17) <- "CAMP"
label(csumbes16$D18) <- "Former Foster Youth"
label(csumbes16$D19) <- "STEM (HS SSS Program"
label(csumbes16$D20) <- "Student Support Services"
label(csumbes16$D21) <- "Super Seniors"
label(csumbes16$D22) <- "UROC"
label(csumbes16$D23) <- "College"
label(csumbes16$D24) <- "Major"
label(csumbes16$D25) <- "Class Level"
label(csumbes16$D26) <- "Admission Basis"
label(csumbes16$D27) <- "Matriculation Term"
label(csumbes16$D28) <- "Cohort Status"
label(csumbes16$D29) <- "Pell Eligibility"
label(csumbes16$D30) <- "Income"
label(csumbes16$D31) <- "First Generation"
label(csumbes16$D32) <- "Housing Indicator"
label(csumbes16$D33) <- "Housing Location"
label(csumbes16$D34) <- "Campus Area"                                                                                                                                                               

#survey questions
label(csumbes16$"Q1") <- "Which best reflects your anticipated profession or occupation"
label(csumbes16$"Q2") <- "Are you considering changing your major"
label(csumbes16$"Q3") <- "What is the highest academic degree or credential that you plan to attain"
#Importance (Gap)
label(csumbes16$"Q4") <- "Importance: Academic programs majors"
label(csumbes16$"Q5") <- "Importance: Academic reputation"
label(csumbes16$"Q6") <- "Importance: Athletic opportunities"
label(csumbes16$"Q7") <- "Importance: Class size"
label(csumbes16$"Q8") <- "Importance: CSUMB overall commitment to students"
label(csumbes16$"Q9") <- "Importance: Diversity of student body"
label(csumbes16$"Q10") <- "Importance: Financial aid offered by CSUMB"
label(csumbes16$"Q11") <- "Importance: Friendliness of people on campus"
label(csumbes16$"Q12") <- "Importance: Residence hall"
label(csumbes16$"Q13") <- "Importance: Sense of community or belonging on campus"
label(csumbes16$"Q14") <- "Importance: Campus commitment to Sustainability"
#Satisfaction (Gap)
label(csumbes16$"Q15") <- "Satisfaction: Academic programs majors"
label(csumbes16$"Q16") <- "Satisfaction: Academic reputation"
label(csumbes16$"Q17") <- "Satisfaction: Athletic opportunities"
label(csumbes16$"Q18") <- "Satisfaction: Class size"
label(csumbes16$"Q19") <- "Satisfaction: CSUMB overall commitment to students"
label(csumbes16$"Q20") <- "Satisfaction: Diversity of student body"
label(csumbes16$"Q21") <- "Satisfaction: Financial aid offered by CSUMB"
label(csumbes16$"Q22") <- "Satisfaction: Friendliness of people on campus"
label(csumbes16$"Q23") <- "Satisfaction: Residence hall"
label(csumbes16$"Q24") <- "Satisfaction: Sense of community or belonging on campus"
label(csumbes16$"Q25") <- "Satisfaction: Campus commitment to Sustainability"
#Sustainability
label(csumbes16$"Q26_1") <- "Availability of water bottle filling stations"                    
label(csumbes16$"Q26_2") <- "Water efficiency measures"
label(csumbes16$"Q26_3") <- "Energy efficiency measures"
label(csumbes16$"Q26_4") <- "Alternative transportation support"
label(csumbes16$"Q26_5") <- "Recycling and composting options"
label(csumbes16$"Q26_6") <- "Academic integration of sustainability topics"
label(csumbes16$"Q26_7") <- "Access to natural areas for recreation"
label(csumbes16$"Q26_8") <- "Access to natural areas for education"
label(csumbes16$"Q26_9") <- "Social support systems"
label(csumbes16$"Q26_10") <- "Availability of sustainable food"
label(csumbes16$"Q26_11") <- "Other Flag"
label(csumbes16$"Q26_11OT") <- "Sustainability-related systems you are least satisfied with: Other"
#Satisfaction (Main)
label(csumbes16$"Q27") <- "Academic Advising services"
label(csumbes16$"Q28") <- "Availability of courses in your major"
label(csumbes16$"Q29") <- "Availability of public transportation"
label(csumbes16$"Q30") <- "Variety of student clubs organizations"
label(csumbes16$"Q31") <- "Availability of channels for expressing student complaints"
label(csumbes16$"Q32") <- "Campus health services"
label(csumbes16$"Q33") <- "My safety and security on campus"
label(csumbes16$"Q34") <- "Campus social life in general"
label(csumbes16$"Q35") <- "Clarity of requirements in the major  including number of credit hours "
label(csumbes16$"Q36") <- "Classroom facilities"
label(csumbes16$"Q37") <- "Internship opportunities"
label(csumbes16$"Q38") <- "Intramural or recreational facilities  Gym  Pool  Fields  etc  "
label(csumbes16$"Q39") <- "Career services"
label(csumbes16$"Q40") <- "Personal Growth   Counseling Center  PGCC " 
label(csumbes16$"Q41") <- "Laboratory facilities"
label(csumbes16$"Q42") <- "Leadership opportunities"
label(csumbes16$"Q43") <- "Library hours"
label(csumbes16$"Q44") <- "Library resources"
label(csumbes16$"Q45") <- "Library services"
label(csumbes16$"Q46") <- "Quality of teaching in Lower Division Courses"
label(csumbes16$"Q47") <- "Quality of teaching in Upper Division Courses"
label(csumbes16$"Q48") <- "Quality of teaching in courses in your major"
label(csumbes16$"Q49") <- "Quality or condition of student housing"
label(csumbes16$"Q50") <- "Quiet places for studying"
label(csumbes16$"Q51") <- "Course registration process"
label(csumbes16$"Q52") <- "Support or helpfulness from staff in the Campus Service Center  located in Building 47"
label(csumbes16$"Q53") <- "Support or helpfulness from staff in the Financial Aid Office"
label(csumbes16$"Q54") <- "Support or helpfulness from staff in the Registrar s Office"
label(csumbes16$"Q55") <- "Support or helpfulness from Technology staff"
label(csumbes16$"Q56") <- "Support or helpfulness from other staff members"
label(csumbes16$"Q57") <- "Support or helpfulness from fellow students"
label(csumbes16$"Q58") <- "Student Disability Resources"
label(csumbes16$"Q59") <- "Tolerance of different viewpoints"
label(csumbes16$"Q60") <- "Tutoring services at the Collaborative Learning Center  Formerly ASAP"
label(csumbes16$"Q61") <- "Center for Student Success  CSS  services  located in the Advising Center"
label(csumbes16$"Q62") <- "Variety of intramural activities offered"
label(csumbes16$"Q63") <- "Variety of multicultural activities"
label(csumbes16$"Q64") <- "Variety of recreational activities offered"
label(csumbes16$"Q65") <- "Variety of campus events"
label(csumbes16$"Q66") <- "Overall CSUMB experience"
#Faculty section
label(csumbes16$Q67) <- "Exams or assessments have accurately measured what I have learned"
label(csumbes16$Q68) <- "Grades have reflected the degree to which I have achieved the course learning outcomes"
label(csumbes16$Q69) <- "Grades have provided the best measure of what I have learned"
label(csumbes16$Q70) <- "Faculty have done a good job of assessing what I have learned"
label(csumbes16$Q71) <- "Faculty have used assessments to provide feedback on my learning progress"
label(csumbes16$Q72) <- "Faculty have consistently assessed my learning"
label(csumbes16$Q73) <- "Written exams and assessments have allowed me to express what I have learned"
label(csumbes16$Q74) <- "Multiple choice or fill in the blank type exams and assessments have allowed me to demonstrate what I have learned"
label(csumbes16$Q75) <- "Written assignments or projects have allowed me to demonstrate what I have learned"
label(csumbes16$Q76) <- "I have had ample opportunity to demonstrate what I have learned"
label(csumbes16$Q77) <- "Faculty have explained how learning experiences relate to course  major  or institutional learning outcomes"
label(csumbes16$Q78) <- "Advice about your academic program"
label(csumbes16$Q79) <- "An opportunity to apply classroom work to life outside the classroom"
label(csumbes16$Q80) <- "An opportunity to interact with faculty outside of class"
label(csumbes16$Q81) <- "Assistance to achieve any of your goals"
label(csumbes16$Q82) <- "Assistance to improve your writing"
label(csumbes16$Q83) <- "Challenging coursework  assignments  tests  or exams"
label(csumbes16$Q84) <- "An opportunity to do research with a faculty member  other students  or independently"
label(csumbes16$Q85) <- "Constructive feedback about your academic work"
label(csumbes16$Q86) <- "Encouragement to pursue graduate or professional studies"
label(csumbes16$Q87) <- "Opportunity to engage in critical thinking"
label(csumbes16$Q88) <- "Respect as an individual"
#Advising section
label(csumbes16$"Q89") <- "Which best describes your Academic Advisor"
label(csumbes16$"Q89_5OT") <- "Advisor: Other Department"
label(csumbes16$"Q89_7OT") <- "Advisor: Other"
label(csumbes16$"Q90") <- "Taught me how to use my academic requirement page to track my progress toward my degree"
label(csumbes16$"Q91") <- "Assisted me in coping with academic problems or referred me to the appropriate departments"
label(csumbes16$"Q92") <- "Taught me how to use the catalog to identify required courses in my major"
label(csumbes16$"Q93") <- "Provided me with accurate information regarding academic requirements"
label(csumbes16$"Q94") <- "Prepared a two or four year academic plan for me"
#Tutoring section
label(csumbes16$"Q95_1") <- "Talking to my professor"
label(csumbes16$"Q95_2") <- "Graduate school prep"
label(csumbes16$"Q95_3") <- "Study Skills"
label(csumbes16$"Q95_4") <- "Time Management"
label(csumbes16$"Q95_5") <- "Goal Setting"
label(csumbes16$"Q95_6") <- "Note Taking" 
label(csumbes16$"Q95_7") <- "Collaborating with others"
label(csumbes16$"Q95_8") <- "Technology"
label(csumbes16$"Q95_9") <- "Writing Assignments Projects"
label(csumbes16$"Q95_10") <- "Identifying Resources" 
label(csumbes16$"Q95_11") <- "Math"
label(csumbes16$"Q95_12") <- "Science"
label(csumbes16$"Q95_13") <- "English as Second Language resources" 
label(csumbes16$"Q95_14") <- "Grammar Editing"  
label(csumbes16$"Q95_15") <- "Research and Academic Writing" 
label(csumbes16$"Q95_16") <- "Language courses"
label(csumbes16$"Q95_17") <- "Other  please specify Flag" 
label(csumbes16$"Q95_18") <- "Not applicable"
label(csumbes16$"Q95_17OT") <- "Need the Most Help: Other"
label(csumbes16$"Q96_1") <- "Talking to my professor"
label(csumbes16$"Q96_2") <- "Graduate school prep"
label(csumbes16$"Q96_3") <- "Study Skills"
label(csumbes16$"Q96_4") <- "Time Management"
label(csumbes16$"Q96_5") <- "Goal Setting"
label(csumbes16$"Q96_6") <- "Note Taking" 
label(csumbes16$"Q96_7") <- "Collaborating with others"
label(csumbes16$"Q96_8") <- "Technology"
label(csumbes16$"Q96_9") <- "Writing Assignments Projects"
label(csumbes16$"Q96_10") <- "Identifying Resources" 
label(csumbes16$"Q96_11") <- "Math"
label(csumbes16$"Q96_12") <- "Science"
label(csumbes16$"Q96_13") <- "English as Second Language resources" 
label(csumbes16$"Q96_14") <- "Grammar Editing"  
label(csumbes16$"Q96_15") <- "Research and Academic Writing" 
label(csumbes16$"Q96_16") <- "Language courses"
label(csumbes16$"Q96_17") <- "Other  please specify Flag" 
label(csumbes16$"Q96_18") <- "Not applicable"
label(csumbes16$"Q96_17OT") <- "Previously had Tutoring: Other"
#retention questions
label(csumbes16$"Q97") <- "Where do you reside presently"
label(csumbes16$"Q98") <- "How supportive is your family to your full time commitment to undergraduate studies"
label(csumbes16$"Q99") <- "How many hours per week do you spend on commitments obligations outside your college education"
label(csumbes16$"Q100") <- "How confident are you that you will complete your undergraduate studies at CSUMB"
label(csumbes16$"Q101") <- "Not Complete OT Flag"
label(csumbes16$"Q101_1OT") <- "Please describe why you believe you might not complete your studies at CSUMB"
label(csumbes16$"Q102") <- "If you plan to complete your higher education studies elsewhere  where would you choose to do so "
label(csumbes16$"Q103") <- "If you could make your college choice over again  would you still choose to attend CSUMB"
label(csumbes16$"Q104") <- "Would you recommend CSUMB to prospective students"
#qualitative
label(csumbes16$"Q105") <- "Enhanced OT Flag"
label(csumbes16$"Q105_1OT") <- "What aspects of CSUMB have enhanced your undergraduate experience"
label(csumbes16$"Q106") <- "Changes OT Flag"
label(csumbes16$"Q106_1OT") <- "What aspects of CSUMB would you like to see changed or improved"
label(csumbes16$"Q107") <- "Suggestions OT Flag"
label(csumbes16$"Q107_1OT") <- "What suggestions do you have for CSUMB to better help future students meet their undergraduate education goals"
#Missing values declaration

#create GAP variables
csumbes16$GAP1 <- csumbes16$Q15 - csumbes16$Q4
csumbes16$GAP2 <- csumbes16$Q16 - csumbes16$Q5
csumbes16$GAP3 <- csumbes16$Q17 - csumbes16$Q6
csumbes16$GAP4 <- csumbes16$Q18 - csumbes16$Q7
csumbes16$GAP5 <- csumbes16$Q19 - csumbes16$Q8
csumbes16$GAP6 <- csumbes16$Q20 - csumbes16$Q9
csumbes16$GAP7 <- csumbes16$Q21 - csumbes16$Q10
csumbes16$GAP8 <- csumbes16$Q22 - csumbes16$Q11
csumbes16$GAP9 <- csumbes16$Q23 - csumbes16$Q12
csumbes16$GAP10 <- csumbes16$Q24 - csumbes16$Q13
csumbes16$GAP11 <- csumbes16$Q25 - csumbes16$Q14
label(csumbes16$GAP1) <- "Gap: Academic programs majors"
label(csumbes16$GAP2) <- "Gap: Academic reputation"
label(csumbes16$GAP3) <- "Gap: Athletic opportunities"
label(csumbes16$GAP4) <- "Gap: Class size"
label(csumbes16$GAP5) <- "Gap: CSUMB overall commitment to students"
label(csumbes16$GAP6) <- "Gap: Diversity of student body"
label(csumbes16$GAP7) <- "Gap: Financial aid offered by CSUMB"
label(csumbes16$GAP8) <- "Gap: Friendliness of people on campus"
label(csumbes16$GAP9) <- "Gap: Residence hall"
label(csumbes16$GAP10) <- "Gap: Sense of community or belonging on campus"
label(csumbes16$GAP11) <- "Gap: Campus commitment to Sustainability"

#variable labels
#factor(csumbes16$D0,levels = c(),labels = c())
factor(csumbes16$D2,levels = c(1,2),labels = c("Female","Male"))
csumbes16$D2_Label[csumbes16$D2 == 1 ] <- "Female"
csumbes16$D2_Label[csumbes16$D2 == 2 ] <- "Male"
factor(csumbes16$D3,levels = c(1,2,3,4,5,6,7,8),labels = c("African American","Asian American","Latino","Native American","Other/Decline to State","Pacific Islander","Two or More","White"))
csumbes16$D3_Label[csumbes16$D3 == 1 ] <- "African American"
csumbes16$D3_Label[csumbes16$D3 == 2 ] <- "Asian American"
csumbes16$D3_Label[csumbes16$D3 == 3 ] <- "Latino"
csumbes16$D3_Label[csumbes16$D3 == 4 ] <- "Native American"
csumbes16$D3_Label[csumbes16$D3 == 5 ] <- "Other/Decline to State"
csumbes16$D3_Label[csumbes16$D3 == 6 ] <- "Pacific Islander"
csumbes16$D3_Label[csumbes16$D3 == 7 ] <- "Two or More"
csumbes16$D3_Label[csumbes16$D3 == 8 ] <- "White"
factor(csumbes16$D5,levels = c(1,2),labels = c("Full Time","Part Time"))
csumbes16$D5_Label[csumbes16$D5 == 1 ] <- "Full Time"
csumbes16$D5_Label[csumbes16$D5 == 2 ] <- "Part Time"
factor(csumbes16$D6,levels = c(1,2),labels = c("URM","Not URM"))
csumbes16$D6_Label[csumbes16$D6 == 1 ] <- "URM"
csumbes16$D6_Label[csumbes16$D6 == 2 ] <- "Not URM"
factor(csumbes16$D9,levels = c(1,2,3,4,5,6),labels = c("Other Countries","Southern California","Tri-County","Northern California","Central California","Out of State"))
csumbes16$D9_Label[csumbes16$D9 == 1 ] <- "Other Countries"
csumbes16$D9_Label[csumbes16$D9 == 2 ] <- "Southern California"
csumbes16$D9_Label[csumbes16$D9 == 3 ] <- "Tri-County"
csumbes16$D9_Label[csumbes16$D9 == 4 ] <- "Northern California"
csumbes16$D9_Label[csumbes16$D9 == 5 ] <- "Central California"
csumbes16$D9_Label[csumbes16$D9 == 6 ] <- "Out of State"
factor(csumbes16$D10,levels = c(1,2,3,4,5,6,7),labels = c("F","R","W","D","N","M","O"))
factor(csumbes16$D11,levels = c(1,2),labels = c("Non Resident","Resident"))
csumbes16$D11_Label[csumbes16$D11 == 2 ] <- "Resident"
csumbes16$D11_Label[csumbes16$D11 == 1 ] <- "Not Resident"
factor(csumbes16$D13,levels = c(1,2),labels = c("EOP","Not EOP"))
csumbes16$D13_Label[csumbes16$D13 == 1 ] <- "EOP"
csumbes16$D13_Label[csumbes16$D13 == 2 ] <- "Not EOP"
factor(csumbes16$D14,levels = c(1,2),labels = c("SDR","Not SDR"))
csumbes16$D14_Label[csumbes16$D14 == 1 ] <- "SDR"
csumbes16$D14_Label[csumbes16$D14 == 2 ] <- "Not SDR"
factor(csumbes16$D15,levels = c(1,2),labels = c("Athletics","Not Athletics"))
csumbes16$D15_Label[csumbes16$D15 == 1 ] <- "Athletics"
csumbes16$D15_Label[csumbes16$D15 == 2 ] <- "Not Athletics"
factor(csumbes16$D16,levels = c(1,2),labels = c("SB 1440","Not SB 1440"))
csumbes16$D16_Label[csumbes16$D16 == 1 ] <- "SB 1440"
csumbes16$D16_Label[csumbes16$D16 == 2 ] <- "Not SB 1440"
factor(csumbes16$D17,levels = c(1,2),labels = c("CAMP","Not CAMP"))
csumbes16$D17_Label[csumbes16$D17 == 1 ] <- "CAMP"
csumbes16$D17_Label[csumbes16$D17 == 2 ] <- "Not CAMP"
factor(csumbes16$D18,levels = c(1,2),labels = c("Former \nFoster Youth","Not Former \nFoster Youth"))
csumbes16$D18_Label[csumbes16$D18 == 1 ] <- "Former \nFoster Youth"
csumbes16$D18_Label[csumbes16$D18 == 2 ] <- "Not Former \nFoster Youth"
factor(csumbes16$D19,levels = c(1,2),labels = c("STEM (HS) SSS","Not STEM (HS) SSS"))
factor(csumbes16$D20,levels = c(1,2),labels = c("SSS","Not SSS"))
csumbes16$D20_Label[csumbes16$D20 == 1 ] <- "SSS"
csumbes16$D20_Label[csumbes16$D20 == 2 ] <- "Not SSS"
factor(csumbes16$D21,levels = c(1,2),labels = c("Super Senior","Not Super Senior"))
csumbes16$D21_Label[csumbes16$D21 == 1 ] <- "Super Senior"
csumbes16$D21_Label[csumbes16$D21 == 2 ] <- "Not Super Senior"
factor(csumbes16$D22,levels = c(1,2),labels = c("UROC","Not UROC"))
csumbes16$D22_Label[csumbes16$D22 == 1 ] <- "UROC"
csumbes16$D22_Label[csumbes16$D22 == 2 ] <- "Not UROC"
factor(csumbes16$D23,levels = c(1,2,3,4,5,6),labels = c("CAHSS","HSHS","COS","EDUC","UGS","COB"))
csumbes16$D23_Label[csumbes16$D23 == 1 ] <- "CAHSS"
csumbes16$D23_Label[csumbes16$D23 == 2 ] <- "HSHS"
csumbes16$D23_Label[csumbes16$D23 == 3 ] <- "COS"
csumbes16$D23_Label[csumbes16$D23 == 4 ] <- "EDUC"
csumbes16$D23_Label[csumbes16$D23 == 5 ] <- "UGS"
csumbes16$D23_Label[csumbes16$D23 == 6 ] <- "COB"
factor(csumbes16$D24,levels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26),labels = c("BIO","BUS","CD","CHHS","CINE","CSCI","CSIT","ENSTU","ESTP","GS","HCOM","ISSM","JLC","KIN","LS","MATH","MS (BS)","MUS","NURS","PSY","SBS","SHM","SPAN","UNDC","VPA","WLC"))
csumbes16$D24_Label[csumbes16$D24 == 1 ] <- "BIO"
csumbes16$D24_Label[csumbes16$D24 == 2 ] <- "BUS"
csumbes16$D24_Label[csumbes16$D24 == 3 ] <- "CD"
csumbes16$D24_Label[csumbes16$D24 == 4 ] <- "CHHS"
csumbes16$D24_Label[csumbes16$D24 == 5 ] <- "CINE"
csumbes16$D24_Label[csumbes16$D24 == 6 ] <- "CSCI"
csumbes16$D24_Label[csumbes16$D24 == 7 ] <- "CSIT"
csumbes16$D24_Label[csumbes16$D24 == 8 ] <- "ENSTU"
csumbes16$D24_Label[csumbes16$D24 == 9 ] <- "ESTP"
csumbes16$D24_Label[csumbes16$D24 == 10 ] <- "GS"
csumbes16$D24_Label[csumbes16$D24 == 11 ] <- "HCOM"
csumbes16$D24_Label[csumbes16$D24 == 12 ] <- "ISSM"
csumbes16$D24_Label[csumbes16$D24 == 13 ] <- "JLC"
csumbes16$D24_Label[csumbes16$D24 == 14 ] <- "KIN"
csumbes16$D24_Label[csumbes16$D24 == 15 ] <- "LS"
csumbes16$D24_Label[csumbes16$D24 == 16 ] <- "MATH"
csumbes16$D24_Label[csumbes16$D24 == 17 ] <- "MS (BS)"
csumbes16$D24_Label[csumbes16$D24 == 18 ] <- "MUS"
csumbes16$D24_Label[csumbes16$D24 == 19 ] <- "NURS"
csumbes16$D24_Label[csumbes16$D24 == 20 ] <- "PSY"
csumbes16$D24_Label[csumbes16$D24 == 21 ] <- "SBS"
csumbes16$D24_Label[csumbes16$D24 == 22 ] <- "SHM"
csumbes16$D24_Label[csumbes16$D24 == 23 ] <- "SPAN"
csumbes16$D24_Label[csumbes16$D24 == 24 ] <- "UNDC"
csumbes16$D24_Label[csumbes16$D24 == 25 ] <- "VPA"
csumbes16$D24_Label[csumbes16$D24 == 26 ] <- "WLC"
factor(csumbes16$D25,levels = c(1,2,3,4),labels = c("Sophomore","Senior","Junior","Freshman"))
csumbes16$D25_Label[csumbes16$D25 == 1 ] <- "Sophomore"
csumbes16$D25_Label[csumbes16$D25 == 2 ] <- "Senior"
csumbes16$D25_Label[csumbes16$D25 == 3 ] <- "Junior"
csumbes16$D25_Label[csumbes16$D25 == 4 ] <- "Freshman"
factor(csumbes16$D26,levels = c(1,2,3,4),labels = c("Lower Division Transfer","First-Time Freshmen","Upper Division Transfer","Transitory"))
csumbes16$D26_Label[csumbes16$D26 == 1 ] <- "Lower Division Transfer"
csumbes16$D26_Label[csumbes16$D26 == 2 ] <- "First-Time Freshmen"
csumbes16$D26_Label[csumbes16$D26 == 3 ] <- "Upper Division Transfer"
csumbes16$D26_Label[csumbes16$D26 == 4 ] <- "Transitory"
factor(csumbes16$D27,levels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31),labels = c("Fall 1997","Fall 1998","Fall 1999","Fall 2000","Fall 2001","Fall 2002","Fall 2003","Fall 2004","Fall 2005","Fall 2006","Fall 2007","Fall 2008","Fall 2009","Fall 2010","Fall 2011","Fall 2012","Fall 2013","Fall 2014","Fall 2015","Spring 1997","Spring 2003","Spring 2004","Spring 2005","Spring 2006","Spring 2011","Spring 2012","Spring 2013","Spring 2014","Spring 2015","Spring 2016","Summer 2014"))
csumbes16$D27_Label[csumbes16$D27 == 1 ] <- "Fall 1997"
csumbes16$D27_Label[csumbes16$D27 == 2 ] <- "Fall 1998"
csumbes16$D27_Label[csumbes16$D27 == 3 ] <- "Fall 1999"
csumbes16$D27_Label[csumbes16$D27 == 4 ] <- "Fall 2000"
csumbes16$D27_Label[csumbes16$D27 == 5 ] <- "Fall 2001"
csumbes16$D27_Label[csumbes16$D27 == 6 ] <- "Fall 2002"
csumbes16$D27_Label[csumbes16$D27 == 7 ] <- "Fall 2003"
csumbes16$D27_Label[csumbes16$D27 == 8 ] <- "Fall 2004"
csumbes16$D27_Label[csumbes16$D27 == 9 ] <- "Fall 2005"
csumbes16$D27_Label[csumbes16$D27 == 10 ] <- "Fall 2006"
csumbes16$D27_Label[csumbes16$D27 == 11 ] <- "Fall 2007"
csumbes16$D27_Label[csumbes16$D27 == 12 ] <- "Fall 2008"
csumbes16$D27_Label[csumbes16$D27 == 13 ] <- "Fall 2009"
csumbes16$D27_Label[csumbes16$D27 == 14 ] <- "Fall 2010"
csumbes16$D27_Label[csumbes16$D27 == 15 ] <- "Fall 2011"
csumbes16$D27_Label[csumbes16$D27 == 16 ] <- "Fall 2012"
csumbes16$D27_Label[csumbes16$D27 == 17 ] <- "Fall 2013"
csumbes16$D27_Label[csumbes16$D27 == 18 ] <- "Fall 2014"
csumbes16$D27_Label[csumbes16$D27 == 19 ] <- "Fall 2015"
csumbes16$D27_Label[csumbes16$D27 == 20 ] <- "Spring 1997"
csumbes16$D27_Label[csumbes16$D27 == 21 ] <- "Spring 2003"
csumbes16$D27_Label[csumbes16$D27 == 22 ] <- "Spring 2004"
csumbes16$D27_Label[csumbes16$D27 == 23 ] <- "Spring 2005"
csumbes16$D27_Label[csumbes16$D27 == 24 ] <- "Spring 2006"
csumbes16$D27_Label[csumbes16$D27 == 25 ] <- "Spring 2011"
csumbes16$D27_Label[csumbes16$D27 == 26 ] <- "Spring 2012"
csumbes16$D27_Label[csumbes16$D27 == 27 ] <- "Spring 2013"
csumbes16$D27_Label[csumbes16$D27 == 28 ] <- "Spring 2014"
csumbes16$D27_Label[csumbes16$D27 == 29 ] <- "Spring 2015"
csumbes16$D27_Label[csumbes16$D27 == 30 ] <- "Spring 2016"
csumbes16$D27_Label[csumbes16$D27 == 31 ] <- "Summer 2014"
factor(csumbes16$D28,levels = c(1,2,3,4),labels = c("Continuing","Transitory","New Transfer","New FTF"))
csumbes16$D28_Label[csumbes16$D28 == 1 ] <- "Continuing"
csumbes16$D28_Label[csumbes16$D28 == 2 ] <- "Transitory"
csumbes16$D28_Label[csumbes16$D28 == 3 ] <- "New Transfer"
csumbes16$D28_Label[csumbes16$D28 == 4 ] <- "New FTF"
factor(csumbes16$D29,levels = c(1,2),labels = c("Pell Eligible","Not Pell Eligible"))
csumbes16$D29_Label[csumbes16$D29 == 1 ] <- "Pell Eligible"
csumbes16$D29_Label[csumbes16$D29 == 2 ] <- "Not Pell Eligible"
factor(csumbes16$D30,levels = c(1,2),labels = c("Low Income","Not Low Income"))
csumbes16$D30_Label[csumbes16$D30 == 1 ] <- "Low Income"
csumbes16$D30_Label[csumbes16$D30 == 2 ] <- "Not Low Income"
factor(csumbes16$D31,levels = c(1,2),labels = c("First Generation","Not First Generation"))
csumbes16$D31_Label[csumbes16$D31 == 1 ] <- "First Generation"
csumbes16$D31_Label[csumbes16$D31 == 2 ] <- "Not First Generation"
factor(csumbes16$D32,levels = c(1,2),labels = c("University Housing","Not University Housing"))
csumbes16$D32_Label[csumbes16$D32 == 1 ] <- "University Housing"
csumbes16$D32_Label[csumbes16$D32 == 2 ] <- "Not University Housing"
factor(csumbes16$D33,levels = c(1,2,3,4),labels = c("Promontory","East Campus","Off Campus","Main Campus"))
csumbes16$D33_Label[csumbes16$D33 == 1 ] <- "Promontory"
csumbes16$D33_Label[csumbes16$D33 == 2 ] <- "East Campus"
csumbes16$D33_Label[csumbes16$D33 == 3 ] <- "Off Campus"
csumbes16$D33_Label[csumbes16$D33 == 4 ] <- "Main Campus"
factor(csumbes16$D34,levels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26),labels = c("Promontory West (C)","Gettysburg Court","Off Campus","Fredericksburg Court","Pinnacles Suites","Asilomar Hall","Petersburg Court","Promontory East (A)","Manzanita Hall","Yorktown Court","Princeton Court","Yarrow Hall","Cypress Hall","Tortuga Hall","Vineyard Suites","Sanderling Hall","Willet Hall","Avocet Hall","Minuteman Court","Antietam Court","Wilderness Court","Spotsylvania Court","Strawberry Apartments","Promontory Center (B)","Trenton Court","Saratoga Court"))
csumbes16$D34_Label[csumbes16$D34 == 1 ] <- "Promontory West (C)"
csumbes16$D34_Label[csumbes16$D34 == 2 ] <- "Gettysburg Court"
csumbes16$D34_Label[csumbes16$D34 == 3 ] <- "Off Campus"
csumbes16$D34_Label[csumbes16$D34 == 4 ] <- "Fredericksburg Court"
csumbes16$D34_Label[csumbes16$D34 == 5 ] <- "Pinnacles Suites"
csumbes16$D34_Label[csumbes16$D34 == 6 ] <- "Asilomar Hall"
csumbes16$D34_Label[csumbes16$D34 == 7 ] <- "Petersburg Court"
csumbes16$D34_Label[csumbes16$D34 == 8 ] <- "Promontory East (A)"
csumbes16$D34_Label[csumbes16$D34 == 9 ] <- "Manzanita Hall"
csumbes16$D34_Label[csumbes16$D34 == 10 ] <- "Yorktown Court"
csumbes16$D34_Label[csumbes16$D34 == 11 ] <- "Princeton Court"
csumbes16$D34_Label[csumbes16$D34 == 12 ] <- "Yarrow Hall"
csumbes16$D34_Label[csumbes16$D34 == 13 ] <- "Cypress Hall"
csumbes16$D34_Label[csumbes16$D34 == 14 ] <- "Tortuga Hall"
csumbes16$D34_Label[csumbes16$D34 == 15 ] <- "Vineyard Suites"
csumbes16$D34_Label[csumbes16$D34 == 16 ] <- "Sanderling Hall"
csumbes16$D34_Label[csumbes16$D34 == 17 ] <- "Willet Hall"
csumbes16$D34_Label[csumbes16$D34 == 18 ] <- "Avocet Hall"
csumbes16$D34_Label[csumbes16$D34 == 19 ] <- "Minuteman Court"
csumbes16$D34_Label[csumbes16$D34 == 20 ] <- "Antietam Court"
csumbes16$D34_Label[csumbes16$D34 == 21 ] <- "Wilderness Court"
csumbes16$D34_Label[csumbes16$D34 == 22 ] <- "Spotsylvania Court"
csumbes16$D34_Label[csumbes16$D34 == 23 ] <- "Strawberry Apartments"
csumbes16$D34_Label[csumbes16$D34 == 24 ] <- "Promontory Center (B)"
csumbes16$D34_Label[csumbes16$D34 == 25 ] <- "Trenton Court"
csumbes16$D34_Label[csumbes16$D34 == 26 ] <- "Saratoga Court"
csumbes16$DCumlGPA[csumbes16$DCumlGPA == "" ] <- NA
csumbes16$DCumlGPA_Rounded[!is.na(csumbes16$DCumlGPA) ] <- round(csumbes16$DCumlGPA_Num,1)
csumbes16$DCumlGPA_Cat[as.numeric(as.character(csumbes16$DCumlGPA)) < 0.5 & as.numeric(as.character(csumbes16$DCumlGPA)) >= 0] <- "Less than 0.5"
csumbes16$DCumlGPA_Cat[as.numeric(as.character(csumbes16$DCumlGPA)) < 1 & as.numeric(as.character(csumbes16$DCumlGPA)) >= .5] <- "0.5-0.99"
csumbes16$DCumlGPA_Cat[as.numeric(as.character(csumbes16$DCumlGPA)) < 1.5 & as.numeric(as.character(csumbes16$DCumlGPA)) >= 1] <- "1-1.49"
csumbes16$DCumlGPA_Cat[as.numeric(as.character(csumbes16$DCumlGPA)) < 2 & as.numeric(as.character(csumbes16$DCumlGPA)) >= 1.5] <- "1.5-1.99"
csumbes16$DCumlGPA_Cat[as.numeric(as.character(csumbes16$DCumlGPA)) < 2.5 & as.numeric(as.character(csumbes16$DCumlGPA)) >= 2] <- "2-2.49"
csumbes16$DCumlGPA_Cat[as.numeric(as.character(csumbes16$DCumlGPA)) < 3 & as.numeric(as.character(csumbes16$DCumlGPA)) >= 2.5] <- "2.5-2.99"
csumbes16$DCumlGPA_Cat[as.numeric(as.character(csumbes16$DCumlGPA)) < 3.5 & as.numeric(as.character(csumbes16$DCumlGPA)) >= 3] <- "3-3.49"
csumbes16$DCumlGPA_Cat[as.numeric(as.character(csumbes16$DCumlGPA)) <= 4 & as.numeric(as.character(csumbes16$DCumlGPA)) >= 3.5] <- "3.5-4"
csumbes16$DCumlGPA_Cat[csumbes16$DCumlGPA == "" ] <- NA
ordered(csumbes16$Q15, levels = c(0,1,2,3,4,5), labels = c("Not applicable/No basis to judge","Very dissatisfied","Dissatisfied","Neither satisfied nor dissatisfied","Satisfied","Very satisfied"))
ordered(csumbes16$Q16, levels = c(0,1,2,3,4,5), labels = c("Not applicable/No basis to judge","Very dissatisfied","Dissatisfied","Neither satisfied nor dissatisfied","Satisfied","Very satisfied"))
ordered(csumbes16$Q17, levels = c(0,1,2,3,4,5), labels = c("Not applicable/No basis to judge","Very dissatisfied","Dissatisfied","Neither satisfied nor dissatisfied","Satisfied","Very satisfied"))
ordered(csumbes16$Q18, levels = c(0,1,2,3,4,5), labels = c("Not applicable/No basis to judge","Very dissatisfied","Dissatisfied","Neither satisfied nor dissatisfied","Satisfied","Very satisfied"))
ordered(csumbes16$Q19, levels = c(0,1,2,3,4,5), labels = c("Not applicable/No basis to judge","Very dissatisfied","Dissatisfied","Neither satisfied nor dissatisfied","Satisfied","Very satisfied"))
ordered(csumbes16$Q20, levels = c(0,1,2,3,4,5), labels = c("Not applicable/No basis to judge","Very dissatisfied","Dissatisfied","Neither satisfied nor dissatisfied","Satisfied","Very satisfied"))
ordered(csumbes16$Q21, levels = c(0,1,2,3,4,5), labels = c("Not applicable/No basis to judge","Very dissatisfied","Dissatisfied","Neither satisfied nor dissatisfied","Satisfied","Very satisfied"))
ordered(csumbes16$Q22, levels = c(0,1,2,3,4,5), labels = c("Not applicable/No basis to judge","Very dissatisfied","Dissatisfied","Neither satisfied nor dissatisfied","Satisfied","Very satisfied"))
ordered(csumbes16$Q23, levels = c(0,1,2,3,4,5), labels = c("Not applicable/No basis to judge","Very dissatisfied","Dissatisfied","Neither satisfied nor dissatisfied","Satisfied","Very satisfied"))
ordered(csumbes16$Q24, levels = c(0,1,2,3,4,5), labels = c("Not applicable/No basis to judge","Very dissatisfied","Dissatisfied","Neither satisfied nor dissatisfied","Satisfied","Very satisfied"))
ordered(csumbes16$Q25, levels = c(0,1,2,3,4,5), labels = c("Not applicable/No basis to judge","Very dissatisfied","Dissatisfied","Neither satisfied nor dissatisfied","Satisfied","Very satisfied"))

label(csumbes16$D2_Label) <- label(csumbes16$D2)
label(csumbes16$D3_Label) <- label(csumbes16$D3)
label(csumbes16$D5_Label) <- label(csumbes16$D5)
label(csumbes16$D6_Label) <- label(csumbes16$D6)
label(csumbes16$D9_Label) <- label(csumbes16$D9)
label(csumbes16$D11_Label) <- label(csumbes16$D11)
label(csumbes16$D13_Label) <- label(csumbes16$D13)
label(csumbes16$D14_Label) <- label(csumbes16$D14)
label(csumbes16$D15_Label) <- label(csumbes16$D15)
label(csumbes16$D16_Label) <- label(csumbes16$D16)
label(csumbes16$D17_Label) <- label(csumbes16$D17)
label(csumbes16$D18_Label) <- label(csumbes16$D18)
label(csumbes16$D20_Label) <- label(csumbes16$D20)
label(csumbes16$D21_Label) <- label(csumbes16$D21)
label(csumbes16$D22_Label) <- label(csumbes16$D22)
label(csumbes16$D23_Label) <- label(csumbes16$D23)
label(csumbes16$D24_Label) <- label(csumbes16$D24)
label(csumbes16$D25_Label) <- label(csumbes16$D25)
label(csumbes16$D26_Label) <- label(csumbes16$D26)
label(csumbes16$D27_Label) <- label(csumbes16$D27)
label(csumbes16$D28_Label) <- label(csumbes16$D28)
label(csumbes16$D29_Label) <- label(csumbes16$D29)
label(csumbes16$D30_Label) <- label(csumbes16$D30)
label(csumbes16$D31_Label) <- label(csumbes16$D31)
label(csumbes16$D32_Label) <- label(csumbes16$D32)
label(csumbes16$D33_Label) <- label(csumbes16$D33)
label(csumbes16$D34_Label) <- label(csumbes16$D34)
csumbes16$dummy <- 1

csumbes16$Q1_Label[csumbes16$Q1 == 0] <- "Undecided"
csumbes16$Q1_Label[csumbes16$Q1 == 1] <- "Accountant"
csumbes16$Q1_Label[csumbes16$Q1 == 2] <- "Actor/entertainer"
csumbes16$Q1_Label[csumbes16$Q1 == 3] <- "Architect/urban planner"
csumbes16$Q1_Label[csumbes16$Q1 == 4] <- "Artist"
csumbes16$Q1_Label[csumbes16$Q1 == 5] <- "Business"
csumbes16$Q1_Label[csumbes16$Q1 == 6] <- "Clergy (e.g., minister, priest, rabbi, etc)"
csumbes16$Q1_Label[csumbes16$Q1 == 7] <- "Clinical psychologist"
csumbes16$Q1_Label[csumbes16$Q1 == 8] <- "College administrator/staff"
csumbes16$Q1_Label[csumbes16$Q1 == 9] <- "College professor"
csumbes16$Q1_Label[csumbes16$Q1 == 10] <- "Computer programmer/systems analyst"
csumbes16$Q1_Label[csumbes16$Q1 == 11] <- "Conservationist/forester"
csumbes16$Q1_Label[csumbes16$Q1 == 12] <- "Dentist/orthodontist"
csumbes16$Q1_Label[csumbes16$Q1 == 13] <- "Dietician/home economist"
csumbes16$Q1_Label[csumbes16$Q1 == 14] <- "Engineer"
csumbes16$Q1_Label[csumbes16$Q1 == 15] <- "Farmer/rancher"
csumbes16$Q1_Label[csumbes16$Q1 == 16] <- "Foreign service worker/diplomat"
csumbes16$Q1_Label[csumbes16$Q1 == 17] <- "Homemaker (full-time)"
csumbes16$Q1_Label[csumbes16$Q1 == 18] <- "Interior decorator/designer"
csumbes16$Q1_Label[csumbes16$Q1 == 19] <- "Lab technician/hygienist"
csumbes16$Q1_Label[csumbes16$Q1 == 20] <- "Law enforcement officer"
csumbes16$Q1_Label[csumbes16$Q1 == 21] <- "Lawyer/attorney/judge"
csumbes16$Q1_Label[csumbes16$Q1 == 22] <- "Military service (career)"
csumbes16$Q1_Label[csumbes16$Q1 == 23] <- "Musician/performer/composer"
csumbes16$Q1_Label[csumbes16$Q1 == 24] <- "Nurse"
csumbes16$Q1_Label[csumbes16$Q1 == 25] <- "Optometrist"
csumbes16$Q1_Label[csumbes16$Q1 == 26] <- "Pharmacist"
csumbes16$Q1_Label[csumbes16$Q1 == 27] <- "Physician/medical doctor"
csumbes16$Q1_Label[csumbes16$Q1 == 28] <- "Policymaker/government"
csumbes16$Q1_Label[csumbes16$Q1 == 29] <- "School counselor"
csumbes16$Q1_Label[csumbes16$Q1 == 30] <- "School principal/superintendent"
csumbes16$Q1_Label[csumbes16$Q1 == 31] <- "Scientific researcher"
csumbes16$Q1_Label[csumbes16$Q1 == 32] <- "Social/welfare/recreation worker"
csumbes16$Q1_Label[csumbes16$Q1 == 33] <- "Therapist (physical, occupational, speech)"
csumbes16$Q1_Label[csumbes16$Q1 == 34] <- "Teacher/administrator (elementary)"
csumbes16$Q1_Label[csumbes16$Q1 == 35] <- "Teacher/administrator (secondary)"
csumbes16$Q1_Label[csumbes16$Q1 == 36] <- "Veterinarian"
csumbes16$Q1_Label[csumbes16$Q1 == 37] <- "Writer/journalist"
csumbes16$Q1_Label[csumbes16$Q1 == 38] <- "Skilled trades"
csumbes16$Q1_Label[csumbes16$Q1 == 39] <- "Other/Not listed"
label(csumbes16$Q1_Label) <- label(csumbes16$Q1)
csumbes16$Q2[csumbes16$Q2 == 0] <- NA
csumbes16$Q2_Label[csumbes16$Q2 == 2] <- "No"
csumbes16$Q2_Label[csumbes16$Q2 == 3] <- "Maybe"
csumbes16$Q2_Label[csumbes16$Q2 == 4] <- "Probably"
csumbes16$Q2_Label[csumbes16$Q2 == 5] <- "Definitely"
label(csumbes16$Q2_Label) <- label(csumbes16$Q2)
csumbes16$Q3_Label[csumbes16$Q3 == 0] <- "No degree"
csumbes16$Q3_Label[csumbes16$Q3 == 1] <- "Bachelor's degree"
csumbes16$Q3_Label[csumbes16$Q3 == 2] <- "Teaching Credential"
csumbes16$Q3_Label[csumbes16$Q3 == 3] <- "Master's degree"
csumbes16$Q3_Label[csumbes16$Q3 == 4] <- "First professional degree"
csumbes16$Q3_Label[csumbes16$Q3 == 5] <- "Doctoral degree"
label(csumbes16$Q3_Label) <- label(csumbes16$Q3)
csumbes16$Q89_Label[csumbes16$Q89 == 1] <- "Faculty Advisor"
csumbes16$Q89_Label[csumbes16$Q89 == 2] <- "Major Advisor \nwithin my department"
csumbes16$Q89_Label[csumbes16$Q89 == 3] <- "Center for Advising, Career, \nand Student Success Advisor"
csumbes16$Q89_Label[csumbes16$Q89 == 4] <- "EOP/TRIO/SSS Advisor"
csumbes16$Q89_Label[csumbes16$Q89 == 5] <- "Peer Advisor"
csumbes16$Q89_Label[csumbes16$Q89 == 6] <- "I do not have an Advisor"
csumbes16$Q89_Label[csumbes16$Q89 == 7] <- "Other"
label(csumbes16$Q89_Label) <- label(csumbes16$Q89)
csumbes16$Q97_Label[csumbes16$Q97 == 1] <- "Asilomar Hall"
csumbes16$Q97_Label[csumbes16$Q97 == 2] <- "Avocet Hall"
csumbes16$Q97_Label[csumbes16$Q97 == 3] <- "Cypress Hall"
csumbes16$Q97_Label[csumbes16$Q97 == 4] <- "East Campus"
csumbes16$Q97_Label[csumbes16$Q97 == 5] <- "Manzanita Hall"
csumbes16$Q97_Label[csumbes16$Q97 == 6] <- "Pinnacles Suites"
csumbes16$Q97_Label[csumbes16$Q97 == 7] <- "Promontory Center"
csumbes16$Q97_Label[csumbes16$Q97 == 8] <- "Promontory East"
csumbes16$Q97_Label[csumbes16$Q97 == 9] <- "Promontory West"
csumbes16$Q97_Label[csumbes16$Q97 == 10] <- "Sanderling Hall"
csumbes16$Q97_Label[csumbes16$Q97 == 11] <- "Strawberry Apartments"
csumbes16$Q97_Label[csumbes16$Q97 == 12] <- "Tortuga Hall"
csumbes16$Q97_Label[csumbes16$Q97 == 13] <- "Vineyard Suites"
csumbes16$Q97_Label[csumbes16$Q97 == 14] <- "Willet Hall"
csumbes16$Q97_Label[csumbes16$Q97 == 15] <- "Yarrow Hall"
csumbes16$Q97_Label[csumbes16$Q97 == 16] <- "At home with parents/family"
csumbes16$Q97_Label[csumbes16$Q97 == 17] <- "Off campus"
label(csumbes16$Q97_Label) <- label(csumbes16$Q97)
csumbes16$Q98_Label[csumbes16$Q98 == 1] <- "Not supportive at all"
csumbes16$Q98_Label[csumbes16$Q98 == 2] <- "Somewhat supportive"
csumbes16$Q98_Label[csumbes16$Q98 == 3] <- "Very supportive"
label(csumbes16$Q98_Label) <- label(csumbes16$Q98)
csumbes16$Q99_Label[csumbes16$Q99 == 1] <- "0 hours"
csumbes16$Q99_Label[csumbes16$Q99 == 2] <- "1-10 hours"
csumbes16$Q99_Label[csumbes16$Q99 == 3] <- "10-20 hours"
csumbes16$Q99_Label[csumbes16$Q99 == 4] <- "20-30 hours"
csumbes16$Q99_Label[csumbes16$Q99 == 5] <- "30-40 hours"
csumbes16$Q99_Label[csumbes16$Q99 == 6] <- "More than 40 hours"
label(csumbes16$Q99_Label) <- label(csumbes16$Q99)
csumbes16$Q100_Label[csumbes16$Q100 == 1] <- "Not confident at all"
csumbes16$Q100_Label[csumbes16$Q100 == 2] <- "Somewhat confident"
csumbes16$Q100_Label[csumbes16$Q100 == 3] <- "Very confident"
label(csumbes16$Q100_Label) <- label(csumbes16$Q100)
csumbes16$Q102_Label[csumbes16$Q102 == 0] <- "I do not plan to continue my\n higher education studies"
csumbes16$Q102_Label[csumbes16$Q102 == 1] <- "Another 4-year college \nwithin the CSU System"
csumbes16$Q102_Label[csumbes16$Q102 == 2] <- "Another 4-year college \noutside the CSU System"
csumbes16$Q102_Label[csumbes16$Q102 == 3] <- "A 2-year Community College"
csumbes16$Q102_Label[csumbes16$Q102 == 4] <- "Other"
label(csumbes16$Q102_Label) <- label(csumbes16$Q102)
csumbes16$Q103_Label[csumbes16$Q103 == 0] <- "I don\'t know"
csumbes16$Q103_Label[csumbes16$Q103 == 1] <- "Definitely no"
csumbes16$Q103_Label[csumbes16$Q103 == 2] <- "Probably no"
csumbes16$Q103_Label[csumbes16$Q103 == 3] <- "Probably yes"
csumbes16$Q103_Label[csumbes16$Q103 == 4] <- "Definitely yes"
label(csumbes16$Q103_Label) <- label(csumbes16$Q103)
csumbes16$Q104_Label[csumbes16$Q104 == 1] <- "Yes"
csumbes16$Q104_Label[csumbes16$Q104 == 2] <- "Not Sure"
csumbes16$Q104_Label[csumbes16$Q104 == 3] <- "No"
label(csumbes16$Q104_Label) <- label(csumbes16$Q104)
label(csumbes16$CASENUM) <- "Case Number"

#apply attributes

#Constructs
attr(csumbes16$Q1,'Construct') <- 'Goal'
attr(csumbes16$Q2,'Construct') <- 'Outcome'
attr(csumbes16$Q3,'Construct') <- 'Goal'
attr(csumbes16$Q4,'Construct') <- 'Priorities'
attr(csumbes16$Q5,'Construct') <- 'Priorities'
attr(csumbes16$Q6,'Construct') <- 'Priorities'
attr(csumbes16$Q7,'Construct') <- 'Priorities'
attr(csumbes16$Q8,'Construct') <- 'Priorities'
attr(csumbes16$Q9,'Construct') <- 'Priorities'
attr(csumbes16$Q10,'Construct') <- 'Priorities'
attr(csumbes16$Q11,'Construct') <- 'Priorities'
attr(csumbes16$Q12,'Construct') <- 'Priorities'
attr(csumbes16$Q13,'Construct') <- 'Priorities'
attr(csumbes16$Q14,'Construct') <- 'Priorities'
attr(csumbes16$Q15,'Construct') <- 'Curriculum'
attr(csumbes16$Q16,'Construct') <- ''
attr(csumbes16$Q17,'Construct') <- 'Activities'
attr(csumbes16$Q18,'Construct') <- 'Classroom'
attr(csumbes16$Q19,'Construct') <- 'Community'
attr(csumbes16$Q20,'Construct') <- 'Community'
attr(csumbes16$Q21,'Construct') <- 'Support'
attr(csumbes16$Q22,'Construct') <- 'Community'
attr(csumbes16$Q23,'Construct') <- 'Services '
attr(csumbes16$Q24,'Construct') <- 'Community'
attr(csumbes16$Q25,'Construct') <- 'Sustainability'
attr(csumbes16$Q26_1,'Construct') <- 'Sustainability'
attr(csumbes16$Q26_2,'Construct') <- 'Sustainability'
attr(csumbes16$Q26_3,'Construct') <- 'Sustainability'
attr(csumbes16$Q26_4,'Construct') <- 'Sustainability'
attr(csumbes16$Q26_5,'Construct') <- 'Sustainability'
attr(csumbes16$Q26_6,'Construct') <- 'Sustainability'
attr(csumbes16$Q26_7,'Construct') <- 'Sustainability'
attr(csumbes16$Q26_8,'Construct') <- 'Sustainability'
attr(csumbes16$Q26_9,'Construct') <- 'Sustainability'
attr(csumbes16$Q26_10,'Construct') <- 'Sustainability'
attr(csumbes16$Q26_11,'Construct') <- 'Sustainability'
attr(csumbes16$Q26_11OT,'Construct') <- 'Sustainability'
attr(csumbes16$Q27,'Construct') <- 'Advising'
attr(csumbes16$Q28,'Construct') <- 'Curriculum'
attr(csumbes16$Q29,'Construct') <- 'Support'
attr(csumbes16$Q30,'Construct') <- 'Activities'
attr(csumbes16$Q31,'Construct') <- 'Organizational Behavior'
attr(csumbes16$Q32,'Construct') <- 'Services '
attr(csumbes16$Q33,'Construct') <- 'Services '
attr(csumbes16$Q34,'Construct') <- 'Community'
attr(csumbes16$Q35,'Construct') <- 'Curriculum'
attr(csumbes16$Q36,'Construct') <- 'Classroom'
attr(csumbes16$Q37,'Construct') <- 'Curriculum'
attr(csumbes16$Q38,'Construct') <- 'Facilities'
attr(csumbes16$Q39,'Construct') <- 'Advising'
attr(csumbes16$Q40,'Construct') <- 'Services '
attr(csumbes16$Q41,'Construct') <- 'Facilities'
attr(csumbes16$Q42,'Construct') <- 'Activities'
attr(csumbes16$Q43,'Construct') <- 'Resources'
attr(csumbes16$Q44,'Construct') <- 'Resources'
attr(csumbes16$Q45,'Construct') <- 'Services '
attr(csumbes16$Q46,'Construct') <- 'Pedagogy'
attr(csumbes16$Q47,'Construct') <- 'Pedagogy'
attr(csumbes16$Q48,'Construct') <- 'Pedagogy'
attr(csumbes16$Q49,'Construct') <- 'Facilities'
attr(csumbes16$Q50,'Construct') <- 'Facilities'
attr(csumbes16$Q51,'Construct') <- 'Services '
attr(csumbes16$Q52,'Construct') <- 'Community'
attr(csumbes16$Q53,'Construct') <- 'Community'
attr(csumbes16$Q54,'Construct') <- 'Community'
attr(csumbes16$Q55,'Construct') <- 'Community'
attr(csumbes16$Q56,'Construct') <- 'Community'
attr(csumbes16$Q57,'Construct') <- 'Community'
attr(csumbes16$Q58,'Construct') <- 'Services '
attr(csumbes16$Q59,'Construct') <- 'Community'
attr(csumbes16$Q60,'Construct') <- 'Services '
attr(csumbes16$Q61,'Construct') <- 'Services '
attr(csumbes16$Q62,'Construct') <- 'Activities'
attr(csumbes16$Q63,'Construct') <- 'Activities'
attr(csumbes16$Q64,'Construct') <- 'Activities'
attr(csumbes16$Q65,'Construct') <- 'Activities'
attr(csumbes16$Q66,'Construct') <- 'Overall satisfaction'
attr(csumbes16$Q67,'Construct') <- 'Pedagogy'
attr(csumbes16$Q68,'Construct') <- 'Pedagogy'
attr(csumbes16$Q69,'Construct') <- 'Pedagogy'
attr(csumbes16$Q70,'Construct') <- 'Pedagogy'
attr(csumbes16$Q71,'Construct') <- 'Pedagogy'
attr(csumbes16$Q72,'Construct') <- 'Pedagogy'
attr(csumbes16$Q73,'Construct') <- 'Pedagogy'
attr(csumbes16$Q74,'Construct') <- 'Pedagogy'
attr(csumbes16$Q75,'Construct') <- 'Pedagogy'
attr(csumbes16$Q76,'Construct') <- 'Pedagogy'
attr(csumbes16$Q77,'Construct') <- 'Pedagogy'
attr(csumbes16$Q78,'Construct') <- 'Advising'
attr(csumbes16$Q79,'Construct') <- 'Curriculum'
attr(csumbes16$Q80,'Construct') <- 'Curriculum'
attr(csumbes16$Q81,'Construct') <- 'Advising'
attr(csumbes16$Q82,'Construct') <- 'Pedagogy'
attr(csumbes16$Q83,'Construct') <- 'Pedagogy'
attr(csumbes16$Q84,'Construct') <- 'Curriculum'
attr(csumbes16$Q85,'Construct') <- 'Pedagogy'
attr(csumbes16$Q86,'Construct') <- 'Advising'
attr(csumbes16$Q87,'Construct') <- 'Pedagogy'
attr(csumbes16$Q88,'Construct') <- 'Community'
attr(csumbes16$Q89,'Construct') <- 'Advising'
attr(csumbes16$Q89_5OT,'Construct') <- 'Advising'
attr(csumbes16$Q89_7OT,'Construct') <- 'Advising'
attr(csumbes16$Q90,'Construct') <- 'Advising'
attr(csumbes16$Q91,'Construct') <- 'Advising'
attr(csumbes16$Q92,'Construct') <- 'Advising'
attr(csumbes16$Q93,'Construct') <- 'Advising'
attr(csumbes16$Q94,'Construct') <- 'Advising'
attr(csumbes16$Q95_1,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_2,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_3,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_4,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_5,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_6,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_7,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_8,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_9,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_10,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_11,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_12,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_13,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_14,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_15,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_16,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_17,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_18,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_17OT,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_1,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_2,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_3,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_4,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_5,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_6,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_7,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_8,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_9,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_10,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_11,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_12,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_13,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_14,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_15,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_16,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_17,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_18,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_17OT,'Construct') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q97,'Construct') <- 'Grouping'
attr(csumbes16$Q98,'Construct') <- 'Support'
attr(csumbes16$Q99,'Construct') <- 'Grouping'
attr(csumbes16$Q100,'Construct') <- 'Outcome'
attr(csumbes16$Q101,'Construct') <- 'Qualitative'
attr(csumbes16$Q101_1OT,'Construct') <- 'Qualitative'
attr(csumbes16$Q102,'Construct') <- 'Goal'
attr(csumbes16$Q103,'Construct') <- 'Overall satisfaction'
attr(csumbes16$Q104,'Construct') <- 'Overall satisfaction'
attr(csumbes16$Q105,'Construct') <- 'Qualitative'
attr(csumbes16$Q105_1OT,'Construct') <- 'Qualitative'
attr(csumbes16$Q106,'Construct') <- 'Qualitative'
attr(csumbes16$Q106_1OT,'Construct') <- 'Qualitative'
attr(csumbes16$Q107,'Construct') <- 'Qualitative'
attr(csumbes16$Q107_1OT,'Construct') <- 'Qualitative'

#Department
attr(csumbes16$Q1,'Department') <- 'Career Services'
attr(csumbes16$Q2,'Department') <- 'Advising'
attr(csumbes16$Q3,'Department') <- 'Advising'
attr(csumbes16$Q4,'Department') <- 'Academic Affairs'
attr(csumbes16$Q5,'Department') <- 'Academic Affairs'
attr(csumbes16$Q6,'Department') <- 'Athletics'
attr(csumbes16$Q7,'Department') <- 'Academic Affairs'
attr(csumbes16$Q8,'Department') <- 'Cabinet'
attr(csumbes16$Q9,'Department') <- 'Inclusive Excellence'
attr(csumbes16$Q10,'Department') <- 'Financial Aid'
attr(csumbes16$Q11,'Department') <- 'Inclusive Excellence'
attr(csumbes16$Q12,'Department') <- 'Residential Life'
attr(csumbes16$Q13,'Department') <- 'Inclusive Excellence'
attr(csumbes16$Q14,'Department') <- 'Sustainability'
attr(csumbes16$Q15,'Department') <- 'Academic Affairs'
attr(csumbes16$Q16,'Department') <- 'Academic Affairs'
attr(csumbes16$Q17,'Department') <- 'Athletics'
attr(csumbes16$Q18,'Department') <- 'Academic Affairs'
attr(csumbes16$Q19,'Department') <- 'Cabinet'
attr(csumbes16$Q20,'Department') <- 'Inclusive Excellence'
attr(csumbes16$Q21,'Department') <- 'Financial Aid'
attr(csumbes16$Q22,'Department') <- 'Inclusive Excellence'
attr(csumbes16$Q23,'Department') <- 'Residential Life'
attr(csumbes16$Q24,'Department') <- 'Inclusive Excellence'
attr(csumbes16$Q25,'Department') <- 'Sustainability'
attr(csumbes16$Q26_1,'Department') <- 'Sustainability'
attr(csumbes16$Q26_2,'Department') <- 'Sustainability'
attr(csumbes16$Q26_3,'Department') <- 'Sustainability'
attr(csumbes16$Q26_4,'Department') <- 'Sustainability'
attr(csumbes16$Q26_5,'Department') <- 'Sustainability'
attr(csumbes16$Q26_6,'Department') <- 'Sustainability'
attr(csumbes16$Q26_7,'Department') <- 'Sustainability'
attr(csumbes16$Q26_8,'Department') <- 'Sustainability'
attr(csumbes16$Q26_9,'Department') <- 'Sustainability'
attr(csumbes16$Q26_10,'Department') <- 'Sustainability'
attr(csumbes16$Q26_11,'Department') <- 'Sustainability'
attr(csumbes16$Q26_11OT,'Department') <- 'Sustainability'
attr(csumbes16$Q27,'Department') <- 'Advising'
attr(csumbes16$Q28,'Department') <- 'Academic Affairs'
attr(csumbes16$Q29,'Department') <- 'Facilties'
attr(csumbes16$Q30,'Department') <- 'Activities'
attr(csumbes16$Q31,'Department') <- 'Cabinet'
attr(csumbes16$Q32,'Department') <- 'PGCC'
attr(csumbes16$Q33,'Department') <- 'Police'
attr(csumbes16$Q34,'Department') <- 'Activities'
attr(csumbes16$Q35,'Department') <- 'Academic Affairs'
attr(csumbes16$Q36,'Department') <- 'Facilties'
attr(csumbes16$Q37,'Department') <- 'Career Services'
attr(csumbes16$Q38,'Department') <- 'Athletics'
attr(csumbes16$Q39,'Department') <- 'Career Services'
attr(csumbes16$Q40,'Department') <- 'PGCC'
attr(csumbes16$Q41,'Department') <- 'Facilties'
attr(csumbes16$Q42,'Department') <- 'Activities'
attr(csumbes16$Q43,'Department') <- 'Library'
attr(csumbes16$Q44,'Department') <- 'Library'
attr(csumbes16$Q45,'Department') <- 'Library'
attr(csumbes16$Q46,'Department') <- 'Academic Affairs'
attr(csumbes16$Q47,'Department') <- 'Academic Affairs'
attr(csumbes16$Q48,'Department') <- 'Academic Affairs'
attr(csumbes16$Q49,'Department') <- 'Residential Life'
attr(csumbes16$Q50,'Department') <- 'Facilties'
attr(csumbes16$Q51,'Department') <- 'Registrar'
attr(csumbes16$Q52,'Department') <- 'Financial Aid'
attr(csumbes16$Q53,'Department') <- 'Financial Aid'
attr(csumbes16$Q54,'Department') <- 'Registrar'
attr(csumbes16$Q55,'Department') <- 'IT'
attr(csumbes16$Q56,'Department') <- 'Cabinet'
attr(csumbes16$Q57,'Department') <- 'Inclusive Excellence'
attr(csumbes16$Q58,'Department') <- 'SDR'
attr(csumbes16$Q59,'Department') <- 'Inclusive Excellence'
attr(csumbes16$Q60,'Department') <- 'Tutoring'
attr(csumbes16$Q61,'Department') <- 'Advising'
attr(csumbes16$Q62,'Department') <- 'Athletics'
attr(csumbes16$Q63,'Department') <- 'Activities'
attr(csumbes16$Q64,'Department') <- 'Activities'
attr(csumbes16$Q65,'Department') <- 'Activities'
attr(csumbes16$Q66,'Department') <- 'Cabinet'
attr(csumbes16$Q67,'Department') <- 'Assessment Committee'
attr(csumbes16$Q68,'Department') <- 'Assessment Committee'
attr(csumbes16$Q69,'Department') <- 'Assessment Committee'
attr(csumbes16$Q70,'Department') <- 'Assessment Committee'
attr(csumbes16$Q71,'Department') <- 'Assessment Committee'
attr(csumbes16$Q72,'Department') <- 'Assessment Committee'
attr(csumbes16$Q73,'Department') <- 'Assessment Committee'
attr(csumbes16$Q74,'Department') <- 'Assessment Committee'
attr(csumbes16$Q75,'Department') <- 'Assessment Committee'
attr(csumbes16$Q76,'Department') <- 'Assessment Committee'
attr(csumbes16$Q77,'Department') <- 'Assessment Committee'
attr(csumbes16$Q78,'Department') <- 'Advising'
attr(csumbes16$Q79,'Department') <- 'Academic Affairs'
attr(csumbes16$Q80,'Department') <- 'Academic Affairs'
attr(csumbes16$Q81,'Department') <- 'Academic Affairs'
attr(csumbes16$Q82,'Department') <- 'Academic Affairs'
attr(csumbes16$Q83,'Department') <- 'Academic Affairs'
attr(csumbes16$Q84,'Department') <- 'Academic Affairs'
attr(csumbes16$Q85,'Department') <- 'Academic Affairs'
attr(csumbes16$Q86,'Department') <- 'Academic Affairs'
attr(csumbes16$Q87,'Department') <- 'Academic Affairs'
attr(csumbes16$Q88,'Department') <- 'Academic Affairs'
attr(csumbes16$Q89,'Department') <- 'Advising'
attr(csumbes16$Q89_5OT,'Department') <- 'Advising'
attr(csumbes16$Q89_7OT,'Department') <- 'Advising'
attr(csumbes16$Q90,'Department') <- 'Advising'
attr(csumbes16$Q91,'Department') <- 'Advising'
attr(csumbes16$Q92,'Department') <- 'Advising'
attr(csumbes16$Q93,'Department') <- 'Advising'
attr(csumbes16$Q94,'Department') <- 'Advising'
attr(csumbes16$Q95_1,'Department') <- 'Tutoring'
attr(csumbes16$Q95_2,'Department') <- 'Tutoring'
attr(csumbes16$Q95_3,'Department') <- 'Tutoring'
attr(csumbes16$Q95_4,'Department') <- 'Tutoring'
attr(csumbes16$Q95_5,'Department') <- 'Tutoring'
attr(csumbes16$Q95_6,'Department') <- 'Tutoring'
attr(csumbes16$Q95_7,'Department') <- 'Tutoring'
attr(csumbes16$Q95_8,'Department') <- 'Tutoring'
attr(csumbes16$Q95_9,'Department') <- 'Tutoring'
attr(csumbes16$Q95_10,'Department') <- 'Tutoring'
attr(csumbes16$Q95_11,'Department') <- 'Tutoring'
attr(csumbes16$Q95_12,'Department') <- 'Tutoring'
attr(csumbes16$Q95_13,'Department') <- 'Tutoring'
attr(csumbes16$Q95_14,'Department') <- 'Tutoring'
attr(csumbes16$Q95_15,'Department') <- 'Tutoring'
attr(csumbes16$Q95_16,'Department') <- 'Tutoring'
attr(csumbes16$Q95_17,'Department') <- 'Tutoring'
attr(csumbes16$Q95_18,'Department') <- 'Tutoring'
attr(csumbes16$Q95_17OT,'Department') <- 'Tutoring'
attr(csumbes16$Q96_1,'Department') <- 'Tutoring'
attr(csumbes16$Q96_2,'Department') <- 'Tutoring'
attr(csumbes16$Q96_3,'Department') <- 'Tutoring'
attr(csumbes16$Q96_4,'Department') <- 'Tutoring'
attr(csumbes16$Q96_5,'Department') <- 'Tutoring'
attr(csumbes16$Q96_6,'Department') <- 'Tutoring'
attr(csumbes16$Q96_7,'Department') <- 'Tutoring'
attr(csumbes16$Q96_8,'Department') <- 'Tutoring'
attr(csumbes16$Q96_9,'Department') <- 'Tutoring'
attr(csumbes16$Q96_10,'Department') <- 'Tutoring'
attr(csumbes16$Q96_11,'Department') <- 'Tutoring'
attr(csumbes16$Q96_12,'Department') <- 'Tutoring'
attr(csumbes16$Q96_13,'Department') <- 'Tutoring'
attr(csumbes16$Q96_14,'Department') <- 'Tutoring'
attr(csumbes16$Q96_15,'Department') <- 'Tutoring'
attr(csumbes16$Q96_16,'Department') <- 'Tutoring'
attr(csumbes16$Q96_17,'Department') <- 'Tutoring'
attr(csumbes16$Q96_18,'Department') <- 'Tutoring'
attr(csumbes16$Q96_17OT,'Department') <- 'Tutoring'
attr(csumbes16$Q97,'Department') <- 'Residential Life'
attr(csumbes16$Q98,'Department') <- 'Advising'
attr(csumbes16$Q99,'Department') <- 'Advising'
attr(csumbes16$Q100,'Department') <- 'Advising'
attr(csumbes16$Q101,'Department') <- 'Advising'
attr(csumbes16$Q101_1OT,'Department') <- 'Advising'
attr(csumbes16$Q102,'Department') <- 'Advising'
attr(csumbes16$Q103,'Department') <- 'Cabinet'
attr(csumbes16$Q104,'Department') <- 'Cabinet'
attr(csumbes16$Q105,'Department') <- 'Cabinet'
attr(csumbes16$Q105_1OT,'Department') <- 'Cabinet'
attr(csumbes16$Q106,'Department') <- 'Cabinet'
attr(csumbes16$Q106_1OT,'Department') <- 'Cabinet'
attr(csumbes16$Q107,'Department') <- 'Cabinet'
attr(csumbes16$Q107_1OT,'Department') <- 'Cabinet'

#Scale
attr(csumbes16$Q1,'Scale') <- 'Frequency'
attr(csumbes16$Q2,'Scale') <- 'Frequency'
attr(csumbes16$Q3,'Scale') <- 'Frequency'
attr(csumbes16$Q4,'Scale') <- 'Importance'
attr(csumbes16$Q5,'Scale') <- 'Importance'
attr(csumbes16$Q6,'Scale') <- 'Importance'
attr(csumbes16$Q7,'Scale') <- 'Importance'
attr(csumbes16$Q8,'Scale') <- 'Importance'
attr(csumbes16$Q9,'Scale') <- 'Importance'
attr(csumbes16$Q10,'Scale') <- 'Importance'
attr(csumbes16$Q11,'Scale') <- 'Importance'
attr(csumbes16$Q12,'Scale') <- 'Importance'
attr(csumbes16$Q13,'Scale') <- 'Importance'
attr(csumbes16$Q14,'Scale') <- 'Importance'
attr(csumbes16$Q15,'Scale') <- 'Satisfaction'
attr(csumbes16$Q16,'Scale') <- 'Satisfaction'
attr(csumbes16$Q17,'Scale') <- 'Satisfaction'
attr(csumbes16$Q18,'Scale') <- 'Satisfaction'
attr(csumbes16$Q19,'Scale') <- 'Satisfaction'
attr(csumbes16$Q20,'Scale') <- 'Satisfaction'
attr(csumbes16$Q21,'Scale') <- 'Satisfaction'
attr(csumbes16$Q22,'Scale') <- 'Satisfaction'
attr(csumbes16$Q23,'Scale') <- 'Satisfaction'
attr(csumbes16$Q24,'Scale') <- 'Satisfaction'
attr(csumbes16$Q25,'Scale') <- 'Satisfaction'
attr(csumbes16$Q26_1,'Scale') <- 'Multiselect'
attr(csumbes16$Q26_2,'Scale') <- 'Multiselect'
attr(csumbes16$Q26_3,'Scale') <- 'Multiselect'
attr(csumbes16$Q26_4,'Scale') <- 'Multiselect'
attr(csumbes16$Q26_5,'Scale') <- 'Multiselect'
attr(csumbes16$Q26_6,'Scale') <- 'Multiselect'
attr(csumbes16$Q26_7,'Scale') <- 'Multiselect'
attr(csumbes16$Q26_8,'Scale') <- 'Multiselect'
attr(csumbes16$Q26_9,'Scale') <- 'Multiselect'
attr(csumbes16$Q26_10,'Scale') <- 'Multiselect'
attr(csumbes16$Q26_11,'Scale') <- 'Multiselect'
attr(csumbes16$Q26_11OT,'Scale') <- 'Short Answer'
attr(csumbes16$Q27,'Scale') <- 'Satisfaction'
attr(csumbes16$Q28,'Scale') <- 'Satisfaction'
attr(csumbes16$Q29,'Scale') <- 'Satisfaction'
attr(csumbes16$Q30,'Scale') <- 'Satisfaction'
attr(csumbes16$Q31,'Scale') <- 'Satisfaction'
attr(csumbes16$Q32,'Scale') <- 'Satisfaction'
attr(csumbes16$Q33,'Scale') <- 'Satisfaction'
attr(csumbes16$Q34,'Scale') <- 'Satisfaction'
attr(csumbes16$Q35,'Scale') <- 'Satisfaction'
attr(csumbes16$Q36,'Scale') <- 'Satisfaction'
attr(csumbes16$Q37,'Scale') <- 'Satisfaction'
attr(csumbes16$Q38,'Scale') <- 'Satisfaction'
attr(csumbes16$Q39,'Scale') <- 'Satisfaction'
attr(csumbes16$Q40,'Scale') <- 'Satisfaction'
attr(csumbes16$Q41,'Scale') <- 'Satisfaction'
attr(csumbes16$Q42,'Scale') <- 'Satisfaction'
attr(csumbes16$Q43,'Scale') <- 'Satisfaction'
attr(csumbes16$Q44,'Scale') <- 'Satisfaction'
attr(csumbes16$Q45,'Scale') <- 'Satisfaction'
attr(csumbes16$Q46,'Scale') <- 'Satisfaction'
attr(csumbes16$Q47,'Scale') <- 'Satisfaction'
attr(csumbes16$Q48,'Scale') <- 'Satisfaction'
attr(csumbes16$Q49,'Scale') <- 'Satisfaction'
attr(csumbes16$Q50,'Scale') <- 'Satisfaction'
attr(csumbes16$Q51,'Scale') <- 'Satisfaction'
attr(csumbes16$Q52,'Scale') <- 'Satisfaction'
attr(csumbes16$Q53,'Scale') <- 'Satisfaction'
attr(csumbes16$Q54,'Scale') <- 'Satisfaction'
attr(csumbes16$Q55,'Scale') <- 'Satisfaction'
attr(csumbes16$Q56,'Scale') <- 'Satisfaction'
attr(csumbes16$Q57,'Scale') <- 'Satisfaction'
attr(csumbes16$Q58,'Scale') <- 'Satisfaction'
attr(csumbes16$Q59,'Scale') <- 'Satisfaction'
attr(csumbes16$Q60,'Scale') <- 'Satisfaction'
attr(csumbes16$Q61,'Scale') <- 'Satisfaction'
attr(csumbes16$Q62,'Scale') <- 'Satisfaction'
attr(csumbes16$Q63,'Scale') <- 'Satisfaction'
attr(csumbes16$Q64,'Scale') <- 'Satisfaction'
attr(csumbes16$Q65,'Scale') <- 'Satisfaction'
attr(csumbes16$Q66,'Scale') <- 'Satisfaction'
attr(csumbes16$Q67,'Scale') <- 'Agreement'
attr(csumbes16$Q68,'Scale') <- 'Agreement'
attr(csumbes16$Q69,'Scale') <- 'Agreement'
attr(csumbes16$Q70,'Scale') <- 'Agreement'
attr(csumbes16$Q71,'Scale') <- 'Agreement'
attr(csumbes16$Q72,'Scale') <- 'Agreement'
attr(csumbes16$Q73,'Scale') <- 'Agreement'
attr(csumbes16$Q74,'Scale') <- 'Agreement'
attr(csumbes16$Q75,'Scale') <- 'Agreement'
attr(csumbes16$Q76,'Scale') <- 'Agreement'
attr(csumbes16$Q77,'Scale') <- 'Agreement'
attr(csumbes16$Q78,'Scale') <- 'Often'
attr(csumbes16$Q79,'Scale') <- 'Often'
attr(csumbes16$Q80,'Scale') <- 'Often'
attr(csumbes16$Q81,'Scale') <- 'Often'
attr(csumbes16$Q82,'Scale') <- 'Often'
attr(csumbes16$Q83,'Scale') <- 'Often'
attr(csumbes16$Q84,'Scale') <- 'Often'
attr(csumbes16$Q85,'Scale') <- 'Often'
attr(csumbes16$Q86,'Scale') <- 'Often'
attr(csumbes16$Q87,'Scale') <- 'Often'
attr(csumbes16$Q88,'Scale') <- 'Often'
attr(csumbes16$Q89,'Scale') <- 'Frequency'
attr(csumbes16$Q89_5OT,'Scale') <- 'Short Answer'
attr(csumbes16$Q89_7OT,'Scale') <- 'Short Answer'
attr(csumbes16$Q90,'Scale') <- 'Agreement'
attr(csumbes16$Q91,'Scale') <- 'Agreement'
attr(csumbes16$Q92,'Scale') <- 'Agreement'
attr(csumbes16$Q93,'Scale') <- 'Agreement'
attr(csumbes16$Q94,'Scale') <- 'Agreement'
attr(csumbes16$Q95_1,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_2,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_3,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_4,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_5,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_6,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_7,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_8,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_9,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_10,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_11,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_12,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_13,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_14,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_15,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_16,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_17,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_18,'Scale') <- 'Multiselect'
attr(csumbes16$Q95_17OT,'Scale') <- 'Short Answer'
attr(csumbes16$Q96_1,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_2,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_3,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_4,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_5,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_6,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_7,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_8,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_9,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_10,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_11,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_12,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_13,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_14,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_15,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_16,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_17,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_18,'Scale') <- 'Multiselect'
attr(csumbes16$Q96_17OT,'Scale') <- 'Short Answer'
attr(csumbes16$Q97,'Scale') <- 'Frequency'
attr(csumbes16$Q98,'Scale') <- 'Frequency'
attr(csumbes16$Q99,'Scale') <- 'Frequency'
attr(csumbes16$Q100,'Scale') <- 'Frequency'
attr(csumbes16$Q101,'Scale') <- 'Qualitative'
attr(csumbes16$Q101_1OT,'Scale') <- 'Qualitative'
attr(csumbes16$Q102,'Scale') <- 'Frequency'
attr(csumbes16$Q103,'Scale') <- 'Frequency'
attr(csumbes16$Q104,'Scale') <- 'Frequency'
attr(csumbes16$Q105,'Scale') <- 'Qualitative'
attr(csumbes16$Q105_1OT,'Scale') <- 'Qualitative'
attr(csumbes16$Q106,'Scale') <- 'Qualitative'
attr(csumbes16$Q106_1OT,'Scale') <- 'Qualitative'
attr(csumbes16$Q107,'Scale') <- 'Qualitative'
attr(csumbes16$Q107_1OT,'Scale') <- 'Qualitative'

#Topic
attr(csumbes16$Q1,'Topic') <- 'Career Services'
attr(csumbes16$Q2,'Topic') <- 'Major Stability'
attr(csumbes16$Q3,'Topic') <- 'Academics'
attr(csumbes16$Q4,'Topic') <- 'Academics'
attr(csumbes16$Q5,'Topic') <- 'Academics'
attr(csumbes16$Q6,'Topic') <- 'Student Affairs/Athletics'
attr(csumbes16$Q7,'Topic') <- 'Academics'
attr(csumbes16$Q8,'Topic') <- 'Campus wide'
attr(csumbes16$Q9,'Topic') <- 'Inclusive Excellence'
attr(csumbes16$Q10,'Topic') <- 'Enrollment Services'
attr(csumbes16$Q11,'Topic') <- 'Inclusive Excellence'
attr(csumbes16$Q12,'Topic') <- 'Student Affairs-Residential Life'
attr(csumbes16$Q13,'Topic') <- 'Inclusive Excellence'
attr(csumbes16$Q14,'Topic') <- 'Sustainability'
attr(csumbes16$Q15,'Topic') <- 'Academics'
attr(csumbes16$Q16,'Topic') <- 'Academics'
attr(csumbes16$Q17,'Topic') <- 'Student Affairs/Athletics'
attr(csumbes16$Q18,'Topic') <- 'Academics'
attr(csumbes16$Q19,'Topic') <- 'Campus wide'
attr(csumbes16$Q20,'Topic') <- 'Inclusive Excellence'
attr(csumbes16$Q21,'Topic') <- 'Enrollment Services'
attr(csumbes16$Q22,'Topic') <- 'Inclusive Excellence'
attr(csumbes16$Q23,'Topic') <- 'Student Affairs-Residential Life'
attr(csumbes16$Q24,'Topic') <- 'Inclusive Excellence'
attr(csumbes16$Q25,'Topic') <- 'Sustainability'
attr(csumbes16$Q26_1,'Topic') <- 'Sustainability'
attr(csumbes16$Q26_2,'Topic') <- 'Sustainability'
attr(csumbes16$Q26_3,'Topic') <- 'Sustainability'
attr(csumbes16$Q26_4,'Topic') <- 'Sustainability'
attr(csumbes16$Q26_5,'Topic') <- 'Sustainability'
attr(csumbes16$Q26_6,'Topic') <- 'Sustainability'
attr(csumbes16$Q26_7,'Topic') <- 'Sustainability'
attr(csumbes16$Q26_8,'Topic') <- 'Sustainability'
attr(csumbes16$Q26_9,'Topic') <- 'Sustainability'
attr(csumbes16$Q26_10,'Topic') <- 'Sustainability'
attr(csumbes16$Q26_11,'Topic') <- 'Sustainability'
attr(csumbes16$Q26_11OT,'Topic') <- 'Sustainability'
attr(csumbes16$Q27,'Topic') <- 'Advising - Academics'
attr(csumbes16$Q28,'Topic') <- 'Academics - Majors'
attr(csumbes16$Q29,'Topic') <- 'Facilities - Transportation'
attr(csumbes16$Q30,'Topic') <- 'Student services-co-curricula'
attr(csumbes16$Q31,'Topic') <- 'Campus wide'
attr(csumbes16$Q32,'Topic') <- 'Campus health-Student Affairs'
attr(csumbes16$Q33,'Topic') <- 'Safety - facilities'
attr(csumbes16$Q34,'Topic') <- 'Overall campus social life'
attr(csumbes16$Q35,'Topic') <- 'Academics-requirements'
attr(csumbes16$Q36,'Topic') <- 'Facilities'
attr(csumbes16$Q37,'Topic') <- 'Internships'
attr(csumbes16$Q38,'Topic') <- 'Facilities-extra curricula'
attr(csumbes16$Q39,'Topic') <- 'Career Services'
attr(csumbes16$Q40,'Topic') <- 'PGCC-Student Services'
attr(csumbes16$Q41,'Topic') <- 'Facilities -Academics'
attr(csumbes16$Q42,'Topic') <- 'Co-curricular-Student Services'
attr(csumbes16$Q43,'Topic') <- 'Library'
attr(csumbes16$Q44,'Topic') <- 'Library'
attr(csumbes16$Q45,'Topic') <- 'Library'
attr(csumbes16$Q46,'Topic') <- 'GE-Academics'
attr(csumbes16$Q47,'Topic') <- 'Majors-Academics'
attr(csumbes16$Q48,'Topic') <- 'Majors-Academics'
attr(csumbes16$Q49,'Topic') <- 'Facilities - housing'
attr(csumbes16$Q50,'Topic') <- 'Facilities-Academics'
attr(csumbes16$Q51,'Topic') <- 'Enrollment management-Registration'
attr(csumbes16$Q52,'Topic') <- 'staff-Enrollment management'
attr(csumbes16$Q53,'Topic') <- 'staff-Enrollment management'
attr(csumbes16$Q54,'Topic') <- 'Enrollment Management'
attr(csumbes16$Q55,'Topic') <- 'Other Staff-overall'
attr(csumbes16$Q56,'Topic') <- 'Other Staff-overall'
attr(csumbes16$Q57,'Topic') <- 'Fellow students support'
attr(csumbes16$Q58,'Topic') <- 'SDR-Student Affairs'
attr(csumbes16$Q59,'Topic') <- 'Inclusive Excellence'
attr(csumbes16$Q60,'Topic') <- 'Tutoring'
attr(csumbes16$Q61,'Topic') <- 'support-students'
attr(csumbes16$Q62,'Topic') <- 'Student Affairs-Athletics'
attr(csumbes16$Q63,'Topic') <- 'Student Affairs-Student Activities'
attr(csumbes16$Q64,'Topic') <- 'Student Affairs-Student Activities'
attr(csumbes16$Q65,'Topic') <- 'Student Affairs-Student Activities'
attr(csumbes16$Q66,'Topic') <- 'Overall satisfaction'
attr(csumbes16$Q67,'Topic') <- 'Faculty'
attr(csumbes16$Q68,'Topic') <- 'Faculty'
attr(csumbes16$Q69,'Topic') <- 'Faculty'
attr(csumbes16$Q70,'Topic') <- 'Faculty'
attr(csumbes16$Q71,'Topic') <- 'Faculty'
attr(csumbes16$Q72,'Topic') <- 'Faculty'
attr(csumbes16$Q73,'Topic') <- 'Faculty'
attr(csumbes16$Q74,'Topic') <- 'Faculty'
attr(csumbes16$Q75,'Topic') <- 'Faculty'
attr(csumbes16$Q76,'Topic') <- 'Faculty'
attr(csumbes16$Q77,'Topic') <- 'Faculty'
attr(csumbes16$Q78,'Topic') <- 'Faculty-Advising'
attr(csumbes16$Q79,'Topic') <- 'Faculty-Academics'
attr(csumbes16$Q80,'Topic') <- 'Faculty'
attr(csumbes16$Q81,'Topic') <- 'Faculty'
attr(csumbes16$Q82,'Topic') <- 'Faculty'
attr(csumbes16$Q83,'Topic') <- 'Faculty-Academics'
attr(csumbes16$Q84,'Topic') <- 'Faculty-Academics'
attr(csumbes16$Q85,'Topic') <- 'Faculty-Academics'
attr(csumbes16$Q86,'Topic') <- 'Faculty'
attr(csumbes16$Q87,'Topic') <- 'Faculty'
attr(csumbes16$Q88,'Topic') <- 'Faculty'
attr(csumbes16$Q89,'Topic') <- 'Advising'
attr(csumbes16$Q89_5OT,'Topic') <- 'Advising'
attr(csumbes16$Q89_7OT,'Topic') <- 'Advising'
attr(csumbes16$Q90,'Topic') <- 'Advising'
attr(csumbes16$Q91,'Topic') <- 'Advising'
attr(csumbes16$Q92,'Topic') <- 'Advising'
attr(csumbes16$Q93,'Topic') <- 'Advising'
attr(csumbes16$Q94,'Topic') <- 'Advising'
attr(csumbes16$Q95_1,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_2,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_3,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_4,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_5,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_6,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_7,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_8,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_9,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_10,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_11,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_12,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_13,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_14,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_15,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_16,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_17,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_18,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q95_17OT,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_1,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_2,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_3,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_4,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_5,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_6,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_7,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_8,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_9,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_10,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_11,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_12,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_13,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_14,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_15,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_16,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_17,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_18,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q96_17OT,'Topic') <- 'ASAP Tutoring Center (Cooperative Learning Center)'
attr(csumbes16$Q97,'Topic') <- 'Housing-Retention'
attr(csumbes16$Q98,'Topic') <- 'Retention'
attr(csumbes16$Q99,'Topic') <- 'Retention'
attr(csumbes16$Q100,'Topic') <- 'Retention'
attr(csumbes16$Q101,'Topic') <- 'Retention'
attr(csumbes16$Q101_1OT,'Topic') <- 'Retention'
attr(csumbes16$Q102,'Topic') <- 'Overall satisfaction'
attr(csumbes16$Q103,'Topic') <- 'Overall satisfaction'
attr(csumbes16$Q104,'Topic') <- 'Overall satisfaction'
attr(csumbes16$Q105,'Topic') <- 'Campus wide'
attr(csumbes16$Q105_1OT,'Topic') <- 'Campus wide'
attr(csumbes16$Q106,'Topic') <- 'Campus wide'
attr(csumbes16$Q106_1OT,'Topic') <- 'Campus wide'
attr(csumbes16$Q107,'Topic') <- 'Campus wide'
attr(csumbes16$Q107_1OT,'Topic') <- 'Campus wide'




save(csumbes16,file=targetfullname)

#write to Excel
if (!require(openxlsx)){
  install.packages("openxlsx")
}
require(openxlsx)
if (!require(Rtools)){
  install.packages("Rtools")
}
require(Rtools)
excel_data <- paste(targetfilepath,"csumbes16.xlsx",sep = "")
wbout <- createWorkbook()
addWorksheet(wbout,"CSUMBES16")
setColWidths(wbout,sheet = 1)
writeData(wbout,sheet=1,x=csumbes16, colNames = T, borders = "all")
saveWorkbook(wbout,file = excel_data, overwrite = T)   
rm(wbout)

#write to SPSS
if(!require(foreign)){
  install.packages("foreign")
}
require(foreign)
spss_data <- paste(targetfilepath,"csumbes16.sav",sep = "")
spss_syntax <- paste(targetfilepath,"csumbes16.sps",sep = "")
write.foreign(csumbes16, datafile = spss_data, codefile = spss_syntax, package = "SPSS")

#select the drawing winners and write list to Excel
winners <- data.frame(subset(csumbes16,CASENUM <= 3500, select = c(CASENUM, DateTime, DFirstName, DLastName, DEmail, DEmplid, DOtterID)))
set.seed(42)
winners <- winners[sample(nrow(winners), size=20, replace = F), ]
winners <- winners[order(winners$DLastName,winners$DFirstName, na.last = NA),]
winners <- rename.vars(winners,from = "DFirstName",to = "First_Name")
winners <- rename.vars(winners,from = "DLastName",to = "Last_Name")
winners <- rename.vars(winners,from = "DEmail",to = "Email")
winners <- rename.vars(winners,from = "DEmplid",to = "Emplid")
winners <- rename.vars(winners,from = "DOtterID",to = "OtterID")
FixEmplid <- function(x){tempID <- x;ID <- sprintf("%09.0f",tempID);return(ID)}
winners$Emplid <- FixEmplid(winners$Emplid)
if (!require(openxlsx)){
  install.packages("openxlsx")
}
require(openxlsx)
hs <- createStyle(textDecoration = "BOLD", fontColour = "#FFFFFF", fontSize=12,
                  fontName="Arial Narrow", fgFill = "#4F80BD", borderStyle = "thick")
wb <- createWorkbook()
addWorksheet(wb,"CSUMBES Winners")
setColWidths(wb,sheet = 1,cols = 1:dim(winners)[2],widths = 30)
writeData(wb,sheet=1,x=winners,headerStyle = hs, colNames = T, borders = "all")
saveWorkbook(wb,file = "winners.xlsx", overwrite = T)

