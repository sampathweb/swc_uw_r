library(ggplot2)

gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)

p <- ggplot(gDat, aes(x=gdpPercap, y=lifeExp))
p + geom_point()

p + geom_point() + scale_x_log10()

p <- p + scale_x_log10()
p + geom_point()

p + scale_x_log10() + geom_point()

p + geom_smooth(lwd=3, se=FALSE) + geom_point(alpha = 1/3, size=3) 

p + geom_point(alpha = 1/2, size=3) + geom_smooth(lwd=3, se=FALSE, method="lm") 

ggplot(gDat, aes(x=continent, y=lifeExp)) + geom_point()

ggplot(gDat, aes(x=continent, y=lifeExp)) + geom_jitter(position=position_jitter(width=0.1), alpha=1/4)

ggplot(gDat, aes(x=continent, y=lifeExp)) + geom_boxplot() + geom_jitter(position=position_jitter(width=0.1), alpha=1/4)

ggplot(gDat, aes(x=lifeExp)) + geom_histogram()

ggplot(gDat, aes(x=lifeExp)) + geom_density()

