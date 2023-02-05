
# På inlämningsuppgiften leap_year():

# Hur gör man för att få years till en numerisk vektor?

x<-as.numeric("1993abc")
print(x)
is.numeric(x)
x<-as.numeric("1993abc")
is.numeric(x)
print(x)


# Övningsuppgifter:

# 2.4 * Extraproblem
rm(list=ls())

data(rock)
dim(rock)

head(rock,4)

new_shape<-rock$peri/sqrt(rock$area)

rock$new_shape<-new_shape

head(rock)

rock$peri[1]/sqrt(rock$area[1])

plot(rock$shape,rock$new_shape)



# 1.2 Indexering av matriser, uppgift 2

# skapa en test matris
a<-rep(c(1,2,3,4,5),10)
b<-1:50
c<-(1:50)^2
d<-log(1:50)
stor_matris <- cbind(a,b,c,d)
dim(stor_matris)
head(stor_matris,10)

# testar metoden
index_mat<-matrix(c(5,2,4,1),2)
index_mat
stor_matris[index_mat]

stor_matris[1:6,]

# a)
index_mat<-rbind(c(4,4),c(5,3),c(2,1))
index_mat
stor_matris[index_mat]


Aa._1<-2

hej_hopp

hejHopp

#-------------------------------------------------------------------------------

# kort om kodstil (mer om det senare kursen)

# använd lämpliga namn på variabler och funktioner
# använd lämplig indentering
# placera "{" och "}" på rätt ställen i koden
# ha lagom med luft i koden
# kommentera koden -> det ska vara lätt att förstå vad som händer


my_func<-function(x){
  # steg 1: ...
  x2<-2^2-10
  
  # steg 2: ..
  x3<-sin(x2)
  
  return(x3)
}


#-------------------------------------------------------------------------------
# öva på funktioner och problemlösning

#-------------------------------------------------------------------------------
# min funktion för medelvärde
#-------------------------------------------------------------------------------

# beräkna medelvärde utan att använda funktionen mean()
# -> vi skriver en egen funktion!



z<-1:5
z
sum(z)

length(z)

z_sum<-sum(z)
n<-length(z)
n
z_sum/n
mean(z)

my_mean<-function(z){
  # summerar vektorn:
  z_sum<-sum(z)
  # antal element i vektorn:
  n<-length(z)
  # beräknar medelvärde:
  z_bar<-z_sum/n
  
  return(z_bar)
}

my_mean(z = 30:100)


