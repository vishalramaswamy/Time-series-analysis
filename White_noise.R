install.packages("fpp")
require(fpp)
data(pigs)
acf(pigs,lag.max = 1000)
#majority autocorrelation lines are beyond the critical lines, so not white noise
print("Not a White Noise")
plot(pigs)
# as there is no seasonality in the pigs data i use naive baseline method
res<-residuals(naive(pigs))
Box.test(res,lag=10,fitdf=0)
Box.test(res,lag=10,fitdf=0,type = "Lj")
#p-value< 0.05,so not a white noise
print("Not a White Noise")
