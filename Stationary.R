require(fpp)
require(fma)
data("usnetelec")
plot(usnetelec)
#From the plot we can see that only mean needs to be stabilized to make the data stationary
acf(usnetelec)
#From the acf plot we can see that the data is not seasonal and so we apply ndiffs() to find the order of differencing
print(ndiffs(usnetelec))
#ndiff() gives the value 1 and so this data needs 1 order differencing
usnetelec=diff(usnetelec)
acf(usnetelec,lag.max = 1000)
#The acf plot suggests that the first differencing of the data set has made it stationary.
plot(usnetelec)



data("usgdp")
plot(usgdp)
plot(stl(usgdp,12))
#From the plot we can see that both mean and variance needs to be stabilized to make the data stationary
acf(usgdp)
#From the acf plot we can see that the data is not seasonal and so we apply ndiffs() to find the order of differencing
print(ndiffs(usgdp))
#ndiff() gives the value 2 and so this data needs 2 order differencing
lambda=BoxCox.lambda(usgdp)
lambda
usgdp=BoxCox(usgdp,lambda)
usgdp=diff(diff((usgdp)))
acf(usgdp,lag.max = 1000)
#The acf plot suggests that the second differencing and BoxCox of the data set has made it stationary.
plot(usgdp)




data("mcopper")
plot(mcopper)
#From the plot we can see that both mean and variance needs to be stabilized to make the data stationary
acf(mcopper)
#From the acf plot we can see that the data is not seasonal and so we apply ndiffs() to find the order of differencing
print(ndiffs(mcopper))
#ndiff() gives the value 1 and so this data needs 1 order differencing
lambda=BoxCox.lambda(mcopper)
lambda
acf(diff(BoxCox(mcopper,lambda)))
#The acf plot suggests that the first differencing and taking BoxCox of the data set has made it stationary.
plot(diff(log(mcopper)))





data("enplanements")
plot(enplanements)
#From the plot we can see that both mean and variance needs to be stabilized to make the data stationary
acf(enplanements,lag.max = 1000)
#From the acf plot we can see that the data is seasonal and so we apply nsdiffs() to find the order of seasonal differencing and then apply ndiffs to find the order of differencing
lambda=BoxCox.lambda(enplanements)
lambda
enplanements=BoxCox(enplanements,lambda)
print(nsdiffs(enplanements))
#nsdiff() gives the value 1 and so this data needs 1 order seasonal differencing
enplanements=diff(enplanements,lag=frequency(enplanements),differences = 1)
print(ndiffs(enplanements))
#ndiff() gives the value 1 and so this data needs 1 order differencing
enplanements=diff(enplanements)
#lambda=BoxCox.lambda(enplanements)
#BoxCox(enplanements,lambda)
acf(enplanements)
#The acf plot suggests that the first differencing,seasonal differencing and BoxCox of the data set has made it stationary.
plot(enplanements)
#plot(BoxCox(enplanements,lambda))




data("visitors")
plot(visitors)
#From the plot we can see that both mean and variance needs to be stabilized to make the data stationary
acf(visitors)
lambda=BoxCox.lambda(visitors)
lambda
visitors=BoxCox(visitors,lambda)
#From the acf plot we can see that the data is seasonal and so we apply nsdiffs() to find the order of seasonal differencing and then apply ndiffs to find the order of differencing
print(nsdiffs(visitors))
#nsdiff() gives the value 1 and so this data needs 1 order seasonal differencing
visitors=diff(visitors,lag=frequency(visitors),differences = 1)
print(ndiffs(visitors))
#ndiff() gives the value 1 and so this data needs 1 order differencing
visitors=diff(visitors)
acf(visitors)
#The acf plot suggests that the first differencing,seasonal differencing and BoxCox of the data set has made it stationary.
plot(visitors)
