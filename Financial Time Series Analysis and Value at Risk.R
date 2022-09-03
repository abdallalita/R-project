#Importing Amazon stock prices from yahoo finance
getSymbols("AMZN",from="2015-01-01",to="2022-01-01")

#Checking the dimension of the dataset
dim(AMZN)

#Checking the first few observations
head(AMZN)

#Non stationary assumption of the stock prices
chartSeries(AMZN)

#CAlculating the return series of the stock
AMZN.rtn=diff(log(AMZN$AMZN.Adjusted))[-1]
AMZN.rtn

#Stationary and Volatility clustering assumption of return series
chartSeries(AMZN.rtn)
t.test(AMZN.rtn$AMZN)

#Thick tailed distribution assumption
basicStats(AMZN.rtn)

#Normality test
normalTest(AMZN.rtn,method="jb")
hist(AMZN.rtn)

#Autocorrelation assumption for the return series
Box.test(AMZN.rtn,lag=12,type ="Ljung")

#Vizualization using confidence bands
par(mfrow=c(3,3))
acf(AMZN.rtn)
pacf(AMZN.rtn)

#Autocorrelation assumption for the squared return series
Box.test(AMZN.rtn^2,lag=12,type="Ljung")

#Vizualization using the confidence bands
acf(AMZN.rtn^2)
pacf(AMZN.rtn^2)

#Extracting the residuals
a_t=AMZN.rtn-mean(AMZN.rtn)
a_t

#Arch effects for the squared residuals
Box.test(a_t^2,lag=12,type="Ljung")


#VALUE AT RISK UNDER THE RISK METRICS APPROACH
#Fitting iGARCH(1,1)
spec=ugarchspec(variance.model=list(model="iGARCH",garchOrder=c(1,1)),
                mean.model=list(armaOrder=c(0,0),include.mean=FALSE),
                distribution.model="norm",fixed.pars=list(Omega=0))
fit=ugarchfit(spec,data=AMZN.rtn)
fit

#Obtaining the last retrun value
tail(AMZN.rtn)

#Obtaining the last volatility value
tail(sigma(fit))


#VALUE AT RISK UNDER THE RISK METRICS APPROACH
#Fitting garch(1,1)
m1=garchFit(~1 + garch(1,1),data=AMZN.rtn,trace=F)
m1

#Obtaining the last volatility value
tail(volatility(m1))

#Obtaining the last residual value
tail(residuals(m1))
