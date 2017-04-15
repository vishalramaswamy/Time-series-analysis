require(fpp) 
plot(dole, xlab = "Time", ylab = "No. Unemployed",
     main = "Monthly Unemployed Benefit Usage, Astralia (01/56-07/92)")
lambda = BoxCox.lambda(dole)
plot(BoxCox(dole, lambda), xlab = "Time", 
     ylab = paste("BoxCox(# people,", round(lambda, 2), ")"))

plot(usdeaths)
#usdeaths does not require this transformation as it has stable variance
#lambda=BoxCox.lambda(usdeaths)
#plot(BoxCox(usdeaths,lambda))
#bricksq requires transformation
plot(bricksq)
lambda=BoxCox.lambda(bricksq)
plot(BoxCox(bricksq,lambda))
plot(stl(BoxCox(bricksq,lambda),s.window=15)) 
