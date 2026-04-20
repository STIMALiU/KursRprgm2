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


set.seed(53)
data1 <- rnorm(100)
mean(data1)
sd(data1)

set.seed(33)
data2 <- rnorm(200)
mean(data2)
sd(data2)

set.seed(2233)
data3 <- rnorm(20)
mean(data3)
sd(data3)


set.seed(3)
data4 <- rnorm(50)
mean(data4)
sd(data4)

# En enkel funktion med argument och returvärde
compute_mea <- function(x, na.rm = TRUE) {
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

result <- compute_summary(data_vector)
result
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
# compute_summary("hej")   # fel
compute_summary(c(2,5))        # varning


## =========================================================
## 2. Globala och lokala miljöer i R
## =========================================================

# Global variabel
global_value <- 10

use_global <- function(x) {
  return(x + global_value)
}

use_global(5)


# Lokal variabel med samma namn
shadow_global <- function(x) {
  global_value <- 100  # lokal variabel
  x + global_value
}

shadow_global(5)
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
large_vector <- rnorm(1e6)+30

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
#' @return A list with mean, sd and n
compute_summary <- function(x, na.rm = TRUE) {
  
  if (!is.numeric(x)) {
    stop("x must be numeric")
  }
  
  list(
    mean = mean(x, na.rm = na.rm),
    sd   = sd(x, na.rm = na.rm),
    n    = length(x)
  )
}

compute_summary(rnorm(50))


## =========================================================
## 6. *apply-funktioner
## =========================================================

# Skapa en matris
set.seed(345)
data_matrix <- matrix(rnorm(20), nrow = 5)
data_matrix


# apply(): applicera funktion över rader eller kolumner

# Medelvärde per rad
apply(data_matrix, 1, mean)

# Standardavvikelse per kolumn
apply(data_matrix, 2, sd)


# Jämförelse med specialiserade funktioner
colMeans(data_matrix)


# Exempel: egen funktion med apply
range_length <- function(x) {
  max(x) - min(x)
}

apply(data_matrix, 2, range_length)
