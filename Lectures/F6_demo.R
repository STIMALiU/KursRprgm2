
#-------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------
# Objektorientering i R
#-------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------

# Skapa en klass i R

my_object1<-list(name="Ali",age=42,company="liu")
my_object1
class(my_object1) <- "employee"
class(my_object1)

my_object1$name
my_object1$age

print.employee<-function(x){
  cat(paste("Name:",x$name,"Age:",x$age,"Company:",x$company))
}
methods(print)
print(my_object1)

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

age(x = 1:10)


age.employee<-function(x){
  return(x$age)
}

age(x = 1:2)
age(x = iris)
age(my_object1)
age(my_object2)
str(my_object1)


# Skapa konstruktorfunktion

employee <- function(name, age,company){
  obj<-list(name=name,age=age,company=company)
  class(obj) <- "employee"
  return(obj)
}

x<-employee(name = "Josef",age = 78,company = "abc")
x
class(x)







#-------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------
# Datum och tid
#-------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------

library(lubridate)

x<-ymd("2015-01-01")
class(x)


a<-interval(ymd("2015-01-01"),ymd("2015-01-06"))
a

ymd("2015-01-01")%--%ymd("2015-01-06")


print(a)

a@start

class(a)
str(a)

a/days(1)
a/ddays(1)

ymd("2016-01-01")+dweeks(20)
ymd("2016-01-01")+weeks(20)

b<-dyears(120)
class(b)
str(b)
b

b2<-years(120)
class(b2)
b2
str(b2)
day(b2)

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


#-------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------
# Linjär algebra
#-------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------

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
e<-t(a)%*%a
e<-matrix(c(1,2,3,4),2,2)
e
e_inv<-solve(e)
e_inv
e%*%e_inv

matrix(c(1,2,3,4),2,2,byrow = TRUE)
diag(1:10)

eigen(e)

