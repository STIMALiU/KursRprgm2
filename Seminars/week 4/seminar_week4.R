#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Seminarium kursvecka 4
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

# tiden just nu:
Sys.time()


# mäta hur lång tid kod tar att köra:
system.time({
  for(i in 1:1e9){
    i^2
  }
})

# kommentera flera rader samtidigt:
# Ctrl + Shift + C


#-------------------------------------------------------------------------------
# 1.2.3 while loopar
#-------------------------------------------------------------------------------

# Uppgift 1:

x<-1
while(x<10){
  print("x is less than 10")
  x<-x+1
}

# labb 3:
# Uppgift 3: Skriv en while - loop som:

# a) Skriver ut talen 1 till 35

i<-1
while (i<=35) {
  print(i)
  i<-i+1
}

# b) Summerar heltalen 5 till 200

sum_val<-0
i<-5
while(i<=200){
  sum_val<-sum_val+i
  i<-i+1
}
sum_val
sum(5:200)


# c) Skriver ut "I love R!" 20 gånger

i<-1
while(i<=20){
  print("I love R!")
  i<-i+1
}

# alt:
i<-0
while(i<20){
  i<-i+1
  print("I love R!")
  print(i)
}



# d) Skriver ut talen 1 till 20 och den kumulativa summan från 1 till 20

i<-1
sum_val<-0
while(i<=20){
  sum_val<-sum_val+i
  min_text<-paste("i =",i,"   kumulativa summan = ",sum_val)
  print(min_text)
  i<-i+1
}



# e) Skriver ut alla udda tal mellan 1 och 20. [Tips! ?%%]

i<-1
while(i<=20){
  if(i %% 2 == 1){
    print(i)
  }
  i<-i+1
}

# alt 2:
i<-1
while(i<=20){
  print(i)
  i<-i+2
}


# vi vill spara alla udda tal

# om jag vet hur många tal jag vill spara:
res<-rep(0,30)
res<-vector("numeric",30)


# om jag inte vet hur många tal jag vill spara:
res<-c()  # tom vektor med 0 element
i<-1
while(i<=20){
  print(i)
  res<-c(res,i)
  i<-i+2
}
res
length(res)


# om jag inte vet hur många tal jag vill spara:
res<-c()  # tom vektor med 0 element
res2<-c()  # tom vektor med 0 element
res
i<-1
while(i<=20){
  if(i %% 2 == 1){
    res<-c(res,i)
    res2<-c(res2,i^2)
    print(i)
  }
  i<-i+1
}
res
res2



#-------------------------------------------------------------------------------
# Debugging
#-------------------------------------------------------------------------------

# labb 3
# del 1.4

# uppgift 1:
# f<-function(x,y){
#   x2<-sin(x)
#   y2<-log(y)
#   z<-x2^(y2^2-3*y2
#          return(z)
# }

f<-function(x,y){
  x2<-sin(x)
  y2<-log(y)
  z<-x2^(y2^2-3*y2)  # <- saknar en parentes!
         return(z)
}


f<-function(x,y){
  x2<-sin(x)
  y2<-log(y)
  z<-x2^(y2^2-3*y2) 
  return(z)
}
  


# uppgift 3
# my_col_stats: a function for calculating stats for a specified column in a dataset
# my_data - a data.frame
# index - the column of intrest
my_col_stats<-function(my_data,index){
  x<-my_data[,1]
  return(list(mean=mean(x),meadian=median(x),sd=sd(x)))
}
data("iris")
a<-my_col_stats(my_data = iris,index = 1)
a
str(a)
mean(iris[,1])
iris[,1]==iris[,2]
iris[,1] %in% iris[,2]
my_col_stats(my_data = iris,index = 2)
my_col_stats(my_data = iris,index = 3)
my_col_stats(my_data = iris,index = 4)


my_col_stats<-function(my_data,index){
  x<-my_data[,index]
  return(list(mean=mean(x),meadian=median(x),sd=sd(x)))
}
my_col_stats(my_data = iris,index = 2)
my_col_stats(my_data = iris,index = 3)
my_col_stats(my_data = iris,index = 4)
sd(iris[,4])


# uppgift 4:
h<-function(x){
  x_sum<-sum(x)
  x_mean<-mean(x)
  x2<-x^2
  z<-5
  y<-exp(x2)-z
  return(y)
}
debug(h)
a<-matrix(1:4,2,2)
y<-h(x = a)
undebug(h)

h<-function(x){
  x_sum<-sum(x)
  x_mean<-mean(x)
  x2<-x^2
  browser()
  z<-5
  y<-exp(x2)-z
  return(y)
}
y<-h(x = a)
h<-function(x){
  x_sum<-sum(x)
  x_mean<-mean(x)
  x2<-x^2
  #browser()
  z<-5
  y<-exp(x2)-z
  return(y)
}

h<-function(x){
  x_sum<-sum(x)
  x_mean<-mean(x)
  x2<-x^2
  z<-5
  if(z==5){
    browser()
  }
  y<-exp(x2)-z
  return(y)
}
y<-h(x = a)

h<-function(x){
  x_sum<-sum(x)
  x_mean<-mean(x)
  x2<-x^2
  z<-10
  if(z==5){
    browser()
  }
  y<-exp(x2)-z
  return(y)
}
y<-h(x = a)




