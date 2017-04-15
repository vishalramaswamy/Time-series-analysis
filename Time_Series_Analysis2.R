require(fpp)
data(books)
plot(books, main = "Data set books")
alpha = seq(0.01, 0.99, 0.01)
SSE = NA
for(i in seq_along(alpha)) {
  fcast = ses(books[,"Hardcover"], alpha = alpha[i], initial = "simple")
  SSE[i] = sum((books[,"Hardcover"] - fcast$fitted)^2)
}
plot(alpha, SSE, type = "l")
fcastPaperSimple = ses(books[,"Hardcover"], 
                       initial = "simple", 
                       h = 4)
fcastPaperSimple$model$par[1]
plot(fcastPaperSimple)

fcastPaperOpt = ses(books[,"Hardcover"], 
                    initial = "optimal", 
                    h = 4)
fcastPaperOpt$model$par[1]
plot(fcastPaperOpt)
as.numeric((fcastPaperOpt$mean - 
              fcastPaperSimple$mean)/fcastPaperSimple$mean) * 100
