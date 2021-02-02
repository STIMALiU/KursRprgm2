# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
# Demo: Programkontroll
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------


# -------------------------------------------------------------------------------------------
# Villkorssatser
# -------------------------------------------------------------------------------------------

# använda if-sats

if(TRUE) print("Ja!")
if(FALSE) print("Ja!")

2 < 4

if(2 < 4) print("Ja!")

if(2 > 4) print("Nej!")


# if-esle:
x <- 10
x <- 40

if(x <= 20){
  print("litet x")
} else {
  print("stort x")
}


# vad händer nedan?
x <- 0:10
if(x >= 1) print("hej")



# Detta är ett exempel på kontroll av argument
f <- function(x){
  
  if(is.numeric(x)){
    my_mean <- mean(x)
    print(my_mean)
    
  } else{
    print("x is not numeric")
    
  }
}

a<-c(1,2,3,10,87)
f(x = a)
f(x = "R")
f(x = TRUE)

f(x = 1:340)
f(x = "abc")
mean("abc")

# Egen version av sign(), testa ?sign
?sign
sign(20)
sign(-32)
sign(0)

my_sign<-function(x){
  if(is.numeric(x)){
    
    if(x > 0){
      return(1)
    } else if(x == 0){
      return(0)
    } else {
      return(-1)
    }
    
  } else {
    print("x is not numeric!")
  }
  
}
my_sign(x = 10)
my_sign(x = -210.53)
my_sign(0)
my_sign(x = "R")
my_sign(x = TRUE)

a<-my_sign(0)
a



# -------------------------------------------------------------------------------------------
# for-loopar
# -------------------------------------------------------------------------------------------

# beror av loop-index "i"
vector <- -2:2
vector

# beror inte av loop-index "i"
for(i in vector){
  print(my_sign( x = -10 ))
}

# beror inte av loop-index "i"
for(i in 1:3){
  print("hello")
}

vector
for(i in vector){
  print(my_sign( x = i ))
}


loop_vekt<-1:10
res<-rep(0,length(loop_vekt))
x <- 0
for(i in loop_vekt){
  x <- x + i
  res[i] <- x
  print(x)
}
res
sum(loop_vekt)



vec <- c("I", "love", "R", "and", "Python")
seq_along(vec)

vec <- 10:15
sum(vec)

sum_0 <- 0
for(i in seq_along(vec)){
  sum_0 <- sum_0 + vec[i]
}
sum_0



for(j in 1:5){
  print(j)
  if(j %% 2 == 0){
    print("jämnt")
  } else {
    print("udda")
  }
}



# -------------------------------------------------------------------------------------------
# Nästlade for-loopar
# -------------------------------------------------------------------------------------------

A <- matrix(c(3,6,9,2), nrow = 2)
A
#i <- 1

for ( i in 1:2 ) {
  for ( j in 1:2 ) {
    print(A[i,j])
  }
}

# över rader först och kolumner sen:
for ( i in 1:2 ) {
  for ( j in 1:2 ) {
    print(paste("rad:", i, "kolumn:", j, "värde=",A[i,j]))
  }
}

# över kolumner först och rader sen
for ( i in 1:2 ) {
  for ( j in 1:2 ) {
    print(paste("rad:", j, "kolumn:", i, "värde=",A[j,i]))
  }
}

j<-2
i<-1
print(paste("rad:", j, "kolumn:", i, "värde=",A[j,i]))

# multiplicera heltal = multiplikationstabellen

mult_mat <- matrix(0, nrow = 10, ncol = 10)
mult_mat
for ( i in 1:10 ) {
  for ( j in 1:10 ) {
    mult_mat[i,j] <- i*j
  }
}
mult_mat
# Sätt alla under diagonalen till 0:
index<-lower.tri(mult_mat,diag = FALSE)
mult_mat[index]<-0
mult_mat



# -------------------------------------------------------------------------------------------
# kontrollstrukturer för loopar
# -------------------------------------------------------------------------------------------

?next # iteration in loop 
?break # out of inner loop


for(i in 1:12){
  if(i %% 3 != 0){
    next
  }
  print(i)
}


for(i in 1:12){
  cat("Detta händer före if-sats:", i, "\n")
  if(i %% 3 == 0){
    break
  }
  cat("Detta händer efter if-sats:", i, "\n")
}


for(i in 1:12){
  cat("Deta händer före if-sats:", i, "\n")
  if(i%%3 == 0){
    stop("avbryt!")
  }
  cat("Deta händer efter if-sats:", i, "\n")
}




# -------------------------------------------------------------------------------------------
# while-loopar
# -------------------------------------------------------------------------------------------

y <- 10
x <- 5
while(x > 0){
  print(y/x)
  x <- x-1
}
x

# Varning för eviga loopar!
x <- 1
while(x <= 5){
  print(y/x)
  x<-x-1
}


# iris data:
dim(iris)
head(iris,n = 3)

cond <- TRUE
index <- 1
while(cond){
  temp<-iris[,index]
  if(is.numeric(temp)){
    print(median(temp))
    
  } else{
    print("not numeric!")
    cond <- FALSE
  }
  index <- index+1
}



# -------------------------------------------------------------------------------------------
# Demo debugging
# -------------------------------------------------------------------------------------------


my_mean<-function(x){
  if(!is.numeric(x)) warning("x is not numeric!")  
  return(mean(x))
}
     
my_mean(x = 1:8)
my_mean(x=c(TRUE,FALSE,FALSE))

my_mean<-function(x){
  if(!is.numeric(x)) stop("x is not numeric!")  
  return(mean(x))
}

a<-my_mean(x = 1:8)
a
b<-my_mean(x=c(TRUE,FALSE,FALSE))
b

# skriv ut info till i konsolen 
my_mean<-function(x){
  print(typeof(x))
  val1<-mean(x)
  val2<-var(x)
  y<-list(mean=val1,var=val2)
  return(y)
}
my_mean(x = 1:8)
my_mean(x=c(TRUE,FALSE,FALSE))





# -------------------------------------------------------------------------------------------
# browser och debug

debug(my_mean)
my_mean(x = 1:8)
my_mean(x=c(TRUE,FALSE,FALSE))
undebug(my_mean)
my_mean(x = 1:8)

my_mean<-function(x){
  print(typeof(x))
  val1<-mean(x)
  #browser()
  val2<-var(x)
  y<-list(mean=val1,var=val2)
  return(y)
}
my_mean(x = 1:8)


h<-function(x){
  x_mean<-mean(x)
  x_sum<-sum(x)
  print(x_mean)
  print(x_sum)
  x2<-x^2
  z<-5
  x3<-exp(x2)
  y<-x3<-z
  return(y)
}

h(1:4)

my_val<-h(2:5)
my_val
my_val<-h(1:340)
my_val

h<-function(x){
  x_mean<-mean(x)
  x_sum<-sum(x)
  print(x_mean)
  print(x_sum)
  #browser()
  x2<-x^2
  z<-5
  x3<-exp(x2)
  y<-x3<-z
  return(y)
}


my_val<-h(1:4)
my_val<-h(2:5)
my_val









