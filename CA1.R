#dataframe setting
Student<-c(1:17)
No_visual_aids<-c(50,60,58,72,36,51,49,49,25,52,41,32,58,39,25,40,61)
With_visual_aids<-c(58,70,60,73,40,63,54,60,29,57,66,37,50,48,80,65,70)
studentdata<- data.frame(Student,No_visual_aids,With_visual_aids)
studentdata
summary(studentdata)
View(studentdata)
str(studentdata)
#Null Hypothesis (H0): There is no difference in the mean scores between students who received no visual aids and those who received visual aids.
#Alternative Hypothesis (H1): There is a difference in the mean scores between the two groups.
# Summary statistics for quality scores without visual aids
summary(studentdata$No_visual_aids)

# Summary statistics for quality scores with visual aids
summary(studentdata$With_visual_aids)
#normality test
shapiro.test(studentdata$No_visual_aids)
shapiro.test(studentdata$With_visual_aids)
#qqplot for this data
windows(20,16)
par(mfrow = c(1, 2))
qqnorm(studentdata$No_visual_aids)
qqline(studentdata$No_visual_aids, col = "red")
title("Q-Q Plot for No_visual_aids")

# Q-Q plot for With_visual_aids
qqnorm(studentdata$With_visual_aids)
qqline(studentdata$With_visual_aids, col = "blue")
title("Q-Q Plot for With_visual_aids")

# Boxplot to compare quality scores with and without visual aids
windows(20,16)
boxplot(studentdata[,2:3], main="Quality Scores with and without Visual Aids", 
        xlab="Visual Aids", ylab="Quality Score", names=c("Without Aids", "With Aids"))
# Paired t-test
t_test <- t.test(studentdata$No_visual_aids, studentdata$With_visual_aids, paired=TRUE)
t_test
