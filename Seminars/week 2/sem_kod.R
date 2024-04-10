# Problem 4.2.2

# Lösningen
# x = -b/2a +- sqrt( b^2/(2a)^2 - c/a )

a <- -1
b <- 2
c <- 3

x1 <- -b/(2*a) + sqrt(b^2 / ( (2*a)^2 ) - c / a )
x1
x2 <- -b/(2*a) - sqrt(b^2 / ( (2*a)^2 ) - c / a )
x2

a*x1^2+b*x1+c
a*x2^2+b*x2+c

rotter <- function(a, b, c) {
  # Skriva ut värden på a b c
  cat(a, b, c)
  
  # Beräkna rot med +
  x1 <- -b/(2*a) + sqrt(b^2 / ( (2*a)^2 ) - c / a )
  
  # Beräkna rot med -
  x2 <- -b/(2*a) - sqrt(b^2 / ( (2*a)^2 ) - c / a )
  
  # Lägger rötter i en vektor
  svar <- c(x1, x2)
  
  # Returnera vektor 
  return( svar)
}
s <- rotter(-3,1,2)
s
rotter(c = 1, b = -3, a = 2)
?round

# 2.4.1
data("faithful")
?faithful
str(faithful)

faithful_list <- list()
faithful_list$eruptions <- faithful$eruptions
faithful_list$waiting <- faithful$waiting
str(faithful_list)

faithful_list1 <- list(
  eruptions = faithful$eruptions, 
  waiting = faithful$waiting
)
str(faithful_list1)

faithful_list2 <- list()
faithful_list2[[1]] <- faithful$eruptions
faithful_list2[[2]] <- faithful$waiting
str(faithful_list2)
names(faithful_list2) <- c("eruptions", "waiting")
str(faithful_list2)

faithful_list3 <- list()
faithful_list3[["eruptions"]] <- faithful$eruptions
faithful_list3[["waiting"]] <- faithful$waiting
str(faithful_list3)

faithful_list$eruptions
faithful$eruptions

faithful[,1]
faithful_list[[1]]

faithful[,"eruptions"]
faithful_list[["eruptions"]]


# 3.5.4 D1

xor_ny <- function(A, B){
  # Svarta
  eller <- A | B
  
  # Gröna
  och <- A & B
  
  # Röda
  inte_och <- !och
  
  # Blåa
  xor <- eller & inte_och
  
  return(xor)
}
xor_ny(TRUE, TRUE)
xor_ny(TRUE, FALSE)
xor_ny(FALSE, TRUE)
xor_ny(FALSE, FALSE)

# Uppgift: Skapa en funktion som tar in data från en 
# vector och beräknar medelvärde och varians och returnerar 
# resultatet i en lista. Använd inte inbyggda funktioner.

x <- c(1,2,3,5,7)
mean(x)

vv <- 1/length(x) * sum(x)

s2 <- 1/(length(x) - 1) * sum( (x - 1/length(x) * sum(x) )^2 )
# Alternativt
s2 <- 1/(length(x) - 1) * ( sum(x^2) - length(x) * (1/length(x)*sum(x))^2 )

beskrivande_statistik <- list(
  medelvarde = vv,
  varians = s2
)

statistik <- function(x) {
  
  n <- length(x)
  sx <- sum(x)
  sx2 <- sum(x^2)
  
  vv <- 1/n * sx
  
  s2 <- 1/(n - 1) * ( sx2 - n * vv^2 )
  
  beskrivande_statistik <- list(
    medelvarde = vv,
    varians = s2
  )
  
  return(beskrivande_statistik)
}
z <- c(1,2,3,5,7)
statistik(x = z)
statistik(x = seq( from=0, to=100, by = 2 ))
statistik(x = 1:100)
statistik(x = c("a","b"))
