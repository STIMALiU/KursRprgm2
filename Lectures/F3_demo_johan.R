# == Demo kod Föreläsning 3 == #
# == Johan Alenlöv == #

## If - satser ##

if(TRUE) print("JA")
if(FALSE) print("Ja")

if (TRUE) {
  print("Ja")
}


vals <- c(1,3,5)

if (1 %in% vals) print("Ja")
if (2 %in% vals) print("Ja")

x <- 3
x <- 4

if (x %in% vals){
  print("I vals")
} else {
  print("Inte i vals")
}

x <- 0:10
length(x)
if (x >= 1 ) print("Hej")
x <- "Hej"
is.numeric(x)

f <- function(x){
  if (is.numeric(x)) {
    medelvarde <- mean(x)
    print(medelvarde)
  } else {
    print("x är inte ett tal")
  }
}

f(1)
f(1:10)
f("hej")


?sign
sign(1)
sign(1000000)
sign(-5)
sign("a")

my_sign <- function(x) {
  if(is.numeric(x)) {
    if(x > 0) {
      return(1)
    } else if (x < 0) {
      return(-1)
    } else {
      return(0)
    }
  } else {
    print("x är inte ett tal")
  }
}

my_sign(1)
my_sign(1000000)
my_sign(-5)
my_sign(0)
my_sign("a")

## for-loopar ##

vektor <- -1:4
vektor

for (i in vektor) {
  print(i)
}

for (i in vektor) {
  print(my_sign(i))
}

for (i in vektor) {
  print(my_sign(x = -10))
}

res <- rep(0,10)
res
for (i in 1:length(res)) {
  res[i] = i
}
res

vec <- c("Jag","gillar","R")
seq_along(vec)

for (index in seq_along(vec)) {
  print(vec[index])
}


for (j in 1:5) {
  print(j)
  if (j %% 2 == 0) {
    print("jämnt")
  } else {
    print("udda")
  }
}


## Nästlade loopar ##

A <- matrix(1:9, nrow = 3)
A

for (i in 1:3) {
  for (j in 1:3) {
    print(paste("rad:", i, "kolumn:",j,"värde:",A[i,j]))
  }
}

for (i in 1:3) {
  for (j in 1:3) {
    print(paste("rad:", j, "kolumn:",i,"värde:",A[j,i]))
  }
}

mult_mat <- matrix(0,nrow=10,ncol=10)

for (i in 1:10) {
  for (j in 1:10) {
    mult_mat[i,j] = i*j
  }
}

mult_mat

index <- lower.tri(mult_mat)
index
mult_mat[index] <- 0
mult_mat

## While-loop ##

y <- 10
x <-5
while(x > 0) {
  print(y / x)
  x <- x - 1
}
x

x <- 1
while( x < 5) {
  print(y / x)
  x <- x - 1
}

data("iris")
dim(iris)
head(iris,n=3)

villkor <- TRUE
index <- 1
while( villkor ) {
  temp <- iris[,index]
  if(is.numeric(temp)) {
    print(mean(temp))
  } else {
    print("Inte ett tal")
    villkor <- FALSE
  }
  index <- index + 1
}

## Kontrollstrukturer för loopar ##

?next
?break


for (i in 1:20) {
  if (i %% 3 == 0) {
    next()
  } else if (i %% 5 == 0) {
    next()
  }
  print(i)
}

for (i in 1:20) {
  print(i)
  print("Före")
  if (i %% 3 == 0) break()
  print("Efter")
}


for (i in 1:5) {
  print(paste("i:",i))
  j <- 1
  while (j <= 5) {
    
    if (j == i) {
      break
    }
    print(paste("j:",j))
    j <- j + 1
  }
}

for (i in 1:5) {
  print(paste("i:",i))
  j <- 1
  while (j <= 5) {
    
    if (j == i) {
      stop("Nu blev det fel")
    }
    print(paste("j:",j))
    j <- j + 1
  }
}

## Debugging ##

my_mean <- function(x){
  return(sum(x)/length(x))
}

my_mean(1:10)

my_mean(c(TRUE,FALSE))

my_mean <- function(x) {
  if ( !is.numeric(x)) warning("x is not numeric!")
  return(sum(x)/length(x))
}

my_mean(1:10)

my_mean(c(TRUE,FALSE))

my_mean <- function(x) {
  if (! is.numeric(x)) stop("x is not numeric!")
  return(sum(x)/length(x))
}

my_mean(1:10)
my_mean(c(TRUE,FALSE))

## Browser och debug

debug(my_mean)
my_mean(1:10)
my_mean(c(TRUE,FALSE))
undebug(my_mean)

h <- function(x){
  mu_x <- mean(x)
  print(mu_x)
  y <- mu_x*2
  z <- y^2
  print(z)
  w <- 5
  v <- z <- w
  return(v)
}

h(1:100)

h <- function(x){
  mu_x <- my_mean(x)
  print(mu_x)
  y <- mu_x*2
  z <- y^2
  print(z)
  browser()
  w <- 5
  v <- z <- w
  return(v)
}

h(1:100)
