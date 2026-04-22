#-------------------------------------------------------------------------------
# funktionen nedan innehåller buggar -> försök att rätta funktionen så att
# den fungerar korrekt! (längre ner finns en funktion som är delvis rättad)
#-------------------------------------------------------------------------------
x<-1:12
n <- length(x)
x_sum <- 1
my_sd <- function(x){
  n <- length(x)
  
  x_bar <- mean(x)
  
  x_diff_sq <- (x - x_bar)^2
  
  var <- sum(x_diff_sq)/(n - 1)
  
  sd_val <- sqrt(var)
  
  return(list(mean = x_bar, 
              sd = sd_val, 
              n = n))
}
my_sd(x = 1:5)


my_sd2 <- function(x) {
  # Beräkna medelvärde, skillnad i kvadrat, roten
  x_bar <- 1
  sd_val <- -1
  n <- -1
  # Return lista med medelvärde, standardavvikelse och antal datapunkter
  return(list(mean = x_bar, sd = sd_val, n = n))
}

# While-loop uppgift
# Fibonacci tal mindre än 200

f_0 <- 0
f_1 <- 1
while(f_1 < 200) {
  print(f_1)
  f_next <- f_0 + f_1
  
  f_0 <- f_1
  f_1 <- f_next
}

while_1 <- TRUE
f_0 <- 0
f_1 <- 1
while(while_1) {
  f_next <- f_0 + f_1
  
  if(f_next > 200) {
    while_1 <- FALSE
  }
  
  print(f_next)
  f_0 <- f_1
  f_1 <- f_next
}

f_0 <- 0
f_1 <- 1
while(TRUE) {
  f_next <- f_0 + f_1
  
  if(f_next > 200) {
    break
  }

  print(f_next)
  f_0 <- f_1
  f_1 <- f_next
}



# Skriva ut varannan siffra i en lista
x <- c("a", "b", "c", "d", "e")
to_print <- TRUE
for(val in x) {
  if(to_print) {
    to_print <- FALSE
  } else {
    to_print <- TRUE
    next
  }
  
  print(val)
}

isPrime <- function(tal) {
  
  if(tal == 2) return(TRUE)
  
  for(p in 2:(tal-1)) {
    if(tal %% p == 0) {
      return(FALSE)
    }
  }
  
  return(TRUE)
}

isPrime <- function(tal) {
  # Måste ta hand om 2 separat
  if(tal == 2) return(TRUE)
  
  primtal <- TRUE
  
  for(p in 2:(tal-1)) {
    if(tal %% p == 0) {
      primtal <- FALSE
      break
    }
  }
  
  return(primtal)
}


