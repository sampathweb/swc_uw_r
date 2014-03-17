a <- 2
b <- -3
`This is a test
sigSq  <- 0.5
x <- runif(40)
y <- a + b*x + rnorm(40, sd=sqrt(sigSq))
plot(x, y)
abline(a, b)
dev.print(png, "toylineplot.png", width=480)
