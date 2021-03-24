#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# Exam solution 2019-03-29 732G33
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# 
library(markmyassignment)
library(testthat)
# 
# set_assignment(path = "/home/joswi05/Dropbox/Josef/732G33_VT2020/KursRprgmTeacher/Exams/732G33 exam 2020-06-09/tests/mark_test.yml")
# 
# #---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# 1: Kontrollstrukturer och datastrukturer
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------
# A: while_list()
#---------------------------------------------------------------------------------------------


while_list<-function(x){
  res_list<-vector("list",3)
  cond<-TRUE
  index<-1
  while(cond){
    y<-x[index]
    if(y%%2==0){
      res_list[[1]]<-c(res_list[[1]],y)
    }
    if(y%%3==0){
      res_list[[2]]<-c(res_list[[2]],y)
    }
    if(y%%5==0){
      res_list[[3]]<-c(res_list[[3]],y)
    }
    index<-index+1
    if(index>length(x)){
      cond<-FALSE
    }
  }
  return(res_list)
}

while_list(x = 13)
a<-while_list(x = 3)
a
while_list(x = c(2,4))
while_list(x = c(5,25,35))
while_list(x = 1:12)
while_list(x = 25:35)


#---------------------------------------------------------------------------------------------
# B: mat_func()
#---------------------------------------------------------------------------------------------

mat_func<-function(n,m){
  mat<-matrix(0,n,m)
  for(i in 1:n){
    for(j in 1:m){
      mat[i,j]<-((-1)^(i+1))/(j+i)
    }
  }
  return(round(mat,3))
}

A<-mat_func(n = 2,m = 3)
A
mat_func(n = 4,m = 3)
mat_func(n = 1,m = 1)
mat_func(n = 1,m = 8)
mat_func(n = 3,m = 1)
mat_func(n = 3,m = 5)


#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# 2: Dubbelsidiga konfidensinterval
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------

my_conf<-function(x,alpha){ 
  z_prob<-1-alpha/2   
  z<-qnorm(z_prob)   
  n<-length(x)   
  x_bar<-mean(x)   
  if(all(x==1|x==0)){     
    SE<-sqrt((x_bar*(1-x_bar))/n)     
    lower_ki<-x_bar-z*SE     
    upper_ki<-x_bar+z*SE   
  } else{     
    SE<-sd(x)/sqrt(n)
    lower_ki<-x_bar-z*SE     
    upper_ki<-x_bar+z*SE   
  }   
  return(c(lower_ki,upper_ki)) 
}

set.seed(322)
a1<-rnorm(100,3,4)
b1<-rbinom(n = 75,size = 1,prob = 0.8)

a2<-c(19,12,32,42,53,22,43,11,12,45)
b2<-c(0,1,1,1,1,0,0,0,1,1,0,1,0,0,1,0,0,0,0)

ci1<-my_conf(x = a1,alpha = 0.05) 
ci1
my_conf(x = a2,alpha = 0.01)
my_conf(x = a1,alpha = 0.001) 
my_conf(x = b1,alpha = 0.1) 
my_conf(x = b2,alpha = 0.05)



#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# 3: Datum och strängar
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
library(stringr)
library(lubridate)


date_count<-function(date1,date2,unit){
  if(!is.character(date1)) stop("date1 is not character")
  if(!is.character(date2)) stop("date2 is not character")
  date1<-ymd(date1)
  date2<-ymd(date2)
  my_interval<-interval(start = date1,end = date2)
  
    if(unit=="week"){
      suppressMessages({
      date_val<-my_interval%/%weeks(1) 
      })
    }else if(unit=="month"){
      suppressMessages({
      date_val<-my_interval%/%months(1)
      })
    }else{
      stop("wrong format of unit")
    }
  
  if(unit=="week"){
    res<-str_c("date1: ",date1," date2: ",date2," weeks: ",date_val," seconds: ",as.numeric(dweeks(date_val)))
  }else if(unit=="month"){
    res<-str_c("date1: ",date1," date2: ",date2," months: ",date_val)
  }
  return(res)
}


D<-date_count(date1 = "2020-08-3",date2 = "2020-08-7",unit = "week") 
class(D)
D
date_count(date1 = "2020-08-3",date2 = "2020-08-10",unit = "week") 

date_count(date1 = "2020-08-3",date2 = "2020-08-17",unit = "week") 

date_count(date1 = "2020-04-14",date2 = "2020-09-29",unit = "week") 

date_count(date1 = "2020-08-01",date2 = "2020-08-31",unit = "month") 

date_count(date1 = "2020-08-01",date2 = "2020-09-01",unit = "month") 

date_count(date1 = "1930-02-18",date2 = "1999-09-10",unit = "month")

date_count(date1 = TRUE,date2 = "2020-08-31",unit = "week") 
date_count(date1 = "2020-08-3",date2 = 1:10,unit = "week") 
date_count(date1 = "2020-08-3",date2 = "2020-08-31",unit = "day") 
date_count(date1 = "2020-08-3",date2 = "2020-08-31",unit = 233.1) 



#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# 4: Binomialfördelningen
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------

my_binom<-function(x,n,p,cdf){
  if(n<0) stop("n is negative")
  if(x<0) stop("x is negative")
  
  binom_pdf <- function(x,n,p){
    if(x < 0 | x > n) stop()
    comb <- (factorial(n) / (factorial(x)*factorial(n-x)))
    res <- comb * p^x * (1-p)^(n-x)
    return(res)
  }
  binom_cdf <- function(x,n,p){
    res <- 0
    for(k in 0:x){
      res <- res + binom_pdf(k,n,p)
    }
    return(res)
  }
  if(cdf==FALSE){
    val<-binom_pdf(x = x,n = n,p = p)
  }else{
    val<-binom_cdf(x = x,n = n,p = p)
  } 
  return(val)
}

my_binom(x = -3,n = 10,p = 0.6,cdf = TRUE)
my_binom(x = 3,n = -2,p = 0.6,cdf = TRUE)

my_binom(x = 3,n = 10,p = 0.6,cdf = FALSE)
dbinom(x = 3,size = 10,prob = 0.6)
my_binom(x = 9,n = 29,p = 0.2,cdf = FALSE)
my_binom(x = 0,n = 15,p = 0.1,cdf = FALSE)
my_binom(x = 3,n = 10,p = 0.6,cdf = TRUE)
pbinom(q = 3,size = 10,prob = 0.6)
my_binom(x = 3,n = 12,p = 0.2,cdf = TRUE)
my_binom(x = 11,n = 17,p = 0.7,cdf = TRUE)
my_binom(x = 17,n = 17,p = 0.7,cdf = TRUE)

#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# 5: Grafik och datahantering
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
library(ggplot2)

# A)
library(cowplot)
data("trees")
g1<-ggplot(data = trees,aes(x=Height))+ geom_histogram(bins = 10)
g2<-ggplot(data = trees,aes(x=Girth))+ geom_boxplot()+coord_flip()
g3<-ggplot(data = trees,aes(x=Height,y=Volume))+ geom_point()
my_plots<-plot_grid(g1,g2,g3,nrow = 3)


# B)
path<-"/home/joswi05/Dropbox/Josef/732G33_VT2020/KursRprgmTeacher/Exams/732G33 exam 2020-08-13/HUS_eng.txt"

HUS<-read.table(file = path,header = TRUE,sep = ",",dec = ".")
summary(HUS)

index1<-HUS$air.conditioning==0
index2<-HUS$no.bedroom==3
index3<-HUS$year>=1920&HUS$year<=1950
HUS2<-HUS[index1&index2&index3,]
my_median_val<-median(HUS2$living.area)
my_median_val


