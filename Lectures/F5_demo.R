
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
# Grafik
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------



data("iris")
head(iris)
plot(x = iris$Sepal.Length, y = iris$Petal.Length)

plot(x = iris$Sepal.Length, y = iris$Sepal.Width)

plot(x = iris$Sepal.Length, y = iris$Petal.Width)

str(iris)
is.data.frame(iris)
plot(iris)

x<-iris$Sepal.Length^2+10
plot(x = iris$Sepal.Length, y = x)
plot(x = x, y = iris$Petal.Width)


plot(x = iris$Sepal.Length, y = iris$Petal.Length,col="red")

plot(x = iris$Sepal.Length, y = iris$Petal.Length,col="blue",pch=5)
plot(x = iris$Sepal.Length, y = iris$Petal.Length,col="blue",pch=16)

col_var<-iris$Species

plot(x = iris$Sepal.Length, y = iris$Petal.Length,col=col_var,pch=16,cex=1.5)

x<-seq(-10,10,length=1000)
y<-x^2-x+4
plot(x,y,t="l")
y<-2*sin(x)
plot(x,y,t="l",ylab="y = sin(x)",main="En sinuskurva")


data("AirPassengers")
y<-as.numeric(AirPassengers)

plot(x=y,type="l",lty=1,lwd=2,main="AirPassengers")

plot(x=y,type="o",lty=1,lwd=2,main="AirPassengers")

plot(x=y,t="l",lty=3,lwd=3,main="AirPassengers")

?par

# AirPassengers är ett ts-objekt (ts=tidserie), så det går att plotta direkt:
class(AirPassengers)
str(AirPassengers)
plot(AirPassengers)


boxplot(y,col="blue")

?boxplot
# Exempel från dok:

## boxplot on a formula:
boxplot(count ~ spray, data = InsectSprays, col = "lightgray")
# *add* notches (somewhat funny here <--> warning "notches .. outside hinges"):
boxplot(count ~ spray, data = InsectSprays,
        notch = TRUE, add = TRUE, col = "blue")




hist(y,col="purple",freq = FALSE)
hist(y,breaks = 5,col="purple",freq = FALSE)
hist(y,breaks = 20,col="purple",freq = FALSE)
hist(y,breaks = 20,col="purple",freq = TRUE)
?par
par(lwd=3)
plot(x=y,type="l",lty=1,main="AirPassengers")
par(lwd=1)
plot(x=y,type="l",lty=1,main="AirPassengers")

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

rnorm(n=30, mean=10, sd=1)

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
hist(y,breaks = 50,freq = FALSE)

x<-seq(from = -5,to = 5,length=1000)
y<-dnorm(x = x,mean = 0,sd = 1)
plot(x = x,y = y,t="l")
head(cbind(x,y))

pnorm(q = -0.5,mean = 0,sd = 1)

qnorm(p = 0.3085375,mean = 0,sd = 1)


text <- c("Linköpings", "Universitet","Campus","Statistik")
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
# vi skapar en slumpmässig indexvektor för att välja ut 10 obs i Iris-data
set.seed(4983)
rand_index<-sample(x=150, size=10, replace=FALSE)
rand_index
# Väljer ut 10 slumpmässiga blommor från Iris-data
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
# En diskret sannolikhetsfördelning för heltalen: 0,1,2,3,4,...
Ni <- rpois(100, lambda = 5) # testa att ändra lambda!
mean(Ni)
var(Ni)
tN <- table(Ni)
barplot(tN)
# relativa frekvenser:
tN <- table(Ni)
tN<-tN/sum(tN)
sum(tN)
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

head(mitt_data$data)

pop_test<-mitt_data$data

# kod nedan för att automatiskt ladda ner data:
# (genererades från pxweb_interactive())

# befolkningsdata från SCB:

# PXWEB query 
pxweb_query_list <- 
  list("Alder"=c("tot"),
       "Kon"=c("1","2"),
       "ContentsCode"=c("0000053A"),
       "Tid"=c("2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2021"))

# Download data 
px_data <- 
  pxweb_get(url = "https://api.scb.se/OV0104/v1/doris/sv/ssd/BE/BE0101/BE0101A/BefolkningR1860N",
            query = pxweb_query_list)

# Convert to data.frame 
px_data_frame <- as.data.frame(px_data, column.name.type = "text", variable.value.type = "text")

# Get pxweb data comments 
px_data_comments <- pxweb_data_comments(px_data)
px_data_comments_df <- as.data.frame(px_data_comments)

# väljer ut kvinnor:
pop_female<-px_data_frame[px_data_frame$kön=="kvinnor",]

# hur ser befolkningsutvecklingen ut för kvinnor i Sverige sen år 2000?
plot(pop_female$år,pop_female$Folkmängd,t="o",ylab="Folkmängd, kvinnor",xlab="år")



