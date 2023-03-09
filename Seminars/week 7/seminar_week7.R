#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Seminarium kursvecka 7
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------




#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

library(ggplot2)

#

data("trees")
head(trees)
ggplot(data=trees,mapping = aes(x=Girth,y=Volume))+geom_point()

ggplot(trees,aes(x=Girth,y=Volume))+geom_point()

ggplot(mapping = aes(x=Girth,y=Volume),data=trees)+geom_point()


ggplot(data=trees,x=Girth,y=Volume)+geom_point()


ggplot(data = ,mapping = )


x<-rnorm(n = 100)
y<-rnorm(n = 100)+10

t.test(y=y,x=x,"less")




#
for(i in 1:10){
  y<-i^2+10*i-5
  print(y)
}


1^2+10*1-5
2^2+10*2-5
# osv

iter<-10
res<-rep(0,iter)
for(i in 1:10){
  y<-i^2+10*i-5
  res[i]<-y
  #print(y)
}
res
plot(1:10,res)

loop_vect<- 1:5

for(loop_var in loop_vect){
  y<-i^2+10*i-5
  print(y)
}
x<-1:10
y<-x^2+10*x-5
y

#--------------------------------------------



m<-rep(month.name,10)
y<-rep(2010:2019,each=12)


set.seed(323)
val<-as.vector(arima.sim(model = list(ar=0.9),n = 120)+10)
plot(val)
df<-data.frame(year=y,month=m,val=val)
head(df)

df[1,]

index_jan<-df$month=="January"
temp<-df[index_jan,]

mean(temp$val)


index_2015<-df$year>=2015
df[index_2015,]

agg_df<-aggregate(x = df$val,by=list(df$year),FUN = mean)


str(agg_df)
plot(agg_df$Group.1,agg_df$x,t="l")
aggregate(x = df$val,by=list(df$year),FUN = sd)

aggregate(x = df$val,by=list(df$year),FUN = summary)

aggregate(x = df$val,by=list(df$month),FUN = median)


#-------------------------------------------




step_func<-function(x0=1,h,tol){
  
  
  cond<-TRUE
  
  while(cond){
    
    
    if(){
      cond<-FALSE
    }
    
  }
  
  
  return()
}


#








#
f<-function(x) exp(-x)

f(3)

step_func<-function(x0=1,h,tol){
  y0<-f(x0)
  cond<-TRUE
  iter<-0
  y_current<-y0
  x<-x0
  while(cond){
    iter<-iter+1
    x<-x+h
    y_prev<-y_current
    y_current<-f(x)
    
    check<-abs(y_current-y_prev)<tol
    
    if(check){
      cond<-FALSE
    }
  }
  return(list(iter=iter,y_current=y_current,y_prev=y_prev))
}

step_func(x0 = 1,h = 1,tol = 0.01)
step_func(x0 = 1,h = 2,tol = 0.01)
step_func(x0 = 1,h = 1,tol = 0.1)

step_func(x0 = 3,h = 1,tol = 0.1)






