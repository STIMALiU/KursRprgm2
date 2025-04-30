i_cirkel <- function(x,y) {
  
  avstand <- sqrt(x^2 + y^2)
  
  if(avstand <= 1) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

slumpa_punkt <- function() {
  x <- runif(n=1, min=-1, max=1) 
  y <- runif(n=1, min=-1, max=1)
  return(c(x,y))
}

estimera_pi <- function(N, seed = NULL) {
  
  if(!is.null(seed)) set.seed(seed)
  
  antal_innuti <- 0
  
  for(i in 1:N) {
    p <- slumpa_punkt()
    x <- p[1]
    y <- p[2]
    innuti <- i_cirkel(x,y)
    if(innuti) antal_innuti <- antal_innuti + 1
  }
  
  andelen <- antal_innuti / N
  
  
  pi_est <- andelen * 4
  
  print(pi_est)
  
}


