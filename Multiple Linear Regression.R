#Importing the Startups Company excel file
data1<-read_excel("C:\\Users\\HAWA ABDALLAH\\Documents\\Startups Company.xlsx")
data1
attach(data1)

#Overview of the dataset

str(data1)

#Checking for missing values

is.na(data1)
par(mfrow=c(3,3))

#Linearity assumption

plot(`R.D. Spend`,Profit,xlab = "R.D. Spend",ylab = "Profit")
plot(log(Administration),Profit,xlab = "Administration",ylab = "Profit")
plot(`Marketing Spend`,Profit,xlab = "Marketing Spend",ylab = "Profit")

#Independence of observations

cor(`R.D. Spend`,Administration)
cor(`R.D. Spend`,`Marketing Spend`)
cor(Administration,`Marketing Spend`)

#Normality assumption

hist(Profit)

#Performing thr regression analysis

fit<-lm(Profit~`R.D. Spend`+Administration+`Marketing Spend`,data=data1)
fit

#Displaying the output of the model
summary(fit)

#Homoskedasticity


plot(fit)

#Confidence level

confint(fit)

#Coefficients of the model

coefficients(fit)

#Analysis of variance

anova(fit)
