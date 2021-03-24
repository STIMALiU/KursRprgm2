#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# Exam solution 2019-03-29 732G33
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------




# sista föreläsningen, modifierad kod


#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# 1: Statistik och beräkningar: Gammafördelning
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------


#' @title estimate_gamma
#'
#' @description 
#' En funktion som skattar parametrarna (theta och shape) för en Gammafördelning,
#' baserat på ett sample med data
#'
#' @param x Numerisk vektor med data
#' 
#' @param na.rm Logisk variabel, styr om saknade värden ska tas bort innan beräkning
#' 
#'
#' @return
#' Funktionen returnerar en lista med elementen:
#'  - N: antal obs i data
#'  - k_hat: skattning av shape parameter
#'  - theta_hat: skattning av scale parameter
#'  - x: data vektorn
#' 

estimate_gamma<-function(x,na.rm){
  #-----------------------------------------------------------------------------
  # om na.rm=TRUE, ta bort de obs som har na:
  index<-is.na(x)
  if(na.rm){
    x<-x[!index]
  }else if(any(index)){
    # Returnerar NA om na.rm=FALSE och det finns NA i data
    return(NA)
  }
  
  # testar om något värde är <=0:
  if(!all(x>0)) stop("Some elements in x are <=0")
  
 
  
  
  #-----------------------------------------------------------------------------
  # beräkna k_hat och theta_hat baserat på formler i tentan
  #-----------------------------------------------------------------------------
  N<-length(x) # antal obs
  
  # k_bar: 
  # täljare
  part1<-N*sum(x)
  
  # nämnare:
  part2<-N*sum(x*log(x))-(sum(log(x))*sum(x))
  # beräkna:
  k_bar<-part1/part2
  #-----------------------------------------------------------------------------
  
  #-----------------------------------------------------------------------------
  # beräkning av k_hat basera på k_bar:
  
  part3<-( 3*k_bar-(2/3)*(k_bar/(1+k_bar))-(4/5)*(k_bar/(1+k_bar)^2) )
  k_hat<-k_bar-(1/N) * part3
  
  # beräkning av k_hat:
  theta_hat<-(N/(N-1))*(1/(N^2))*part2
  
  
  #-----------------------------------------------------------------------------
  # samlar ihop alla delar i en lista med rätt namn:
  res_list<-list(N=N,k_hat=k_hat,theta_hat=theta_hat,x=x)
  
  return(res_list)
  
}

set.seed(342)
x1<-rgamma(n = 100000,shape = 4,scale = 10)
hist(x1)
a1<-estimate_gamma(x = x1,na.rm = TRUE)
str(a1)
a1[2:3]


estimate_gamma(x = c(1,2,-1,4),na.rm = TRUE) 





#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# 2: change_letters(...)
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
library(stringr)
# går även att använda casefold() eller str_to_upper()
# nedan följer en lösning utan kunskap om dessa funktioner


x<-str_sub(string = "hej",start = 1,end = 1)
toupper(x = x)



change_letters <- function(text, first=TRUE, last=TRUE){
  #-----------------------------------------------------------------------------
  # två oberende ja/nej-frågor:
  #-----------------------------------------------------------------------------
  # first=TRUE
  if(first){
    letter<-str_sub(text,1,1)
    new_letter<-toupper(letter)
    str_sub(text, 1,1) <- new_letter
  }
  # last=TRUE
  if(last){
    str_sub(text, -1,-1) <- toupper(str_sub(text,-1,-1))
    #str_sub(text, nchar(text),nchar(text)) <- toupper(str_sub(text,-1,-1))
    
  }
  return(text)
}

# alt:

change_letters<-function(text,first=TRUE,last=TRUE){
  text_upper<-toupper(text)
  text2<-text
  
  #-----------------------------------------------------------------------------
  # två oberende ja/nej-frågor:
  #-----------------------------------------------------------------------------
  # first=TRUE
  if(first){
    replace_first<-str_sub(string = text_upper,start = 1,end = 1)
    # [[a-z]]$ -> liten bokstav i början av texten
    text2<-str_replace(string = text,pattern = "^[[a-z]]",replacement = replace_first)
  }
  #-----------------------------------------------------------------------------
  # last=TRUE
  if(last){
    replace_last<-str_sub(string = text_upper,start = -1,end = -1)
    # [[a-z]]$ -> liten bokstav i slutet av texten
    text2<-str_replace(string = text2,pattern = "[[a-z]]$",replacement = replace_last)
  }
  return(text2)
}








# test:
change_letters(text = "hej",first = FALSE,last = FALSE) 
change_letters(text = "hej",first = TRUE,last = FALSE) 
change_letters(text = "hej",first = FALSE,last = TRUE) 
change_letters(text = "hej",first = TRUE,last = TRUE)
change_letters(text = c("hej","in","skola"),first = TRUE,last = TRUE) 
change_letters(text = c("hej","in","skola","buss","program"),first = TRUE,last = TRUE) 
change_letters(text = c("hej","in","skola","buss","program"),first = FALSE,last = TRUE) 
change_letters(text = c("penna","apa","skola","program"),first = TRUE,last = FALSE) 




#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# 3: Kontrollstrukturer
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------
# a)

# helper function



#' @title f
#'
#' @description 
#' Hjälpfunktion  till funktionen while_func(). Beräknar funktionen:
#' 
#'
#' @param t 
#' @param l 
#' @param w
#' 
#' @return Funktionens värde 

f<-function(t,l,w){
  y<-exp(-l*t)*cos(w*t)
}

t<-0:30
y<-f(t = t,l = 0.2,w = 1)
plot(t,y,t="o")



#' @title while_func
#'
#' @description 
#' Funktion som med hjälp av en while-loop beräknar antalet steg som krävs innan
#' |f(t-1)-f(t)| < tol, se ovan för f()
#'
#' @param tol tolerans innan loopen avbryter 
#' @param l parameter till f()
#' @param w parameter till f()
#' 
#' @return lista med 
#'  - iter: antalet iterationer
#'  - y_last: sista värdet på f(t)
#'  - y_second: näst sista värdet på f(t)

while_func<-function(tol,l,w){
  
  # starta på tid (t=tid) noll:
  t_var<-0 # steg 0
  
  # y_old: näst sista värdet på f(t)
  y_old<-f(t = t_var,l = l,w = w)
  
  # y_new: sista värdet på f(t)
  y_new<-1e10

  while(abs(y_new-y_old)>=tol){
    # öka tiden med ett:
    t_var<-t_var+1
    # uppdatera y_old
    y_old<-y_new
    # uppdatera y_new
    y_new<-f(t = t_var,l = l,w = w)
  }
  # samla i lista:
  res<-list(iter=t_var-1,y_last=y_new,y_second_last=y_old)
  return(res)
}


# testar
a<-while_func(tol = 0.001,l = 1,w = 1) 
a 

abs(a$y_last-a$y_second_last)
abs(a$y_last-a$y_second_last)<0.001

while_func(tol = 0.1,l = 1,w = 0.1) 
while_func(tol = 0.01,l = 0.1,w = 1) 
while_func(tol = 0.001,l = 0.1,w = 0.1)

#---------------------------------------------------------------------------------------------
# b)

matrix_func<-function(n,m){
  
  A<-matrix(NA,nrow = n,ncol = m)
  
  for(i in 1:n){ # rader
    
    for(j in 1:m){ # kolumner
      
      temp<-(i*j)^2
      
      if(temp%%4==0){
        A[i,j]<-temp
      }else{
        A[i,j]<-0
      }
    }
  }
  return(A)
}

#testar
matrix_func(n = 1,m = 1) 
matrix_func(n = 2,m = 2) 
matrix_func(n = 3,m = 3) 
matrix_func(n = 5,m = 3) 
matrix_func(n = 2,m = 4) 
matrix_func(n = 5,m = 5)

#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# 4:
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
library(ggplot2)


factor_plot<-function(my_data,title){
  if(ncol(my_data)>2) stop("too many variables")
  #if(!all(apply(my_data,2,is.factor))) stop("non factor data!")
  
  if(ncol(my_data)==1){
    if(!is.factor(my_data[,1]))  stop("non factor data!")
    p1 <- ggplot(data=my_data) + aes(x=my_data[,1]) + geom_bar()+xlab(label=names(my_data)[1])
  }
  if(ncol(my_data)==2){
    if(!is.factor(my_data[,1])|!is.factor(my_data[,2]))  stop("non factor data!")
    p1 <- ggplot(data=my_data) + aes(x=my_data[,1], fill=my_data[,2]) + geom_bar(position="dodge")+
      xlab(label=names(my_data)[1])+labs(fill = names(my_data)[2])
  }
  p1<-p1+ggtitle(title)
  return(p1)
}


#tester
B1<-data.frame(cyl=as.factor(mtcars$cyl)) 
B2<-data.frame(cyl=as.factor(mtcars$cyl),gear=as.factor(mtcars$gear)) 
B3<-data.frame(gear=as.factor(mtcars$gear),cyl=as.factor(mtcars$cyl)) 
B4<-data.frame(Species=iris$Species) 

factor_plot(my_data = cbind(B2,B2),title = "IRIS") 
factor_plot(my_data = iris,title = "IRIS") 
factor_plot(my_data = iris[,1:2],title = "IRIS")
factor_plot(my_data = iris[,1,drop=FALSE],title = "IRIS")
factor_plot(my_data = iris[,5:4],title = "IRIS")

C1<-factor_plot(my_data = B1,title = "hej") 
class(C1)
print(C1)
factor_plot(my_data = B2,title = "AB") 
factor_plot(my_data = B3,title = "reverse") 
factor_plot(my_data = B4,title = "IRIS") 








#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
# 5:
#---------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------
library(stringr)
library(lubridate)

path<-"/home/joswi05/Dropbox/Josef/732G33_VT2020/KursRprgmTeacher/Exams/732G33 exam 2020-03-27/Polls.csv"

poll<-read.csv(file = path,stringsAsFactors = FALSE)

head(poll)
dim(poll)

# a)
# hur m?nga NA finns det i data f?r varje variabel?
apply(poll,2,FUN = function(x){sum(is.na(x))})

index<-(!is.na(poll$n))&(!is.na(poll$PublDate))&(!is.na(poll$collectPeriodFrom))&(!is.na(poll$collectPeriodTo))
sum(index)
poll2<-poll[index,]

# complete.cases() kan också? användas.

dim(poll2)
# testa om vi gjort r?tt:
apply(poll2[,13:16],2,FUN = function(x){sum(is.na(x))})


# b)
no_days<-as.numeric(ymd(poll2$collectPeriodTo)-ymd(poll2$collectPeriodFrom))
summary(no_days)
mean_days<-mean(no_days)
mean_days
sd_days<-sd(no_days)
sd_days

# c)
date_vect<-ymd(poll2$PublDate)
tab<-table(month(date_vect,label = TRUE,abbr = FALSE))

# vilken månad är det minst?
names(which.min(tab)) # juli

# vilken månad är det flest?
names(which.max(tab)) # september

# d)
obj<-cor.test(x = poll2$n,y = no_days)
obj

cor_val<-obj$estimate
cor_val
p_val<-obj$p.value
p_val 
