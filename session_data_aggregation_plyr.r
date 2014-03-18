library(ggplot2)
library(plyr)

gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)

tDat <- with(gDat, 
             cbind(cambodia = lifeExp[country == "Cambodia"], 
                   canada = lifeExp[country == "Canada"], 
                   rwanda = lifeExp[country == "Rwanda"]))
rownames(tDat) <- with(gDat, year[country == "Canada"])
str(tDat)
tDat

apply(tDat, 1, mean)
apply(tDat, 1, median)
rowMeans(tDat)
# Which index has the lowest
which.min(tDat[1,])
apply(tDat, 1, which.min)
colnames(tDat)[apply(tDat, 1, which.min)]
apply(tDat, 2, summary)
apply(tDat, 2, quantile, probs=seq(0, 1, 0.10))

## Challenge: Use Apply to compute the range of lifeExp for each country
## where range is min and max
apply(tDat, 2, range)
apply(tDat, 2, function(x) { c(min=min(x), max=max(x))})

## aggregate
aggregate(lifeExp ~ continent, gDat, FUN=mean)
lifeExpByYearAndContinent <- aggregate(lifeExp ~ year * continent, gDat, FUN=mean)

plot <- ggplot(lifeExpByYearAndContinent, aes(x=year, y=lifeExp, color=continent))
plot + geom_line()

aggregate(country ~ continent, gDat, function(x) { length(unique(x))})
nlevels(gDat$country)
sum(aggregate(country ~ continent, gDat, function(x) { length(unique(x))})$country)

## plyr

plot <- ggplot(subset(gDat, country == "Zimbabwe"), 
               aes(x=year, y=lifeExp))
plot + geom_point(size=5) + geom_smooth(se = FALSE, method="lm")
lm(lifeExp ~ year, gDat, subset=country == "Zimbabwe")

(yearMin <- min(gDat$year))
lm(lifeExp ~ I(year - yearMin), gDat, subset=country == "Zimbabwe")

