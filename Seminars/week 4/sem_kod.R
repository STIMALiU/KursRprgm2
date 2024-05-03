?factor

vec <- c(rep("a",7), rep("b",3), rep("c",4))
vec
my_factors <- factor(vec)

levels(my_factors) <- c("1", "2", "3")
my_factors
relevel(my_factors, ref=2)

Apple <- read.table(file = "Apple.txt", sep=";", header = TRUE, dec = ".")
Apple2 <- read.csv2(file = "Apple.txt", dec = ".")

?read.csv

?write.csv

write.csv(x = Apple, file = "AppleSeminarie.csv", row.names = FALSE)
Apple3 <- read.csv(file = "AppleSeminarie.csv")

Apple3$Date <- factor(Apple$Date)

# 7. Pröva att skriva en for-loop som:
# (a) Summerar talen 0 till 200
# (b) Skriver ut “I love R!” 20 gånger
# (c) Skriver ut talen 1 till 20 och den kumulativa summan från 1 till 20 
# (d) Skriver ut alla jäma tal mellan 21 och 40. [Tips! ?%% och villkorssats]
summa <- 0
for (tal in 0:200) {
  summa <- summa + tal
}
print(summa)

for (i in 1:20) {
  print("I love R!")
}

for (i in rep(0,20)) {
  print("I love R!")
}

my_vec <- rep("I love R!", 20)
my_vec
for (text in my_vec) {
  print(text)
}

for (i in 1:length(my_vec)) {
  cat(my_vec[i], "\n")
}

my_str <- "Hej! \nJag gillar R!\t Efter tab"
my_str
cat(my_str)

cum_sum <- 0
for (tal in 1:20) {
  cum_sum <- cum_sum + tal
  cat("Talet är:", tal, "\tKumulativ summa:", cum_sum, "\n")
  
}

?paste

cum_sum <- 0
for (tal in 1:20) {
  cum_sum <- cum_sum + tal
  text <- paste("Talet är:", tal, "Kumulativ summa:", cum_sum)
  print(text)
}

for (tal in 21:40) {
  if(tal %% 2 == 0) {
    print(tal)
  }
}

## Med while

summa <- 0
for (tal in 0:200) {
  summa <- summa + tal
}
print(summa)

summa <- 0
tal <- 0
while(tal <= 200) {
  summa <- summa + tal
  tal <- tal + 1
}
print(summa)


antal_gånger <- 2
while (antal_gånger > 0) {
  print(paste("I love R!", "Gånger kvar", antal_gånger))
  antal_gånger <- antal_gånger - 1
}

cum_sum <- 0
tal <- 1
while(tal <= 20) {
  cum_sum <- cum_sum + tal
  cat("Talet är", tal, "Summa", cum_sum, "\n")
  tal <- tal + 1
}

tal <- 21
while(tal <= 40) {
  if (tal %% 2 == 0) {
    print(tal)
  }
  tal <- tal + 1
}


for (tal in 21:40) {
  if(tal %% 2 == 1) {
    next()
  }
  print(tal)
}

tal <- 21
while(tal <= 40) {
  if (tal %% 2 == 1) {
    tal <- tal + 1
    next()
  }
  print(tal)
  tal <- tal + 1
}

tal <- 20
while (tal < 40) {
  tal <- tal + 1
  if (tal %% 2 == 1) next()
  print(tal)
}

## Repeat

tal <- 0
summa <- 0
repeat{
  if (tal > 200) break()
  cat(tal, "\n")
  summa <- summa + tal
  tal <- tal + 1
}
summa


