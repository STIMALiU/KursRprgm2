#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------
# Demo-kod: Lecture 1
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------



# hur använder jag RStudio?

# i RStudio kör en rad (eller markerad kod) genom att trycka ctrl+enter
# för mer genvägar tryck: alt+shift+k

# mer hjälp: https://raw.githubusercontent.com/rstudio/cheatsheets/main/rstudio-ide.pdf

# Koden skrivs i console eller i ett script (här tex)

# hitta flikarna Environment, History, Files och Help


#-----------------------------------------------------------------------------------------------------------------------
# variables 
#-----------------------------------------------------------------------------------------------------------------------



my_variable <- "Calle"
myVariable <- "Calle2"
my variable <- "Calle"



my_vector <- c("Calle", "Blomqvist")
my_vector
my_vector[1]
num_vec <- c(1, 1, 2, 2)
my_vector[num_vec]

my_vector[c(1,2,1)]

length(my_variable)
length(num_vec)


my_vector[length(my_vector)] # sista elementet
my_vector[2]

my_vector<-c(2,4,3,25,7,65,3,323,23,21,21,2)
my_vector[length(my_vector)] # sista elementet

-3:4
10:-2

my_num <- 1:10
my_num
print(my_num)
length(my_num)

## Variabeltyper
typeof(my_vector)
typeof(my_num)

# heltal skapar med ett "L" på slutet

3L
x<-5L
y<-5
typeof(x)
typeof(y)

x<-"abc"
x
print("hej!")


is.character(x)
is.integer(x)

x<-20
y<-4
x^y

x<-1:3
y<-c(2,3,6)

x^y

#-----------------------------------------------------------------------------------------------------------------------
# functions 
#-----------------------------------------------------------------------------------------------------------------------

area<-function(x){
  area<-x^2
  return(area)
}

area(x = 5)

# Funktionens innehåll: 
# Skriv en funktion, f, som tar ett värde med argumentet z, och kvadrerar det:

f <- function(z){

  return(z_squared)
}

# - Börja med kod som fungerar (men med funktionens argument)
z <- 3
z_squared <- z^2
z_squared <- z*z

# - Lyft in koden i funktionen
f <- function(z){
  z_squared <- z^2
  return(z_squared)
}


# - Pröva att funktionen fungerar som den ska
f(3)
f(z = 3)

f(12)
f(z = 5)

my_val <- f(z = 4)

my_val
my_val/2

my_val <- f(z = 40)
my_val
my_val/2

f(z = my_val)

f(z = my_val/5)

# kolla vad som finns inuti:
f


# rensa
rm(list=ls())

ls()
a<-10


# Lokal miljö
f <- function(x, y){
  res <- x+y
  z<-"hej"
  print(z)
  return(res)
}

x <- 5
y <- 5

m<-f(x = 2, y = 2)
m
z
res



#-----------------------------------------------------------------------------------------------------------------------
# markmyassignment 
#-----------------------------------------------------------------------------------------------------------------------

## Installation
install.packages("markmyassignment")

## Använd paketet
library(markmyassignment)
#detach("package:markmyassignment", unload = TRUE)

## Ställ in uppgift
assignment_path <- file.path(system.file(package = "markmyassignment"), "extdata", "example_assignment01.yml")

set_assignment(assignment_path)
  
show_assignment()
## Uppgift:
# Mandatory: Assign you name to my_name 
my_name <- "Josef Wilzén"

## task1: Create a vector with the values pi and e
pi
exp(1)

task1 <- c(pi, exp(1)) # Correct

mark_my_assignment("task1")

task1 <- c(3, exp(1)) # Wrong

mark_my_assignment("task1")


## task2: Create a function that returns the sum of the first and 
# last element
x<-c(2,4,1)
length(x)
x<-1:10
length(x)

task2 <- function(vector){
  z<-vector[2] + vector[length(vector)] # Wrong
  return(z)
}

mark_my_assignment("task2")

task2 <- function(vector){
  z<-vector[1] + vector[length(vector)] # Correct
  return(z)
}

mark_my_assignment("task2")

# rätta alla uppgifter samtidigt:

mark_my_assignment()
mark_my_file(mark_file = "/home/joswi05/Desktop/test.R")


#-----------------------------------------------------------------------------------------------------------------------
# Logik 
#-----------------------------------------------------------------------------------------------------------------------

min_vektor <- c(12, 1, 2, 7)
min_bool <- c(TRUE, FALSE, FALSE, TRUE)
min_vektor[min_bool]


3>4
4>3

x<-TRUE
y<-FALSE
!x
!!x

x&y
x|y



x <- 1:10
y <- x != 5
z <- x > 2

y
z

y & z

y & !z


x[y & z]
x[y & !z]


index<-y & z
x[index]



1:5 %in% 1

1:5 %in% c(2,1,5)

