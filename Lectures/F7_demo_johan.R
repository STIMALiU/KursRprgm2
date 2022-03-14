## === qplot() === ##

library(ggplot2)
data(mpg)
head(mpg)

qplot(x = mpg$displ, y = mpg$hwy)
qplot(x = displ, y = hwy, data = mpg)
qplot(x = displ, y = hwy, data = mpg, geom = "point", xlab = "x var", ylab = "y var")

# Jämför med
plot(x = mpg$displ, y = mpg$hwy, xlab = "x var", ylab = "y var")

qplot(x = displ, y = hwy, data = mpg, facets = .~drv)
qplot(x = displ, y = hwy, data = mpg, facets = drv~.)

## == ggplot() == ##

class(mpg)

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

# med spara objektet

p <- ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
print(p)

# Kolla
class(p)
str(p)
summary(p)

# Lägg till regressionslinje
p + geom_smooth(method = "lm", se=FALSE)

# dela upp i subplots
p + facet_grid(.~drv)

p + geom_smooth(method = "lm", se=FALSE) + facet_grid(.~drv)

p + facet_grid(.~drv) + geom_smooth(method = "lm", se=FALSE)

p + geom_smooth(method = "lm", se=FALSE) + facet_grid(drv~.)

# Fler subplottar
p + facet_grid(fl~drv)

# Kan specificera rader och kolumner
p + facet_grid(rows = vars(drv), cols = vars(fl))

# Alternativ med facet_wrap
?facet_wrap
p + facet_wrap(.~drv)
p + facet_wrap(facets = vars(drv))
p + facet_wrap(drv~.)

# jämför
p + facet_grid(cyl ~ drv)
p + facet_wrap(cyl ~ drv)
p + facet_wrap(facets = vars(cyl,drv))

# Fler aesthetics

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(color = "blue", shape = 3) + 
  geom_smooth(method = "lm")

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(color = 5) + 
  geom_smooth(method = "lm")

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(color = "red", size = 3, alpha = 0.5) + 
  geom_smooth(method = "lm")

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(color = "red", shape = 1, size = 2, alpha = 0.3) + 
  geom_smooth(method = "lm", color = 8)

# Färg och form som aesthetic
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv), size = 3)

ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv), size = 3) + 
  scale_color_manual(values = c("blue","green","yellow"))

data("trees")
head(trees)

ggplot(data = trees, aes(x = Girth, y = Volume)) + 
  geom_point(aes(color=Height))

ggplot(data = trees, aes(x = Girth, y = Volume)) + 
  geom_point(aes(color=Height)) +
  xlab("Omkrets") +
  ylab("Volym") +
  ggtitle("Plot")

## == overplotting == ##

no_obs <- 100
set.seed(1)
x <- rnorm(n = no_obs, mean = 10, sd = 3)
y <- .5*x + rnorm(n = no_obs, mean = 0, sd = .5)
df <- data.frame(x=x,y=y)
ggplot(data = df, aes(x = x, y = y)) + geom_point()

no_obs <- 1000
set.seed(1)
x <- rnorm(n = no_obs, mean = 10, sd = 3)
y <- .5*x + rnorm(n = no_obs, mean = 0, sd = .5)
df <- data.frame(x=x,y=y)
ggplot(data = df, aes(x = x, y = y)) + geom_point()

no_obs <- 10000
set.seed(1)
x <- rnorm(n = no_obs, mean = 10, sd = 3)
y <- .5*x + rnorm(n = no_obs, mean = 0, sd = .5)
df <- data.frame(x=x,y=y)
ggplot(data = df, aes(x = x, y = y)) + geom_point()

# transparens
ggplot(data = df, aes(x = x, y = y)) + geom_point(alpha = 0.2)

# mindre storlek
ggplot(data = df, aes(x = x, y = y)) + geom_point(size = 0.2)

# kombinera
ggplot(data = df, aes(x = x, y = y)) + geom_point(size = 0.2, alpha = 0.4)

## == Linjegrafer == ##
library(ggthemes)

data("Nile")
summary(Nile)

Nile2 <- as.data.frame(Nile)
class(Nile2)
colnames(Nile2) <- "level"
Nile2$years <- 1871:1970
Nile2$period <- "- 1900"
Nile2$period[Nile2$years >= 1900] <- "1900 - 1928"
Nile2$period[Nile2$years >= 1929] <- "1929 - 1946"
Nile2$period[Nile2$years >= 1947] <- "1947 - "
Nile2$period <- as.factor(Nile2$period)
table(Nile2$period)
head(Nile2)

ggplot(data=Nile2) + aes(x = years, y = level) + geom_line()

ggplot(data = Nile2) + aes(x = years, y = level) +
  geom_line(aes(color = period)) + scale_color_colorblind()

ggplot(data = Nile2) + aes(x = years, y = level) +
  geom_line(aes(linetype= period))

# Teman
ggplot(data = Nile2) + aes(x = years, y = level) +
  geom_line(aes(linetype= period)) +
  theme_bw()

ggplot(data = Nile2) + aes(x = years, y = level) +
  geom_line(aes(linetype= period)) +
  theme_dark()

ggplot(data = Nile2) + aes(x = years, y = level) +
  geom_line(aes(linetype= period)) +
  theme_excel()

## == Histogram == ##
data("chickwts")
head(chickwts)

a <- ggplot(data = chickwts, aes(x = weight))
a + geom_histogram()

a + geom_histogram() + facet_grid(.~feed)

## == Boxplot == ##

ggplot(data =chickwts, aes(y = weight)) + geom_boxplot()

ggplot(data = chickwts, aes(x = feed, y = weight)) + geom_boxplot()

## == Statistik == ##

data("trees")
head(trees)
summary(trees)

var(trees$Girth)
var(trees$Height)

cov(trees$Girth,trees$Height)
cov(trees)

?cor.test

cor.test(x = trees$Girth, y = trees$Height)
a <- cor.test(x = trees$Girth, y = trees$Height)
str(a)
a
a$statistic
a$conf.int

b <- t.test(x = trees$Height, alternative = "two.sided", mu = 73)
b
b$statistic
b$p.value

b <- t.test(x = trees$Height, alternative = "greater", mu = 73)
b

# Alla konfidensintervall

head(trees)
A <- matrix(NA, nrow = 3, ncol = 2)
A

for (i in 1:3){
  temp <- t.test(x = trees[,i], conf.level = 0.99)
  A[i,] <- temp$conf
}
rownames(A) <- colnames(trees)
colnames(A) <- c("lower","upper")
A

## == Linjär regression == ##

?lm

data("trees")
x <- lm(formula = Volume ~ Girth, data = trees)
class(x)
print(x)
anova(x)
plot(x)

x <- lm(formula = Volume ~ Girth - 1, data = trees)
summary(x)

coef(x)
predict(x)
resid(x)


ggplot(data = trees) + 
  aes(x = Girth, y = Volume) + 
  geom_point() +
  geom_line(aes(x = Girth, y = predict(x)))

x <- lm(formula = Volume ~ ., data = trees)
summary(x)

x <- lm(formula = Volume ~ Girth + Height, data = trees)
summary(x) 

plot(x)

str(x)
