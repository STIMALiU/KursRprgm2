skottar <- function(ar) {
  if( !is.numeric(ar) ) stop("År måste vara en siffra")
  if( !is.integer(ar) ) {
    ar <- as.integer(ar)
    cat("Ändrare år till",ar)
  }
  if (ar %% 4 == 0) {
    if (ar %% 100 == 0) {
      if (ar %% 400 == 0) {
        return(TRUE)
      } else {
        return(FALSE)
      }
    } else {
      return(TRUE)
    }
  } else {
    return(FALSE)
  }
}
ar <- 2100
(ar %% 4 == 0) && (! ar %% 100 == 0 ) || (ar %% 400 == 0)

isPrime <- function(tal) {
  talIsPrime <- TRUE
  if (tal == 2) return(TRUE)
  for (p in 2:(tal-1)) {
    if (tal %% p == 0) {
      talIsPrime <- FALSE
      break()
    }
  }
  return(talIsPrime)
}

primes <- function(N) {
  primes <- c()
  tal <- 2
  while( length(primes) < N ) {
    if (isPrime(tal)) {
      # Ökar vektorn
      primes <- c(primes, tal)
    }
    tal <- tal + 1
  }
  return(primes)
}

primes <- function(N) {
  primes <- rep(0, times = N)
  primesFound <- 0
  tal <- 2
  while( primesFound < N ) {
    if (isPrime(tal)) {
      # Öka antal primtal
      primesFound <- primesFound + 1
      # Spara på rätt plats
      primes[primesFound] <- tal
    }
    tal <- tal + 1
  }
  return(primes)
}

primes <- function(N) {
  primes <- c()
  tal <- 2
  while (length(primes) < N) {
    # Testa om tal är ett primtal
    talIsPrime <- TRUE
    for (p in primes) {
      if (tal %% p == 0) {
        talIsPrime <- FALSE
        break()
      }
    }
    if (talIsPrime) {
      primes <- c(primes, tal)
    }
    tal <- tal + 1
  }
  
  return(primes)
}

primes <- function(N) {
  primes <- c()
  tal <- 2
  while (TRUE) {
    # Testa om tal är ett primtal
    talIsPrime <- TRUE
    for (p in primes) {
      if (tal %% p == 0) {
        talIsPrime <- FALSE
        break()
      }
    }
    if (talIsPrime) {
      primes <- c(primes, tal)
    }
    if (length(primes) == N) {
      break()
    }
    tal <- tal + 1
  }
  
  return(primes)
}

primes(3)
