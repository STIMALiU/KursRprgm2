
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
# Grafik
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------



data("iris")
head(iris)
plot(x = iris$Sepal.Length, y = iris$Petal.Length)

plot(x = iris$Sepal.Length, y = iris$Petal.Width)

str(iris)
is.data.frame(iris)
plot(iris)

x<-iris$Sepal.Length^2+10
plot(x = x, y = iris$Petal.Width)


plot(x = iris$Sepal.Length, y = iris$Petal.Length,col="red")

plot(x = iris$Sepal.Length, y = iris$Petal.Length,col="blue",pch=5)


col_var<-iris$Species

plot(x = iris$Sepal.Length, y = iris$Petal.Length,col=col_var,pch=16,cex=1.5)


data("AirPassengers")
y<-as.numeric(AirPassengers)

plot(x=y,type="l",lty=1,lwd=2,main="AirPassengers")

plot(x=y,type="o",lty=1,lwd=2,main="AirPassengers")

plot(x=y,t="l",lty=3,lwd=3,main="AirPassengers")



# AirPassengers är ett ts-objekt (ts=tidserie), så det går att plotta direkt:
class(AirPassengers)
str(AirPassengers)
plot(AirPassengers)


boxplot(y,col="blue")

hist(y,col="purple",freq = FALSE)
hist(y,breaks = 5,col="purple",freq = FALSE)
hist(y,breaks = 20,col="purple",freq = FALSE)
?par
par(lwd=3)
plot(x=y,type="l",lty=1,main="AirPassengers")
par(lwd=1)


# bonus:
?volcano
image(volcano)
?filled.contour
x <- 10*1:nrow(volcano)
y <- 10*1:ncol(volcano)
filled.contour(x, y, volcano,
               color.palette = function(n) hcl.colors(n, "terrain"),
               plot.title = title(main = "The Topography of Maunga Whau",
                                  xlab = "Meters North", ylab = "Meters West"),
               plot.axes = { axis(1, seq(100, 800, by = 100))
                 axis(2, seq(100, 600, by = 100)) },
               key.title = title(main = "Height\n(meters)"),
               key.axes = axis(4, seq(90, 190, by = 10)))  # maybe also asp = 1
mtext(paste("filled.contour(.) from", R.version.string),
      side = 1, line = 4, adj = 1, cex = .66)



# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
# Demo: Slumptal
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------

rnorm(n = 5, mean = 10, sd = 1)
set.seed(20180218)
rnorm(n = 5, mean = 10, sd = 1)
set.seed(20180218)
rnorm(n=5, mean=10, sd=1)

?Distributions

y<-rnorm(n = 300,mean = 4,sd = 2)
# relativa frekvenser:
hist(x = y,breaks = 20,freq = FALSE)
mean(y)
sd(y)

y<-rnorm(n = 100000,mean = 4,sd = 2)
hist(x = y,breaks = 100,freq = FALSE)
mean(y)
sd(y)
summary(y)


y <- rnorm(1000, mean = 0, sd = 1)
hist(y,freq = FALSE)



x<-seq(from = -3,to = 3,length=1000)
y<-dnorm(x = x,mean = 0,sd = 1)
plot(x = x,y = y,t="l")
head(cbind(x,y))



text <- c("Linköpings", "Universitet","campus","statistik")
set.seed(20180218)
sample(x=text, size=5, replace=TRUE)
sample(x=text, size=5, replace=TRUE)
set.seed(20180218)
sample(x=text, size=5, replace=TRUE)

sample(x=iris$Species, size=10, replace=FALSE)
dim(iris)

# slumpmässigt urval:

dim(iris)
iris[15,]
set.seed(4983)
rand_index<-sample(x=150, size=10, replace=FALSE)
rand_index
iris[rand_index,]

?Distributions


# The Exponential Distribution
x<-seq(1e-8,10,length=1000)
y<-dexp(x = x,rate = 1)
plot(x,y,t="l")
abline(h=0,lty=3)

z<-rexp(n = 2000,rate = 1)
hist(z,breaks = 50,freq = FALSE)

pexp(q = 2,rate = 1)
p_val<-pexp(q = 2,rate = 1)

qexp(p = p_val,rate = 1)
qexp(p = 0.9,rate = 1)
qexp(p = 0.5,rate = 1)
qexp(p = 0.99,rate = 1)


# The Poisson Distribution
Ni <- rpois(100, lambda = 5)
tN <- table(Ni)
barplot(tN)

# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
# Demo: Markdown
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------

# 1. 
# https://rmarkdown.rstudio.com/
# https://rmarkdown.rstudio.com/lesson-1.html

# 2. 
# https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf
---
  
# 3. 
# Markdown file + Notebook

# öppna en markdown fil



# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
# Demo: PXWEB + Grafik
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------

#install.packages("pxweb")
library(pxweb)


# se här för mer detaljer:
# https://cran.r-project.org/web/packages/pxweb/vignettes/pxweb.html


mitt_data<-pxweb_interactive()

# ladda ner data med
# pxweb_get()
