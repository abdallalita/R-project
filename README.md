# Table of Contents
1. ## Multiple Linear Regression
      * [Description](#Description-1)
      * [Assumptions](#Assumptions)
      * [Regression Analysis](#Regression-Analysis)     
2. ## Financial Time Series & Calculating Value at risk
      * [Description](#Description-2)
      * [Assumptions](#Assumptions)
      * [Residuals](#Residuals)
      * [VaR Under Risk Metrics](#VaR-Under-Risk-Metrics)
      * [VaR Under Econometrics](#VaR-Under-Econometrics)
 ---          
### Description 1
#

Multiple Linear Regression (MLR) is a statistical process for estimating the relationship between a dependent variable and one or more independent variables. In my case I used MLR to investigate the impact or influence of the amount of money spent on three departments (R.D.Spend,Administration, Marketing) or the independent variables on the overall Profit or dependent variable for a certain company(Startups). I also predicted the future Profit using certain amounts spent on the three departments.

---
### Assumptions
#
I first checked the assumptions of MLR to ensure that they are met.
- Linearity - Plotted a scatter plot of Profit against each of the independent variables.
- Multicollinearirty - used the `cor()` function to check for autocorrelation between the independent variables.
- Normality - checked using the `hist()` function.
- Homoskedasticity - checked after performing the regression analysis,used the diagnostic plots.
---
### Regression Analysis
#
- Fitted a regression model of Profit against the Independent variables using the `lm()` function.
- Residual Error - the average error for the model which was less.
- Multiple R Squared - shows the variability in Profit that can be explained by the independent variables which was high.
- F-Statistic - checks for the overall adequacy of the model. The pvalue was less than alpha=0.05,hence rejected the null hypothesis and concluded than our model was fit or adequate.
- t-Statistic - only the pvalue of Marketing was less than 0.05, hence it was not significant or useful in prediction.
- Annova - includes the F-statistic needed to gauge the model's statistical significance.
---
### Description 2
#
Financial Time Series (FTS) refers to the analysis of financial data overtime and include; company sales, profits, interest rates fluctuations, costs and so on.
The main objectives of FTS include;
- To understand how prices behave (identify trends and patterns).
- To Forecast (predict future sales, profits).
- To use the knowledge about prices or sales behaviour to reduce risk and costs and make better decisions.
- To build and develop models to describe the patterns and trends in the data.
I used Amazon historical stock prices to perform the analysis. The data was imported from [visit website](https://finance.yahoo.com/ "yahoofinance").
An investment worth 1Million was assumed for both a long and short position.
---
### Assumptions
#
I first analyzed the stylized facts for FTS
- Non stationary assumption of the stock prices.
- Stationary and Volatility clustering assumption of return series.
- Thick tailed distribution assumption.
- Autocorrelation assumption for the return series.
- Autocorrelation assumption for the squared return series.
---
### Residuals
#
Arch effects for the squared residuals - tested so as to build a volatility model.
---
### VaR Under Risk Metrics
#
- Fitted an iGARCH(1,1) model.
- Extracted the last return and volatility value.
- Obtained the 1-step ahead volatility forecast form the model.
- Calculated Value at Risk  at 5% probability.
- Calculated Value at Risk over 30-day horrizon.
---
### VaR Under Econometrics
#
- Fitted a garch(1,1) model.
- Obtained the last volatility and residual value
- Obtained the 1-step ahead volatility forecast form the model.
- Calculated Value at Risk  at 5% probability for both long and short position.
- Calculated Value at Risk over 30-day horrizon.





