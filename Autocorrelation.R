acf(rnorm(30))
acf(rnorm(300))
acf(rnorm(1000))
#Similarity
#all the autocorrelation lines are within the 95% confidence lines and so it is a white noise
#Difference
#for rnorm(30) the critical value is around +/- 0.4
#for rnorm(300) the critical value is around +/- 0.15
#for rnorm(1000) the critical value is around +/- 0.1
#so even though all the auto correlation lines lie inside the critical value lines, the critical value decreases as the value increases from 30 to 300 and to 1000
