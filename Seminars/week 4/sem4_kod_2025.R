



#-------------------------------------------------------------------------------
# apply()-funktioner: kodexempel
#-------------------------------------------------------------------------------


?lapply

A<-list(x1=c(1,2,6),x2=c(21,53,12,211,12,2,NA),x3=1:30,x4=-20:1)
A
B<-lapply(X=A,FUN=mean,na.rm=TRUE)
B

sapply(X=A,FUN=mean,na.rm=TRUE)

lapply(X=A,FUN=length)





?apply

data("iris")

head(iris)
dim(iris)
# över kolumner
apply(X = iris[,1:4],MARGIN = 2,FUN = mean)

apply(X = iris[,1:4],MARGIN = 2,FUN = median)
apply(X = iris[,1:4],MARGIN = 2,FUN = sd)
apply(X = iris[,1:4],MARGIN = 2,FUN = quantile)
apply(X = iris[,1:4],MARGIN = 2,FUN = quantile,probs=c(0.25,0.75))


f<-function(x){
  y<-sum(x^2)
  return(y)
}

apply(X = iris[,1:4],MARGIN = 2,FUN = f)
apply(X = iris[,1:4],MARGIN = 2,FUN = function(x){sum(x^2)})



# över rader
apply(X = iris[,1:4],MARGIN = 1,FUN = sum)




# tapply: grupperade beräkningar baserat på ett index

?tapply()
data("ChickWeight")
?ChickWeight
head(ChickWeight,n = 20)
tapply(X=ChickWeight$weight, INDEX=ChickWeight$Chick, FUN=mean)
tapply(X=ChickWeight$weight, INDEX=ChickWeight$Diet, FUN=mean)

tapply(X=ChickWeight$weight, INDEX=ChickWeight$Chick, FUN=median)
tapply(X=ChickWeight$weight, INDEX=ChickWeight$Diet, FUN=median)



#-------------------------------------------------------------------------------
# Dokumentation, funktionshuvuden, roxygen2 
#-------------------------------------------------------------------------------

# vi pratade om funktionshuvuden och roxygen2.

# nedan följer ett exempel på ett funktionshuvud med roxygen2 som vi skapade live.


#' @title group_calc
#'
#' @description 
#' Beräknar grupperade värden på en data.frame baserat på en kategorisk
#' grupperingsvariabel. Funktionen beräknar grupperade medelvärden och grupperade
#' standardavvikelser
#'
#' @param dataset data.frame med data, ska innehålla numeriska variabler (för grupperade beräkningar)
#' och en kategorisk variabel som används för att skapa grupperingen
#' 
#' @param group_var_id numeriskt index för den grupperande variabel, ska vara character, factor eller heltal
#' 
#' @param id heltals-vektor, index för variabler i dataset som väljer ut variabler för grupperade beräkning 
#'
#' @return lista med två element, första elementet är en data.frame med 
#' grupperade medelvärden och andra elementet är en data.frame med grupperade
#' standardavvikelser
#' 



group_calc <- function(dataset,group_var_id,id){
  data_temp<-dataset[,id]
  A<-aggregate(x = data_temp,by=list(dataset[,group_var_id]),FUN=mean)
  B<-aggregate(x = data_temp,by=list(dataset[,group_var_id]),FUN=sd)
  return(list(mean=A,sd=B))
}

# testar funktionen
colnames(iris)
head(iris)
group_calc(dataset = iris,group_var_id = 5,id = 1:2)

group_calc(dataset = iris,group_var_id = 5,id = c(2,4))

#-------------------------------------------------------------------------------





#-------------------------------------------------------------------------------
# do.call()
#-------------------------------------------------------------------------------


d0<-mean(x = 1:10,trim = 0, na.rm = FALSE)
d0
mean(x=1:10)

my_args<-list(x=1:10, trim = 0, na.rm = TRUE)
my_args<-list(x=1:10)

d<-do.call(what = mean,args = my_args)
d





#-------------------------------------------------------------------------------
# funktioner vs loopar
#-------------------------------------------------------------------------------


# loopar - används för upprepade beräkningar

# funktioner - samling kod som utför en specifik uppgift 


# funktioner kan använda loopar av olika slag
# loopar kan använda olika funktioner i iterationer/upprepningarna





#-------------------------------------------------------------------------------
# Inläsning av data
#-------------------------------------------------------------------------------

# vi pratade om working directory och sökvägar
getwd()
setwd(dir = "/home/joswi05/Desktop/temp/")
getwd()
dir()
dir(path = "/home/joswi05/Dropbox/Josef/arbete/kurser/732G33_VT2025/KursRprgm2/Lectures/")


temp_data<-iris[1:10,1:3] # skapar ett dataset som jag vill skriva till hårddisk

write.csv(x = temp_data,file = "temp_iris.csv")  # var hamnar den sparade filen?

write.csv(x = temp_data,file = "/min sökväg till en annan mapp/temp_iris.csv")





#-------------------------------------------------------------------------------
# Utmaning
#-------------------------------------------------------------------------------
# 1) ladda ner filen HUS_eng.csv och spara lokalt på datorn
# filen finns här: https://github.com/STIMALiU/KursRprgm2/tree/main/Labs/DataFiles
#
# 2) Läs in filen i R
#
# 3) Beräkna grupperade medianer för priset på huset baserat på om huset har
# en pool eller ej
# (det är likt uppgifter som kan komma på tentan)



# om möjligt, försök att lösa detta på under 10 min.
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
#
#
#
#
#

# klicka på filnamnet, klicka på "raw", spara ner filen som csv-fil och spara på datorn i en lokal mapp

# läs in data i R
# öppna filen, undersök vilka tecken som används för att separera värden och som decimaltecken
# identifiera en lämplig funktion för inläsning
# hitta sökvägen till filen:
# /home/joswi05/Desktop/temp/    (i mitt fall)

# sätt ihop sökvägen med filnamnet:
path<-"/home/joswi05/Desktop/temp/HUS_eng.csv"
# läs in data
D<-read.csv(file = path,header = TRUE,)

# kolla så att data är korrekt inläst
head(D,n = 10)



# Beräkna grupperade medianer för priset på huset baserat på om huset har  en pool eller ej
# detta kan göras på olika sätt


# alt 1:
aggregate(x = D$price,by=list(D$pool),FUN=median)

# alt 2:
tapply(X = D$price, INDEX = D$pool, FUN = median)

# alt 3:
median_no_pool<-median(D$price[D$pool==0])
median_pool<-median(D$price[D$pool==1])
c(median_no_pool,median_pool)
