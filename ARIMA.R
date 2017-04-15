install.packages("fma")
install.packages("fpp")
require(fpp)
require(fma)
data("elecequip")
plot(elecequip)
#there is a sudden hike during 2001-2002 and a sudden drop during 2008-2009
plot(stl(elecequip,s.window = "periodic"))
#yes data is seasonal
seasAdj=seasadj(stl(elecequip,s.window = "periodic"))
plot(seasAdj)
#Apart from the sudden hike an drop mentioned above, there is nothing unusual and there appears to be no need to do any data adjustments.
#There is no evidence of changing variance, so we will not do a Box-Cox transformation.
acf(seasAdj)
#The data is clearly non-stationary. Consequently, we will take a first difference of the data.
diff_seasAdj=diff(seasAdj)
plot(diff_seasAdj)
acf(diff_seasAdj)
#These look stationary.
fit<-auto.arima(diff_seasAdj)
summary(fit)
#ARIMA(3,0,1) p=3, d=0, q=1 AICc = 978.49
arima4=Arima(diff_seasAdj,order = c(4,0,0))
arima3=Arima(diff_seasAdj,order = c(3,0,0))
arima2=Arima(diff_seasAdj,order = c(2,0,0))
arima4
#arima with order (4,0,0) has AICc value 981.36 
arima3
#arima with order (4,0,0) has AICc value 981.66 
arima2
#arima with order (4,0,0) has AICc value 998.87
#arima model with p=4, d=0, q=0 gives the smallest AICc value and so is the best
Acf(residuals(arima4))
Box.test(residuals(arima4),lag=24,fitdf=4)
Box.test(residuals(arima4),lag=24,fitdf=4,type="Ljung")
#yes residuals are white noise as all the auto correlation lines are within the 2 blue lines which are the confidence intervals and also the p-value obtained from the box test are also large
plot(forecast(arima4))
