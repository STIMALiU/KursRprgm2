

# Data.frame

# dataset -> ofta bra med data.frame -> skapad för att hantera tabelldata
# variabler (=kolumnerna) - kan vara av olika typ

# Lista

# samla ihop data/datastrukturer som hör ihop
# ofta användbart i funktioner

# Matris

# bra vid linjär algebra!



# Trigonometric Functions
# använder radianer
sin(pi)
cos(pi/2)


sin(pi)==0
sin(pi)<0.00000001

tol<-0.0001
abs(sin(pi))<tol


1.224647e-16
6.123234e-17

2e3
2*10^3

2e-3
2*10^-3


data("iris")
head(iris)
iris$Sepal.Width

# ------------------------------------------------------------------------------
# Läsa in data i R
# Vi fortsatte med demon om att läsa in data från föreläsning 2
# Koden nedan är kopierad från filen F2_demo.R
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Demo: Filhantering, Input och Output (I/O)
# ------------------------------------------------------------------------------


# /home/joswi05/Desktop/temp

?getwd
getwd()
dir()
# /home/joswi05/Dropbox/Josef/arbete/kurser/732G33_VT2025/KursRprgm2/Labs/DataFiles

setwd(dir = "/home/joswi05/Desktop/temp/")

# github: 
# https://raw.githubusercontent.com/STIMALiU/KursRprgm2/main/Labs/DataFiles/data1.txt

# -------------------------------------------------------------------------------------------
# input:
# -------------------------------------------------------------------------------------------

# exempelfilen ligger här:
# "https://raw.githubusercontent.com/STIMALiU/KursRprgm2/main/Labs/DataFiles/data1.txt"

path<-file.choose()
print(path)


path<-"/home/joswi05/Desktop/temp/data1.txt"
x1<-read.table(file = path,header = TRUE,sep = ";",dec = ",",)

x1<-read.table(file = "/home/joswi05/Desktop/temp/data1.txt",header = TRUE,sep = ";",dec = ",",)

x1

mean(x1$a3)
sd(x1$a3)

# ------------------------------------------------------------------------------




# ------------------------------------------------------------------------------
# Funktioner 
# vi gick igenom grunden i att skapa en funktion
# ------------------------------------------------------------------------------

# har en specifik uppgift, tex en beräkning

# måste ha ett namn: f

# function() -> hjälper oss att skapa en funktion 

# {}  -> funktions kod = "insidan på funktionen"

# anger argument (=input) innanför "()", tex (x)

# x - en numerisk vektor
# f ska beräkna summan av x och skicka tillbaka det värdet
f<-function(x){
  
  sum_val<-sum(x)
  
  # return() avslutar funktionen och skickar tillbaka värden/data
  return(sum_val)
}

# måste läsa in funktionen för att den ska gå att använda

y<-f(x = 1:100)
y














