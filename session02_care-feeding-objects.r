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

(y <- 1:3)
(z <- 3:7)
y + z
x <- c(1, 4, 9)
str(x)
pi
x  <- c("cabbage", pi, 0.3, TRUE)
str(x)
x  <- list("cabbage", pi, 0.3, TRUE)
str(x)
x <- -3:3
str(x)
x < 0
set.seed(1)
(x <- round(rnorm(8), 2))
names(x) <- letters[seq_along(x)]
x
x[c(3,5,8)]
x[c("a", 'd')]
x[x>0]
which(x < 0)

## Indexing challenge
# Get every other element of x...
x[seq(length(x)) %% 2 == 0]
x[c(1,3,5,7)]
x[seq(2, length(x), by=2)]
x[c(FALSE, TRUE)]

month.abb
month.name

(x <- cbind(month.abb, month.name))
typeof(x)
str(x)
mode(x)
str(data.frame(x))
(x <- rbind(month.abb, month.name))

(x <- matrix(1:10, nrow=5))

(x <- data.frame(month.num = 1:12, month.abb, month.name))
str(x)
(x <- data.frame(month.num = 1:12, I(month.abb), I(month.name)))
str(x)
x[2,2]
library(ggplot2)
