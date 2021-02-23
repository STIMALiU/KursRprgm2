
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
hist(y,breaks = 15,col="purple",freq = FALSE)
?par
par(lwd=1)
plot(x=y,type="l",lty=1,main="AirPassengers")

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

# -------------------------------------------------------------------------------------------
# det finns två gränsnitt till pxweb
# -------------------------------------------------------------------------------------------

# -------------------------------------------------------------------------------------------
# de gamla funktionerna
my_data <- interactive_pxweb()


head(my_data)



myDataSetName <- 
  get_pxweb_data(url = "http://api.scb.se/OV0104/v1/doris/sv/ssd/BE/BE0101/BE0101A/BefolkningR1860",
                 dims = list(Alder = c('*'),
                             Kon = c('1', '2'),
                             ContentsCode = c('BE0101C£'),
                             Tid = c('1860', '2017')),
                 clean = TRUE)




# Ladda ned husdjur
my_data <- get_pxweb_data(url = "http://api.scb.se/OV0104/v1/doris/sv/ssd/JO/JO0103/HusdjurL",
                 dims = list(Region = c('00'),
                             Djurslag = c('70'),
                             ContentsCode = c('JO0103L1'),
                             Tid = c('*')),
                 clean = TRUE)

# Visualisera över tid
dim(my_data)
index <- !is.na(my_data$values)
data2 <- my_data[index,]
temp <- as.character(data2$Tid)
my_years <- as.numeric(temp)

plot(x = my_years, y = data2$values, xlab="År", ylab="Antal hästar", type="o",cex=2)


plot(x = my_years, y = data2$values, xlab="År", ylab="Antal hästar", type="l",lwd=2)




barplot_data <- data2$values
names(barplot_data) <- my_years
barplot(barplot_data)




# Hämta data från ett givet api 
my_data2 <- interactive_pxweb(api = 'api.scb.se', version = 'v1', lang = 'sv')


# -------------------------------------------------------------------------------------------
# de nya funktionerna

# se här för mer detaljer:
# https://cran.r-project.org/web/packages/pxweb/vignettes/pxweb.html


mitt_data<-pxweb_interactive()

# ladda ner data med
# pxweb_get()
