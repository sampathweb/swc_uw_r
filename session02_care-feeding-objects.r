# gdURL <- "http://tiny.cc/gapminder"
# gDat  <- read.delim(gdURL)

gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)
head(gDat)
tail(gDat)
names(gDat)
dim(gDat)
nrow(gDat)
ncol(gDat)
rownames(gDat)
head(rownames(gDat))
length(gDat)
summary(gDat)

gDat$lifeExp
summary(gDat["lifeExp"])
hist(gDat$lifeExp)

class(gDat$country) # Tell you it's a Factor
str(gDat)
class(gDat$country)
levels(gDat$country)
nlevels(gDat$country)
table(gDat$country)

subset(gDat, subset = country %in% c("Cambodia", "Afghanistan"))
subset(gDat, subset = year == 1952, select = c(year, country))

## Get data for which life expectancy is less than 32 years
## assign it to an object
## How many rows does that object has, how many observations per continent?
lifeexp_df <- subset(gDat, subset=lifeExp < 32)
nrow(lifeexp_df)
levels(lifeexp_df$continent)
length(levels(lifeexp_df$continent))
lifeexp_df
summary(lifeexp_df)
str(lifeexp_df)
table(lifeexp_df$continent)
plot(lifeExp ~ year, gDat)
plot(lifeExp ~ year, gDat, subset=country == "Rwanda")
lm(lifeExp ~ year, gDat, subset=country == "Rwanda")

with(gDat, mean(lifeExp))
with(subset(gDat, country=="Cambodia"), cor(lifeExp, gdpPercap))

x <- 3 * 4
is.vector(x)
length(x)
x[1]
x[2]
x[0]
x[5] <- 10
x
x <- 1:4
x^2

round(rnorm(3, mean=c(0, 100, 1000000)), 2)
