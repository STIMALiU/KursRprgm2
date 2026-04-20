############################################################
# 732G33 – Programmering i R
# Föreläsning 4 (kursvecka 4)
#
# Funktioner, programmeringsteknik och R-paket
#
# Demo-kod för VT26
############################################################




## =========================================================
## 1. Mer om funktioner
## =========================================================


# notera: slumptal kommer mer kursvecka 5
# här används rnorm() för att generera slumptal från normalfördelningen
# för att få lite exempeldata
# set.seed() gör att vi får samma "slump" vid varje körning
# mer om detta nästa vecka

# skapar fyra dataset
set.seed(53)
data1 <- rnorm(100)
set.seed(33)
data2 <- rnorm(200)
set.seed(2233)
data3 <- rnorm(20)
set.seed(3)
data4 <- rnorm(50)

# kollar snabbt på data
head(data1)
head(data2)
head(data3)
head(data4)



# analyserar data:
mean(data1)
sd(data1)

mean(data2)
sd(data2)

mean(data3)
sd(data3)

mean(data4)
sd(data4)

# ofta vill vi slippa denna typ av upprepning av kod
# vi skriver en funktion...

compute_mean_sd <- function(x, na.rm = TRUE) {
  mean_value <- mean(x, na.rm = na.rm)
  sd_value   <- sd(x, na.rm = na.rm)
  stats<-c(mean = mean_value,sd   = sd_value)
  return(stats)
}

compute_mean_sd(data1)
compute_mean_sd(data2)
compute_mean_sd(data3)
compute_mean_sd(data4)


# Funktion som returnerar flera objekt via en lista
compute_summary <- function(x) {
  res_list<-list(
    mean = mean(x),
    sd   = sd(x),
    n    = length(x)
  )
  return(res_list)
}
# I mer komplexa funktioner med många olika "resultat" är det ofta smidigt att
# samla alla delar i en lista som returneras.

data_vector<-c(2,32,3,4,4,2,3,23,4)
result <- compute_summary(data_vector)
result
str(result)
result$mean


# Skydd mot felaktig indata
compute_summary <- function(x) {
  
  if (!is.numeric(x)) {
    stop("x must be a numeric vector")
  }
  
  if (length(x) < 3) {
    warning("Very few observations")
  }
  
  res_list<-list(
    mean = mean(x),
    sd   = sd(x),
    n    = length(x)
  )
  return(res_list)
}

compute_summary(rnorm(10))
compute_summary("hej")   # fel
compute_summary(c(2,5))        # varning


## =========================================================
## 2. Globala och lokala miljöer i R
## =========================================================

# Global variabel
global_value <- 10

use_global <- function(x) {
  return(x + global_value)
}

use_global(x = 5)


# Lokal variabel med samma namn
shadow_global <- function(x) {
  global_value <- 100  # lokal variabel
  x + global_value
}

shadow_global(x = 5)
print(global_value)
use_global(5)  # global_value är oförändrad


# Viktig poäng: undvik beroende av globala variabler
safe_function <- function(x, offset) {
  x + offset
}

safe_function(5, 10)


## =========================================================
## 3. Bra och effektiv kod
## =========================================================

# Dålig stil: upprepad kod
x1 <- rnorm(100)
mean(x1); sd(x1)

x2 <- rnorm(100)
mean(x2); sd(x2)


# Bättre: abstrahera med en funktion
compute_mean_sd(x1)
compute_mean_sd(x2)


# Effektivitet: vektorisering istället för loopar
large_vector <- rnorm(1e8)+30

system.time(mean(large_vector))

system.time({
  total <- 0
  for (i in seq_along(large_vector)) {
    total <- total + large_vector[i]
  }
  total / length(large_vector)
})


## =========================================================
## 4. R-paket
## =========================================================

# Paket innehåller återanvändbar kod som andra har skrivit
# install.packages("stringr")  # körs endast vid behov

library(stringr)

words <- c("apple", "pear", "banana")

str_detect(words, "a")
str_length(words)


# Visa var ett paket kommer ifrån
packageVersion("stringr")


## =========================================================
## 5. Dokumentation av kod
## =========================================================

# Grundläggande dokumentation via kommentarer
# - Vad gör funktionen?
# - Vilka argument används?
# - Vad returneras?



#' @title compute_summary: Summary statistics
#' @description
#' Computes mean, standard deviation and sample size.
#'
#' @param x Numeric vector
#' @param na.rm Logical, remove NA or not
#' 
#' 
#' @return A list with mean, sd and n


compute_summary <- function(x) {
  
  if (!is.numeric(x)) {
    stop("x must be a numeric vector")
  }
  
  if (length(x) < 3) {
    warning("Very few observations")
  }
  
  res_list<-list(
    mean = mean(x),
    sd   = sd(x),
    n    = length(x)
  )
  return(res_list)
}

compute_summary(x = data1)


## =========================================================
## 6. *apply-funktioner
## =========================================================

# Skapa en matris
set.seed(345)
data_matrix <- matrix(rnorm(20), nrow = 5)
data_matrix


# apply(): applicera funktion över rader eller kolumner i en matris/data.frame

# Medelvärde per rad
apply(X = data_matrix, MARGIN = 1, FUN = mean)

# Medelvärde per kolumn
apply(X = data_matrix, MARGIN = 2, FUN = mean)

# Standardavvikelse per kolumn
apply(data_matrix, 2, FUN = sd)


# Jämförelse med specialiserade funktioner
colMeans(data_matrix)


# Exempel: egen funktion med apply
range_length <- function(x) {
  max(x) - min(x)
}

z<-c(3,4,23,1,43,4)
range_length(x = z)


apply(X = data_matrix, MARGIN = 2, FUN = range_length)

data("trees")
?trees
apply(X = trees, MARGIN = 2, FUN = range_length)


list_data<-list(a=rnorm(n = 200),b=c(2,4),c=trees$Volume)

# använder compute_summary() från ovan
lapply(list_data, FUN = compute_summary)

# sapply försöker förenkla "svaret" om möjligt
sapply(list_data, FUN = compute_summary)
 

