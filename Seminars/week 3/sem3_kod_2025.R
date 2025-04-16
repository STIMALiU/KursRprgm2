#-------------------------------------------------------------------------------
# vi gick igenom debugging från föreläsning 3 + koden för debugging för 
# förläsning 3
#-------------------------------------------------------------------------------



#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Vi löste uppgiften:
# Skriv en funktion som beräknar medelvärdet av en numerisk vektor x.
# funktionerna sum() eller mean() är inte tillåtna
#-------------------------------------------------------------------------------

# lösning längre ner
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#

m <- function(x){
  # tar reda på antal observationer i vektorn x
  n<-length(x)
  sum_val<-0 # en summeringsvariabel som börjar med värdet 0
  # for-loop som summerar elementen i x och sparar i sum_val
  for(i in x){
    sum_val<-sum_val+i 
  }
  # beräknar medelvärde
  mean_val<-sum_val/n
  return(mean_val) # returnerar det beräknade medelvärdet
}

# testar
m(x = 1:100)
m(x = c(32,3,12,2,34,43,4,34))


#-------------------------------------------------------------------------------




#-------------------------------------------------------------------------------
# Listor
# enkla och dubbla "[" -> vad är skillnaden?

my_list<-list(a1=1:10,a2=matrix(1:4,2,2),a3=TRUE)

x<-my_list[1]
x
is.list(x)
y<-my_list[[1]]
y[5]
my_list[[1]][5]

is.list(y)
is.vector(y)

z<-my_list[1:2]


#-------------------------------------------------------------------------------



#-------------------------------------------------------------------------------
# läsa in data


# Mål: läsa in ett dataset som handlar om olika försäljningar av hus.

# steg 1: hitta data på Internet
# kolla här: https://github.com/STIMALiU/KursRprgm2/tree/main/Labs/DataFiles
# hitta filen HUS_eng.csv

# steg 2: undersöka data lite (titta på datasetet om möjligt)
# steg 3: ladda ner till en lokalmapp på egen dator
# steg 4: öppna filen som en vanlig textfil: undersöka vilka tecken som används
# för att separera värden och som decimaltecken

# steg 5: hitta sökvägen till filen och kombinera med filens namn:
path_hus_data<-"/home/joswi05/Desktop/temp/HUS_eng.csv"

# steg 6: läs in data med lämplig funktion
hus<-read.csv(file = path_hus_data,sep = ",")

# steg 7: undersök om data lästes in korrekt
head(hus)


#-------------------------------------------------------------------------------




#-------------------------------------------------------------------------------
# Datorlaboration 2: 3.5 * Extraproblem
#-------------------------------------------------------------------------------
# 

# läs in mtcars!
data(mtcars)
head(mtcars)
?mtcars

# a)
carName<-rownames(mtcars)
is.factor(carName)
is.character(carName)

# b)
# Gör om variabeln som beskriver huruvida bilen har automatisk eller 
# manuell växellåda till en faktorvariabel med etiketterna 
# “Automatisk” och “Manuell”.
mtcars$am
is.factor(mtcars$am)
is.integer(mtcars$am)

am_temp<-factor(mtcars$am)
levels(am_temp)<-c("Automatisk", "Manuell")
am_temp
#-------------------------------------------------------------------------------



