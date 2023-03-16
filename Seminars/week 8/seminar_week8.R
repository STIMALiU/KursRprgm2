#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Seminarium kursvecka 8
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------


x1<-rnorm(n = 30)
x2<-rnorm(n = 30)

plot(x1,x2)


A<-cor.test(x1,x2)

str(A)


A$statistic
A$p.value

#knitr::kable()
#




#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------



#-------------------------------------------------------------------------------
# tester
#-------------------------------------------------------------------------------





#-------------------------------------------------------------------------------
# projekt del 2: tidserier 
#-------------------------------------------------------------------------------

# 2.1.2 Dataanalys av tidseriedata

# 4)
# ta bort säsong i tidserie

# simulera en tidserie med tydlig säsong:
set.seed(434)
x2<-1:12
y2<-(sin(x2/4)+rnorm(12,sd=0.07))*25
#plot(x2,y2,t="o")
m<-rep(1:12,10)
y<-rep(2010:2019,each=12)
set.seed(323)
val<-as.vector(arima.sim(model = list(ar=0.99999),n = 120)+10+y2)

plot(val,t="o")
# vi ser att har en tydlig månadssäsong här
# finns det någon annan trend över tid?

df<-data.frame(year=y,month=as.factor(m),val=val)
head(df)


# beräknar medelvärden grupperade på månad:
library(dplyr)
m_group<-df %>% group_by(month) %>% summarise(mean=mean(val))
m_group<-as.data.frame(m_group)
m_group

df$val

# använd recyling för att 
# subtrahera månadsmedelvärden från val

# testar med korta vektorer:
a<-1:10
b<-c(5,10)
a
b
a-b

# tidseriedatan:
df$val
m_group$mean

val2<-df$val-m_group$mean
length(val2)
plot(val2,t="o")

# vi måste addera medelvärdet från val för att få rätt skala:
val3<-val2+mean(df$val)
plot(val3,t="o")

# plottar val och tidserien där vi tagit bort månadsvariationen:
plot(val,t="o")
lines(val3,col="red",lwd=3)
# nu ser vi tydligt att det finns en viss trend som varierar över
# tid, men att månadssäsongen verkar vara det som dominerar 
#-------------------------------------------------------------------------------
# 
#-------------------------------------------------------------------------------

