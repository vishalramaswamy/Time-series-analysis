install.packages("fpp")
require(fpp)
data(hsales)
plot(hsales, xlab = "Time", 
     ylab = "Sales", 
     main = "Monthly house sales in US (Jan/1973-Nov/1995)")

train = window(hsales, end = c(1993,12))
test = window(hsales, start = c(1994,1))
#randomwalk model
rwfForecast = rwf(train, h = 23)$mean
accuracy(rwfForecast, test)
#average model
averageForecast = meanf(train, h = 23)$mean
accuracy(averageForecast,test)
#seasonal naive model
seasonalNaiveForecast = snaive(train, h = 23)$mean
accuracy(seasonalNaiveForecast,test)
#drift model
driftForecast = rwf(train,drift = TRUE, h = 23)$mean
accuracy(driftForecast,test)

