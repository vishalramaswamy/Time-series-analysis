install.packages("fpp")
require(fpp)
data("plastics")
plot(plastics)
#1.upward linear trend with additive seasonality
fit <- decompose(plastics, type="multiplicative")
plot(fit)
#2. yes
#3. yes they become non-linear at time-stamp 5
#4.
seasAdj <- seasadj(fit)
plot(seasAdj)
#5.
new_plastics=plastics
new_plastics[31]=new_plastics[31]+500
plot(new_plastics)
new_fit <- decompose(new_plastics, type="multiplicative")
plot(new_fit)
new_seasAdj <- seasadj(new_fit)
plot(new_seasAdj)
#the trend in the middle increases and then decreases, the seasonality component changes  at the middle
#6.
end_plastics=plastics
end_plastics[60]=end_plastics[60]+500
plot(end_plastics)
end_fit <- decompose(end_plastics, type="multiplicative")
plot(end_fit)
end_seasAdj <- seasadj(end_fit)
plot(end_seasAdj)
#the trend in the increases in the end after the actual decrease, the seasonality remains the same

#7.
require(fpp) 
fit <- decompose(plastics, type="multiplicative")# this decomposes the plot into trend, seasonality and random components of the plastics dataset
plot(fit)
seasAdj <- seasadj(fit)#performs removal of seasonal component and returns seasonally adjusted data
plot(seasAdj)
driftFit = rwf(seasAdj, drift=TRUE, h=24)# this uses the baseline forecasting drift method which is the forecast based on last value plus the average change. h=24 is used to forecast for 2 years
plot(driftFit)
plot(driftFit, ylim = c(500, 2200))
#driftfit yields the mean forcast as a time series and the upper and lower prediction intervals of 80% and 95% confidence levels for the period of 2 years.
#fit yield the original, seasonal, trend and random part of the time series and also yield the figure. the figure is the estimated seasonal figure.
lines(driftFit$mean*fit$figure, col = "green", lwd = 2)# so  plotting the product of driftfit$mean and fit$figure gives the expected average data time series for the next 2 years
lines(driftFit$upper[,2]*fit$figure, col="red")# so  plotting the product of driftfit$upper[,2] and fit$figure gives the expected upper data time series of 95% confidence level for the next 2 years
lines(driftFit$lower[,2]*fit$figure, col="red")# so  plotting the product of driftfit$lower[,2] and fit$figure gives the expected lower data time series of 95% confidence level for the next 2 years
lines(plastics, col = "green", lwd = 2)#this plots the plastics data over the 5 years 
