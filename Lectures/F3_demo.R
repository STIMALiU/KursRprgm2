# ------------------------------------------------------------------------------
# Demo: Programkontroll
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
# Villkorssatser
# ------------------------------------------------------------------------------

# använda if-sats


if(TRUE) print("Ja!")  # en rad kod
if(FALSE) print("Ja!")

if(TRUE){      # flera rader kod: {}
  print("Ja!")
  print("nej")
}


2 < 4

if(2 < 4) print("Ja!")

if(2 > 4) print("Nej!")


# if-esle:
x <- 10
x <- 40
x <- 20

if(x <= 20){
  print("litet x")
} else {
  print("stort x")
}


# vad händer nedan?
x <- 0:10
length(x)
if(x >= 1) print("hej")
if(x[3] >= 1) print("hej")

x<-"hej"
as.numeric(x)
is.numeric(x)

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
mean(a)
f(x = a)
f(x = "R")
f(x = TRUE)

f(x = 1:340)
f(x = "abc")
mean("abc")

a<-TRUE
b<-FALSE
c<-TRUE
d<-FALSE

# vad betyder?
(a&!b)&c


if( (a&!b)&c ){
  print("test")
}



# Egen version av sign(), testa ?sign
?sign
sign(x = 0)
sign(x = -399800)
sign(x = 3276)

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



# ------------------------------------------------------------------------------
# for-loopar
# ------------------------------------------------------------------------------

# beror av loop-index "i"
vector <- -2:2
vector


# i är vårt loop-index/loop-variabel här
for(i in vector){
  print(i)
}


for(i in vector){
  print(my_sign( x = i ))
}

# beror inte av loop-index "i"
for(i in vector){
  print(my_sign( x = -10 ))
}
# fallet ovan kan vi använda om vi vill göra exakt samma sak många gånger


# beror inte av loop-index "i"
for(i in 1:10){
  print("hello world!")
}
# fallet ovan kan vi använda om vi vill göra exakt samma sak många gånger






# vi kan ange loop-vektorn på olika sätt

# som en redan sparad vektor:
vector
for(i in vector){
  print(my_sign( x = i ))
}


loop_vekt<-1:10
for(i in loop_vekt){
  print(i)
}

# skapa den direkt i loopen
for(i in 1:10){
  print(i)
}


# Uppgift skriv en loop som kan summera tal i vektor
# vi vill spara resultatet av våra beräkningar
loop_vekt<-1:10
# res är vår resultatvektor -> här sparar vi resultat från beräkningar
res<-rep(0,length(loop_vekt))  # vi skapar den som en "tom" vektor (bara nollor)
res

x <- 0 # räknevariabel, börjar på 0
for(i in loop_vekt){  # loopar över loop_vekt
  x <- x + i   # lägg till i till nuvarande värde på x och spara över gamla x
  res[i] <- x  # spara nya värdet på x i res på index-plats i
  print(x)     # skriver ut nuvarande värde på x
}

res
sum(loop_vekt)
?cumsum # kumulativa summan 
cumsum(loop_vekt)


# fler sätt att skapa loop-vektor:
vec <- c("I", "love", "R", "and", "Python")
seq_along(vec)

vec <- 10:15
sum(vec)

sum_0 <- 0
for(i in seq_along(vec)){
  sum_0 <- sum_0 + vec[i]
}
sum_0


# kombinera villkorsats med for-loop
# Vad gör j %% 2 == 0 nedan?

for(j in 1:5){
  print(j)
  if(j %% 2 == 0){
    print("jämnt")
  } else {
    print("udda")
  }
}



# ------------------------------------------------------------------------------
# Nästlade for-loopar
# ------------------------------------------------------------------------------

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

dim(A)
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
mult_mat # mult_mat är en "tom" matris som vi ska fylla med värden
for ( i in 1:10 ) {
  for ( j in 1:10 ) {
    mult_mat[i,j] <- i*j
  }
}
mult_mat
colnames(mult_mat)<- paste0("*",1:10)
rownames(mult_mat)<- paste0("*",1:10)
mult_mat

# Sätt alla under diagonalen till 0:
index<-lower.tri(mult_mat,diag = FALSE)
mult_mat[index]<-0
mult_mat








# ------------------------------------------------------------------------------
# while-loopar
# ------------------------------------------------------------------------------


# vi måste ha ett logiskt utryck i början av en while-loop
# -> detta utryck måste gå att utvärdera innan loopen startar!

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
# för att avbryta 
# i console-fönster -> tryck på röda stopknappen i kanten 
# alt: i menyerna -> tryck Session -> Interrupt R


# iris data:
dim(iris)
head(iris,n = 3)

cond <- TRUE
index <- 1
while(cond){
  temp<-iris[,index]
  if(is.numeric(temp)){
    print(paste("median =",median(temp)))
    
  } else{
    print("not numeric!")
    cond <- FALSE
  }
  index <- index+1
}




# ------------------------------------------------------------------------------
# kontrollstrukturer för loopar
# ------------------------------------------------------------------------------

?next # iteration in loop 
?break # out of inner loop


# vi testar att hoppa över alla iterationer i loopen där loop-index (i)
# inte är jämt delbart med 3
for(i in 1:12){
  # vad gör if här?
  if(i %% 3 != 0){
    next
  }
  print(i)
}


# vi testar att avbryta loopen när ett visst villkor är uppfyllt
for(i in 1:12){
  cat("Detta händer före if-sats:", i, "\n")
  if(i %% 3 == 0){
    break
  }
  cat("Detta händer efter if-sats:", i, "\n")
}

# vi testar att avbryta loopen och generera ett fel när ett visst villkor är uppfyllt
for(i in 1:12){
  cat("Deta händer före if-sats, i =", i, "\n")
  if(i%%3 == 0){
    stop("avbryt!")
  }
  cat("Deta händer efter if-sats, i =", i, "\n")
}


# ------------------------------------------------------------------------------
# Demo debugging
# ------------------------------------------------------------------------------


# Öppna (   {   "
# -> blir problem -> tryck Esc för att avbryta
# (
# {


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
my_mean(x = c(2.1,5.56,7.9,0.32))
my_mean(x=c(TRUE,FALSE,FALSE))
my_mean(x=c("a","j"))



# ------------------------------------------------------------------------------
# browser och debug

debug(my_mean)
my_mean(x = 1:8)
my_mean(x=c(TRUE,FALSE,FALSE))
undebug(my_mean)
my_mean(x = 1:8)

my_mean<-function(x){
  print(typeof(x))
  val1<-mean(x)
  browser()
  val2<-var(x)
  y<-list(mean=val1,var=val2)
  return(y)
}
my_mean(x = 1:8)

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Beräkna standardavvikelse för ett stickprov
# funktionen mean() är inte tillåten
# kontrollera att x är numerisk innan beräkningar
# https://sv.wikipedia.org/wiki/Standardavvikelse#Diskret_slumpvariabel
#-------------------------------------------------------------------------------

x<-1:12
n <-length(x)

my_sd<-function(x){
  
  x_sum < - sum(x)
  
  x_diff_sq<-(x-x_sum)^2
  
  var<-sum(x_diff_sq)/n
  
  sd_val<-sqrt(-var)
  
  list(mean=x_sum,sd=var,n=n)
}
debug(my_sd)

my_sd(x = 1:5)

undebug(my_sd)

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

