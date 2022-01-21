# == Demo kod Föreläsning 1 == #
# == Johan Alenlöv == #

# == Variabler och vektorer == #

# Kan gör tilldelning åt båda hållen
a <- 1
2 -> b

a
b

a+b

# Värden sparas bara om man tilldelar dem
2*a # Multiplicerar a med 2, men tilldelar inte
a # a är fortfarande 1.

mittNamn <- "Johan" # CamelCase
mitt_namn <- "Johan" # snake_case

# Variabler ska skrivas ihop
mitt namn <- "Johan" # Funkar ej

# Tilldelning måste skrivas ihop
mitt_namn < - "Johan" # Funkar ej

min_vektor <- c("a","b","c","d")
mina_index <- c(1,2,1)

# Väljer på plats 1, 2, 1
min_vektor[mina_index]

# Skapar en vektor med alla heltal från 2 till 6
mina_tal <- 2:6
mina_tal

# Ger längden (antalet värden) i vektorn
length(mina_tal)

# Kolla vilken typ vi har
typeof(min_vektor)
typeof(mitt_namn)
typeof(mina_tal)
typeof(mina_index)

# Går att tvinga typer
a <- 1 # double
b <- as.integer(1) # integer
c <- 1L # integer, L efter gör talet till heltal

typeof(a)
typeof(b)
typeof(c)

# == Funktioner == #

# Skriv en funktion som tar ett tal och dubblerar det.

# Börjar med ett skal, det vi vill göra.
f <- function(x) {
  return(dubblerat)
}

# Gör något som fungerar först (utanför funktionen)
x <- 3
dubblerat <- 2*x

# Lyft in i funktionen
f <- function(x) {
  dubblerat <- 2*x
  return(dubblerat)
}

# Prova
f(1)
f(2)
f(-5)

# Kan spara värdet
val <- f(3)
val

# Lokal miljö
f <- function(x) {
  z <- 1
  w <- 3
  return(2*x)
  print("Hej!")
}
f(1)
z
w

## == Logik == ##

mina_bools <- c(TRUE,FALSE) # Skapar en vektor med sant och falskt
mina_bools
mina_bools <- c(T,F) # T, F fungerar lika bra
mina_bools

# Använda bools för att välja index
min_vektor = 4:7
min_vektor[mina_bools]

# Skapa bools från relationer
4 > 3
3 > 4

x <- T # sant
y <- F # falskt

!x # inte x
x & y # x och y
x | y # x eller y

x <- 1:10
y <- x != 5
z <- x > 2
x[!y & z]

index <- !y & z
index
x[index]

## == Markmyassignment == ##

# Installera paket genom att köra. Behöver bara göras EN gång
install.packages("markmyassignment")

# Aktivera paketet
library(markmyassignment)

# Välj vilka uppgifter
assignment_path <- file.path(system.file(package = "markmyassignment", "extdata", "example_assignment01.yml"))
set_assignment(assignment_path)

mark_my_assignment()

# Mandatory, my_name måste finnas
my_name <- "Johan Alenlöv"

# Task 1: Skapa en vektor med variablerna pi och e
pi # pi
exp(1) # e

task1 <- c(pi,exp(1)) # korrekt
mark_my_assignment("task1")

# Task 2: Skapa en funktion som returnerar summan av första och sista talet i en vektor. Input ska heta vector

task2 <- function(vector) {
  return(vector[1] + vector[length(vector)])
}

mark_my_assignment("task2")

# Rätta alla uppgifter

mark_my_assignment()
