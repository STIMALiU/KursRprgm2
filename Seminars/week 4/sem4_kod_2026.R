
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Seminarium kursvecka 4
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

# pratade mest om debugging
# - allmänt 
# - Vi gick igenom exemplet "Beräkna standardavvikelse för ett stickprov" från slutet av F3_demo.R
# - vi gjorde uppgift 1.4.5 från Övningsuppgifter 3 (D3)

# vi pratade om next och hur det används i loopar




#-------------------------------------------------------------------------------
# Beräkna standardavvikelse för ett stickprov
#-------------------------------------------------------------------------------
# funktionen nedan innehåller buggar -> försök att rätta funktionen så att
# den fungerar korrekt! (längre ner finns en funktion som är delvis rättad)
#-------------------------------------------------------------------------------

# första versionen
x<-1:12
n <-length(x)
my_sd<-function(x){
  
  x_sum < - sum(x)
  
  x_diff_sq<-(x-x_sum)^2
  
  var<-sum(x_diff_sq)/n
  
  sd_val<-sqrt(-var)
  
  list(mean=x_sum,sd=var,n=n)
}

# rättad version
my_sd<-function(x){
  n <-length(x)
  x_sum <- sum(x)
  mean_x<-x_sum/n

  x_diff_sq<-(x-mean_x)^2

  var<-sum(x_diff_sq)/(n-1)

  sd_val<-sqrt(var)

  list(mean=mean_x,sd=sd_val,n=n)
}
#-------------------------------------------------------------------------------

my_sd(x = 1:5)
mean(1:5)
sd(1:5)

debug(my_sd)
my_sd(x = 1:5)
undebug(my_sd)




#-------------------------------------------------------------------------------
# Övningsuppgifter 3: 1.4.5
#-------------------------------------------------------------------------------
# Stina vill skriva en funktion som kollar om ett värde a (en skalär) finns som 
# element i en vektor b. Exempel: om a=1 och b=c(1,2,3) så ska funktionen returnera 
# TRUE. Om däremot a=10 så ska funktionen returnera FALSE. Hon skrev då funktionen 
# isIn nedan.


# första versionen
isIn <- function(a, b) {
  j <- 1
  while (j <= length(b)) {
    if(a == b[j]) {
      out <- TRUE}
    else {
      out <- FALSE
    }
    j <- j + 1
  }
  return(out)
}

isIn(a = 3,b = 1:3) 
isIn(a = 1,b = 1:3) 

isIn(a = 2,b = 1:5)

debug(isIn)
isIn(a =25,b = 1:5)
undebug(isIn)

# rättad version
isIn <- function(a, b) {
  j <- 1 
  while (j <= length(b)) { 
    if(a == b[j]) {
      out <- TRUE
     
      return(out) 
    }else { 
      out <- FALSE
    } 
    
    j <- j + 1 
  } 
  
  return(out)
}

isIn(a = 3,b = 1:3) 
isIn(a = 1,b = 1:3) 

isIn(a = 2,b = 1:5)

debug(isIn)
isIn(a =25,b = 1:5)
undebug(isIn)


