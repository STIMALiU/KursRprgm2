## == Objektorientering == ##

data("iris")

class(iris)

class(1:10)

class(matrix(10,2,5))

# Skapa en S3 klass i R

my_object <- list(name = "Johan", age = 33, company = "liu")
my_object
class(my_object)
class(my_object) <- "employee"
class(my_object)

my_object$name
my_object$age

print(my_object)
methods(print)

print.employee <- function(x){
  cat("Name:",x$name,"Age:",x$age,"Company:",x$company)
}
methods(print)

print(my_object)
print.employee(my_object)
print.default(my_object)

my_object2 <- list(name="Elin",age=40,company="liu",data=iris,data_name="iris")
class(my_object2) <- c("statistician","employee")
class(my_object2)

print(my_object2)

print.statistician <- function(x){
  cat(x$name,"is a statistician!")
}

print(my_object2)
print.employee(my_object2)

summary.statistician <- function(x){
  print(paste("Favorite data:",x$data_name))
  
  temp <- summary(x$data)
  print(temp)
}

print(my_object)
print(my_object2)
summary(my_object)
summary(my_object2)


# Generisk funktion

age <- function(x) {
  UseMethod("age")
}

age.default <- function(x) "No method available!"
methods(age)
age(x = 1:10)

age.employee <- function(x){
  return(x$age)
}

age(x = 1:2)
age(x = iris)
age(my_object)

# Skapa konstruktor

employee <- function(name, age, company){
  obj <- list(name=name,age=age,company=company)
  class(obj) <- "employee"
  return(obj)
}

x <- employee(name = "Johan", age = 22, company = "abc")
x
class(x)

## == Datum och Tid == ##

library(lubridate)

x <- ymd("2022-02-28")
x
class(x)

a <- interval(start = ymd("2022-01-24"),end = x)
a
class(a)

b <- ymd("2022-01-24") %--% ymd("2022-02-28")
b
a == b
all.equal(a,b)

print(a)
str(a)
a@start

class(a)

a/days(1)

a/ddays(1)

ymd("2022-01-24") + dweeks(5)
ymd("2022-01-24") + weeks(5)

b <- dyears(120)
b
class(b)
str(b)
b@.Data

b2 <- years(120)
class(b2)
b2
str(b2)

day(b2)
year(b2)

b2@day
b2@year

month(b2)
month(b2) <- 6

b2

class(a)
str(a)

seq(from = as.Date("2020-1-1"), to = as.Date("2022-02-28"), by = "years")

seq(from = as.Date("2020-1-1"), to = as.Date("2022-02-28"), by = "months")

seq(from = as.Date("2020-1-1"), to = as.Date("2022-02-28"), by = "weeks")

seq(from = as.Date("2020-1-1"), to = as.Date("2022-02-28"), by = "3 weeks")

seq(from = as.Date("2020-1-1"), to = as.Date("2022-02-28"), by = "4 days")

## == Linjär algebra == ##

a <- matrix(1:100,20,5)
b <- matrix(100:1,5,20)

a
b

a%*%b
b%*%a

d <- matrix(5,20,1)
d
class(d)
as.vector(d)
b %*% d
a %*% d

e <- b %*% a

dim(a)
dim(t(a))
e <- t(a) %*% a
e <- matrix(1:4,2,2)
e
e_inv <- solve(e)
e_inv

e %*% e_inv

matrix(1:4,2,2,byrow = TRUE)
diag(10)
diag(1:10)

eigen(e)
