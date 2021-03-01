#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# Exam solution 2019-03-29 732G33 732G83
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------



#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# 1: Kontrollstrukturer och datastrukturer
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------
# A: while_calc
#---------------------------------------------------------------------------------------------

while_calc<-function(n,type){
  iter<-0
  obs<-length(n)
  
  if(type=="sum"){
    sum_var<-0
    while(iter<obs){
      iter<-iter+1
      sum_var<-sum_var+n[iter]
    }
    return(sum_var)
    
  }else if(type=="prod"){
    prod_var<-1
    while(iter<obs){
      iter<-iter+1
      prod_var<-prod_var*n[iter]
    }
    return(prod_var)
    
  }
}

while_calc(n = 1:3,type = "sum")
while_calc(n = 1:3,type = "prod")
while_calc(n = 10:9,type = "prod")
while_calc(n = 10:9,type = "sum")
while_calc(n = c(2,4,2,10,3,3),type = "sum")
while_calc(n = c(2,4,2,10,3,3),type = "prod")


#---------------------------------------------------------------------------------------------
# B: data_struct(type)
#---------------------------------------------------------------------------------------------

data_struct<-function(type){
  if(type=="vector"){
    x<-rep(3:1,each=4)
    return(x)
  }else if(type=="matrix"){
    x<-matrix(LETTERS[1:12],3,4)
    return(x)
  }else if(type=="list"){
    x<-list(e1=c(1,20,87),e1=c(TRUE,FALSE,FALSE,FALSE),e3=(10*(1:10))^2)
    return(x)
  }else{
    stop("not supported")
  }
}

A<-data_struct(type="vector") 
A
data_struct(type="matrix") 
data_struct(type="list") 
data_struct(type = "hej") 
data_struct(type = "data.frame")
data_struct(type = "xyz")



#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# 2: Spektralt?theter f?r autoregressiva modeller
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------

my_spec<-function(f,sigma2,phi){
  no_obs<-length(f)
  if(is.null(phi)){
    s<-rep(sigma2,no_obs)
    
  }else if(length(phi)==1){ 
    s<-sigma2/(1+phi[1]^2-2*phi[1]*cos(2*pi*f))
  } else if(length(phi)==2){
    
    denominator<-1+phi[1]^2+phi[2]^2-2*phi[1]*(1-phi[2])*cos(2*pi*f)-2*phi[2]*cos(4*pi*f)
    s<-sigma2/denominator
    
  }else{
    stop("phi is too long")
  }
  return(s)
}

freq1<-seq(0,0.5,length=5) 

my_spec(f = freq1,sigma2 = 2,phi = c(1,2,3)) 

my_spec(f = freq1,sigma2 = 2,phi = NULL) 

my_spec(f = freq1,sigma2 = 2,phi = 0.7) 

my_spec(f = freq1,sigma2 = 2,phi = c(0.7,-0.1)) 

freq2<-seq(0,0.5,length=200) 
s1<-my_spec(f = freq2,sigma2 = 1,phi = c(0.9,-0.8)) 
plot(freq2,s1,t="l") 
s2<-my_spec(f = freq2,sigma2 = 0.5,phi = c(0.9)) 
plot(freq2,s2,t="l") 
s3<-my_spec(f = freq2,sigma2 = 0.5,phi = c(-0.6))
plot(freq2,s3,t="l") 
s4<-my_spec(f = freq2,sigma2 = 10,phi = c(0.3,0.3)) 
plot(freq2,s4,t="l") 
s5<-my_spec(f = freq2,sigma2 = 4,phi = NULL) 
plot(freq2,s5,t="l")



#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# 3: Strängar
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------

library(stringr)
# alt 1:
ploy_derivative<-function(f){
  if(!is.character(f)) stop("f is not a string!")
  index1<-str_locate(string = f,pattern = "[0-9]+")   
  a<-as.numeric(str_sub(string = f,start = index1[1],end = index1[2]))
  index2<-str_locate(string = f,pattern = "\\^")+1   
  n<-as.numeric(str_sub(string = f,start = index2[1],end = index2[2])) 
  an<-a*n   
  new_n<-n-1   
  der<-str_c("dy/dx=",an,"x^",new_n)   
  return(der) 
} 

# alt 2:
ploy_derivative <- function(f){
  if(!is.character(f)) stop("f is not a string!")  
  #Kontrollera att f ?r en str?ng
  val <- unlist(strsplit(f,split='x^', fixed=TRUE))
  #Splittar strängen f i två. första värdet är på "a" och andra värdet är då "n".
  val <- as.numeric(val)
  #skapar a * n samt n-1.
  an <- val[1] *val[2]
  n1 <- val[2]-1
  # s?tter ihop
  ret<- paste("dy/dx=", an, "x^",n1, sep = "")
  #skapar en returnstr?ng med ing?ende delar.
  return(ret)
}



ploy_derivative(f = 33)
ploy_derivative(f = TRUE)
a<-ploy_derivative(f = "3x^1")
str(a)
a
ploy_derivative(f = "2031x^2") 
ploy_derivative(f = "25x^3") 
ploy_derivative(f = "8x^9")
ploy_derivative(f = "12345x^4")



#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# 4: Indexera listor
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------

list_index<-function(X,index_list){
  N<-length(X)
  M<-length(index_list)
  if(!is.list(X)) stop("X is not a list")
  if(!is.list(index_list)) stop("index_list is not a list")
  if(N!=M) stop("list length mismatch")
  Y<-vector("list",N)
  names(Y)<-names(X)
  for(i in 1:N){
    Y[[i]]<-X[[i]][index_list[[i]]]
  }
  return(Y)
}

a1<-list((1:10)*3) 
index1<-list(c(10,2,3)) 

# testa felmeddelanden:
list_index(X = a1,index_list = TRUE) 
list_index(X = "abc",index_list = index1) 
list_index(X = a1,index_list = list(1,2,3,4))

# fall 1
list_index(X = list(c(1,5,7)),index_list = list(c(1,3))) 
#l1<-list(c(1,7))
#l1

# fall 2:
b1<-list_index(X = a1,index_list = index1) 
b1 
#list(c(30,6,9))

# fall 3:
data("trees") 
a2<-as.list(trees) 
index2<-list(1:3,31:28,c(3,4)) 
b2<-list_index(X = a2,index_list = index2) 
str(b2) 

# fall 4:
data("AirPassengers") 
a3<-list(a=month.name,b=1:5,c=as.vector(AirPassengers)[1:20],sqrt(1:10)) 
index3<-list(c(12,9),5:3,c(1,3,5,20),c(2,5,9)) 
b3<-list_index(X = a3,index_list = index3) 
str(b3)


#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# 5: Datum och Grafik
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
library(ggplot2)
library(lubridate)

path<-"/home/joswi05/Dropbox/Josef/732G33_VT2020/KursRprgmTeacher/Exams/732G33 exam 2020-06-09/coffee_data.csv"

coffee<-read.csv(file = path,stringsAsFactors = FALSE)
head(coffee)
dim(coffee)


head(coffee)
coffee[,1]<-as.Date(coffee[,1])
colnames(coffee)
str(coffee)

# Del A: 
ggplot(data = coffee,aes(x=date,y=coffee))+geom_line(col="red")

# Del B:

coffee$month<-month(coffee$date,label = TRUE)
ggplot(data=coffee,aes(x=month,y=coffee))+geom_boxplot(fill="blue")


# Del C: 
# R?kna ut medianen f?r antalet s?lda koppar kaffe p? vardagar och f?r helger. 
# Spara dessa v?rden i tv? variabler. 

# s?tter att veckan ska starta p? m?ndagar 
d_info<-wday(coffee$date,week_start = 1,label = FALSE)
weedend_index<-d_info==6 | d_info==7 # skapar index f?r l?rdag och s?ndag
D<-aggregate(x = coffee$coffee,list(weedend_index),FUN=median)
weekend_med<-D[2,2]
weekday_med<-D[1,2]

weekend_med
weekday_med

