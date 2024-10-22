# Uppgift 1 estimate_gamma


estimate_gamma <- function(x, na.rm){
  # Argumenten är x och na.rm
  
  # na.rm (Ta bort NA värden)
  
  index_of_na <- is.na(x)
  if(na.rm) {
    x <- x[!index_of_na]
  } else {
    if (any(index_of_na)) {
      return(NA)
    }
  }
  
  # Se till att alla värden är positiva
  
  if(any(x <= 0)) stop("All x must be positive!")
  
  
  
  # Beräkna k och theta
  
  N <- length(x)
  
  # k_bar
  
  k_bar_t <- N * sum(x)
  
  k_bar_n1 <- N * sum(x * log(x))
  k_bar_n2 <- sum(log(x))
  k_bar_n3 <- sum(x)
  
  k_bar <- k_bar_t / ( k_bar_n1 - k_bar_n2 * k_bar_n3 )
  
  # k_hat
  
  k_hat <- k_bar - 1/N * ( 3*k_bar - 2/3 * ( k_bar / (1 + k_bar) ) - 4/5 * ( k_bar / (1 + k_bar)^2 ) )
  
  # theta
  
  theta_1 <- N * sum(x * log(x))
  theta_2 <- sum(log(x))
  theta_3 <- sum(x)
  
  theta_hat <- (N / (N-1)) * (1 / N^2) * (theta_1 - theta_2 * theta_3)

  # Returnera
  
  output <- list(
    N = N,
    k_hat = k_hat,
    theta_hat = theta_hat,
    x = x
  )
  
  return(output)
}



# Uppgift 2
library(stringr)

text <- "hej"

change_letters <- function(text, first = TRUE, last = TRUE){
  # Alternativ 1:
  # Skapa en text med bara stora bokstäver
  # Byt ut om det behövs
  text_upper <- str_to_upper(text)
  
  # Första bokstaven
  if (first){
    first_letter <- str_sub(text_upper, start = 1, end = 1)
    text <- str_replace(string = text, pattern = "^(.)", replacement = first_letter)
  }
  # Sista bokstaven
  if (last){
    last_letter <- str_sub(text_upper, start = -1, end = -1)
    text <- str_replace(string = text, pattern = "(.)$", replacement = last_letter)
  }
  
  return(text)
}


# Alternativ 2:
# Skapa text med stor bokstav om det behövs

change_letters <- function(text, first = TRUE, last = TRUE) {
  
  if(first) {
    str_sub(text, start = 1, end = 1) <- str_to_upper(str_sub(text, start = 1, end = 1))
  }
  
  if(last) {
    str_sub(text, start = -1, end = -1) <- str_to_upper(str_sub(text, start = -1, end = -1))
  }
  
  return(text)
}




# Upgift 3
# A
tol = 0.001
l = 1
w = 1


while_func <- function(tol, l, w){
  t <- 0
  y_new <- exp(-l*t) * cos(w*t)
  y_old <- y_new + 2*tol
  while(abs(y_new - y_old) >= tol) {
    t <- t + 1
    y_old <- y_new
    y_new <- exp(-l*t) * cos(w*t)
  }
  
  res <- list(
    iter = t-1,
    y_last = y_new,
    y_second_last = y_old
  )
  
  return(res)
}

# B


matrix_func <- function(n, m) {
  
  # Skapa en tom matris
  mat <- matrix(data = NA, nrow = n, ncol = m)
  # Loopa igenom matrisen
  for(i in 1:n){
    for(j in 1:m){
      # Beräkna (i*j)^2
      val <- (i*j)^2
      # Testa om det är jämnt delbart med 4
      if (val %% 4 == 0) {
        mat[i,j] <- val
      } else {
        mat[i,j] <- 0
      }
      # Lägg in noll om så inter är fallet
    }
  }
  
  return(mat)
  
}


matrix_func <- function(n, m) {
  
  # Skapa en tom matris
  mat <- matrix(data = NA, nrow = n, ncol = m)
  # Loopa igenom matrisen
  for(i in 1:n){
    for(j in 1:m){
      mat[i,j] <- (i*j)^2
      
      if(mat[i,j] %% 4 != 0) {
        mat[i,j] <- 0
      }
    }
  }
  
  return(mat)
  
}



