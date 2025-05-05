#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Funktionell programmering
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

# vi kan använda funktioner som andra objekt

# spara funktioner
# skapar en lista med funktioner



my_list<-c(mean,median)  
my_list
my_list[[1]](c(2,4,3,10,2))
my_list[[2]](c(2,4,3,10,2))
# jämför med 
mean(c(2,4,3,10,2))
median(c(2,4,3,10,2))



my_list2<-list(mean=mean,median=median,sd=sd)

my_list2$mean(iris$Sepal.Length)
my_list2$sd(iris$Sepal.Length)


# funktioner som input till andra funktioner
data("trees")
head(trees)
apply(X = trees,MARGIN = 2,FUN = mean)

apply(X = trees,MARGIN = 2,FUN = max)


# funktioner som output från en funktion
f<-function(x){
  if(x==1){
    return(mean)
  }else{
    return(sd)
  }
}


a<-f(x = 1)
a(1:10)
a<-f(x=4)
a(1:10)
# vad händer i de olika fallen ovan?



#













#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Objektorientering i R
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------


library(pryr)


?class # Object Classes
?otype # Determine object type


class(iris)
otype(x = iris)
otype(x = "hej")
library(Matrix)
A<-Matrix(10,2,5)
otype(A)

?ftype # Determine function type
ftype(mean)
ftype(plot)
ftype(sd)
ftype("+")



data("iris")

class(iris)

class(1:10)

class(matrix(10,2,5))


# Skapa en klass i R

my_object1<-list(name="Ali",age=42,company="liu")
my_object1
class(my_object1)
class(my_object1) <- "employee"
class(my_object1)

my_object1$name
my_object1$age


print(my_object1)
methods(print)


print.employee<-function(x){
  cat(paste("Name:",x$name,"Age:",x$age,"Company:",x$company))
}
methods(print)
class(my_object1)
print(my_object1)
print.employee(my_object1)
print.default(my_object1)

my_object2<-list(name="Elin",age=34,company="liu",data=iris,data_name="iris")
class(my_object2)<-c("statistician","employee")
class(my_object2)

print.statistician<-function(x){
  cat(paste(x$name,"is a statistician!"))
}

print(my_object1)
print(my_object2)
print.employee(my_object2)


summary.statistician<-function(x){
  print(paste("Favorited data:",x$data_name))
  temp<-summary(x$data)
  print(temp)
}

print(my_object1)
print(my_object2)
summary(my_object1)
summary(my_object2)


# skapa en generisk funktion:
age <- function(x) {
  UseMethod("age")
}

age.default<-function(x) "No method available!"
methods(age)
age(x = 1:10)


age.employee<-function(x){
  return(x$age)
}

age(x = 1:2)
age(x = iris)
age(my_object1)

class(my_object2)
age(my_object2)
str(my_object1)
my_object1$age

# Skapa konstruktorfunktion

# funktionen skapar specifika instanser (objekt) av klassen "employee"
employee <- function(name, age,company){
  obj<-list(name=name,age=age,company=company)
  class(obj) <- "employee"
  return(obj)
}

x<-employee(name = "Josef",age = 67,company = "abc")
x
class(x)

statistician<-function(name,age,company,data,data_name){
  obj<-list(name=name,age=age,company=company,data=data,data_name=data_name)
  class(obj)<-c("statistician","employee")
  return(obj)
}

B<-statistician(name = "Erica",age = 45,company = "ABC",data = trees,data_name = "trees")

class(B)
print(B)
summary(B)
#





#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Datum och tid
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

library(lubridate)

# många tips finns här:
# https://rstudio.github.io/cheatsheets/lubridate.pdf

?ymd
x<-ymd("2015-01-01")
x
class(x)


a<-interval(start = ymd("2015-01-01"),end = ymd("2015-01-06"))
a
class(a)


b<-ymd("2015-01-01")%--%ymd("2015-01-06")
b
a==b
all.equal(a,b)

print(a)
str(a)
otype(a)
a@start

class(a)
str(a)

a/days(1)
class(days(1))


a/ddays(1)
class(ddays(1))

dseconds(32499)

ymd("2016-01-01")+dweeks(20)
ymd("2016-01-01")+weeks(20)


b<-dyears(120)
b
class(b)
str(b)
b@.Data^-0.5

b2<-years(120)
class(b2)
b2
str(b2)

day(b2)
year(b2)

b2@day
b2@year

year(b2)
b2
month(b2)
month(b2)<-6
b2

class(a)
str(a)

# vad är by= i de olika fallen?
seq(from = as.Date("2010-1-1"), to = as.Date("2015-1-1"), by = "years")

seq(as.Date("2010-1-1"), as.Date("2015-1-1"), by = "months")

seq(as.Date("2010-1-1"), as.Date("2015-1-1"), by = "weeks")

seq(as.Date("2010-1-1"), as.Date("2015-1-1"), by = "3 weeks")

seq(as.Date("2010-1-1"), as.Date("2015-1-1"), by = "days")

# tidserieplottar

set.seed(422)
y<-1:10+rnorm(10)
x<-seq(from = as.Date("2010-1-1"), to = as.Date("2019-1-1"), by = "years")

plot(x,y,t="o")



#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Linjär algebra
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

a<-matrix(1:100,20,5)
b<-matrix(100:1,5,20)
dim(a)
dim(b)
a
b
a%*%b
b%*%a

d<-matrix(5,20,1)
d
class(d)
as.vector(d)
b%*%d

e<-b%*%a
e
t(e)
dim(a)
dim(t(a))
e<-t(a)%*%a
e<-matrix(c(1,2,3,4),2,2)
e
e_inv<-solve(e)
e_inv
e%*%e_inv

matrix(c(1,2,3,4),2,2,byrow = TRUE)
diag(1:10)

eigen(e)

# ekvationssystem:

A<-matrix(c(4,4,6,2,6,-4,2,8,4),3,3,byrow = TRUE)

b<-matrix(c(24,0,18),3,1)

x<-solve(A,b)

A%*%x





