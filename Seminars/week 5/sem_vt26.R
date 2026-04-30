# Skatta pi

# Slumpa en punkt i kvadraten
# Slumpa ett x-värde uniformt
# Slumpa ett y-värde uniformt
slumpa_punkt <- function(d) {
  x_coord <- runif(n = 1, min = 0, max = d)
  y_coord <- runif(n = 1, min = 0, max = d)
  punkt <- c(x_coord, y_coord)
  return(punkt)
}

# Är punkten i en cirkel
i_cirkel <- function(punkt, d) {
  x <- punkt[1]
  y <- punkt[2]
  vl <- (x - d/2)^2 + (y - d/2)^2
  hl <- (d/2)^2
  return(vl <= hl)
}

# Funktion som upprepar detta ett visst antal 
# gånger och beräknar medelvärdet
estimera_pi <- function(N, d, my_seed = NULL) {
  if(!is.null(my_seed)) set.seed(my_seed)
  
  # Skapa vektor för att spara resultat
  resultat <- rep(FALSE, N)
  
  for(i in 1:N) {
    # Slumpa punkt
    punkt <- slumpa_punkt(d)
    # Kolla om innuti cirkeln
    innuti <- i_cirkel(punkt, d)
    # Spara resultat
    resultat[i] <- innuti
  }
  
  # Beräkna sannolikhet
  sannolikhet <- mean(resultat)
  
  # Estimera pi
  pi_est <- 4 * sannolikhet
  
  # Returnera pi
  return(pi_est)
}






