#Comparing the ACF and PACF of an AR, MA, and ARMA Processes
#Justin S. Eloriaga

install.packages("tseries")
install.packages("forecast")
install.packages("tidyverse")

library(tseries)
library(forecast)
library(tidyverse)

#Simulating the Series
AR1 <- list(order = c(1,0,0), ar = 0.5, sd = 0.01)
AR1 <- arima.sim(n = 10000, model = AR1)

MA1 <- list(order = c(0,0,1), ma = 0.7, sd = 0.01)
MA1 <- arima.sim(n = 10000, model = MA1)

ARMA11 <- list(order = c(1,0,1), ar = 0.5, ma = 0.5, sd = 0.01)
ARMA11 <- arima.sim(n = 10000, model = ARMA11)

#Graphing the Three Series

combo <- cbind(AR1,MA1,ARMA11)
autoplot(combo, facets = TRUE) + ggtitle("AR, MA, and ARMA Time Series Plots")

par(mfrow = c(1,2))

#Comparing their ACF and PACF

#For the AR
acf(AR1) #Geometric Decay
pacf(AR1) #Cutoff after first lag

#For the MA
acf(MA1) #Cutoff after first lag
pacf(MA1) #Geometric Decay

#For the ARMA
acf(ARMA11) #Geometric Decay
pacf(ARMA11) #Geometric Decay

#Showing Everything in One Graph
par(mfrow = c(3,3))
plot.ts(AR1)
acf(AR1) #Geometric Decay
pacf(AR1) #Cutoff after first lag
plot.ts(MA1)
acf(MA1) #Cutoff after first lag
pacf(MA1) #Geometric Decay
plot(ARMA11)
acf(ARMA11) #Geometric Decay
pacf(ARMA11) #Geometric Decay

