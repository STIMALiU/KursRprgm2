


#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
# ggplot()
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
library(ggplot2)
?ggplot()

data(diamonds)
data(longley)
?longley
?qplot


# testa ggplot:
data(mpg)
?mpg



plot
# Quick plot:
qplot(x = mpg$displ, y = mpg$hwy)

qplot(x = mpg$displ, y = mpg$hwy,geom = "point")

qplot(displ, hwy, data=mpg, facets=.~drv)
qplot(displ, hwy, data=mpg, facets=drv~.)

# How to do this the "correct" way
class(mpg)

ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
# or
p <- ggplot(data = mpg) + aes(x = displ,y = hwy) + geom_point()
p
# samma som 
print(p)

# kolla 
str(p)
summary(p)
class(p)

# lägg til regressionslinje
p + geom_smooth()
p + geom_smooth(method="lm")

# dela upp data i subplots:
p + facet_grid(.~drv)

p + geom_smooth(method="lm") + facet_grid(.~drv)

p + geom_smooth(method="lm") + facet_grid(drv~.)

p + geom_smooth(method="loess") + facet_grid(.~drv)

# För lite data för alla celler
p + facet_grid(fl~drv)




names(mpg)
?mpg


# Använda andra aestetics:
ggplot(data = mpg, mapping = aes(x = displ,y = hwy)) + 
  geom_point(color="steelblue") +
  geom_smooth(method="lm")


ggplot(data = mpg, mapping = aes(x = displ,y = hwy)) + 
  geom_point(color=10) +
  geom_smooth(method="lm")

ggplot(data = mpg, aes(displ,hwy)) + 
  geom_point(color="green", size=3, alpha=0.1) +
  geom_smooth(method="lm")


# Använda färg och form som aestetic
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point(aes(color=drv),size=3)
  
# bestämma färger manuellt:
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point(aes(color=drv),size=3) + 
  scale_colour_manual(values = c("red","brown","blue"))
  


ggplot(data = mpg, aes(displ,hwy)) + 
  geom_point(aes(shape=drv),size=2) + 
  xlab("Displacement") + 
  ylab("Highway miles")+ggtitle("Plot")

ggplot(data = mpg, aes(displ,hwy)) + 
  geom_point(aes(shape=drv, color=as.factor(cyl)),size=2) + 
  xlab("Displacement") + 
  ylab("Highway miles")+ggtitle("Plot")


# Styra x labels och y labels


# Linjegrafer
library(ggplot2)
#install.packages("ggthemes")
library(ggthemes)

data(Nile)
Nile2 <- (data.frame(Nile) )
class(Nile2)
colnames(Nile2) <- "level"
Nile2$years <- 1871:1970
Nile2$period <- "- 1900" 
Nile2$period[Nile2$years >= 1900] <- "1900 - 1928"
Nile2$period[Nile2$years >= 1929] <- "1929 - 1946"
Nile2$period[Nile2$years > 1946] <- "1946 + " 
Nile2$period <- as.factor(Nile2$period)

head(Nile2)

table(Nile2$period)

ggplot(data=Nile2) + aes(x=years, y=level) + geom_line()

ggplot(data=Nile2) + aes(x=years, y=level) + 
  geom_line(aes(color = period)) + scale_color_colorblind()

ggplot(data=Nile2) + aes(x=years, y=level) + 
  geom_line(aes(linetype = period))

ggplot(data=Nile2) + aes(x=years, y=level) + geom_line(aes(linetype = period))

# Teman
ggplot(data=Nile2) + 
  aes(x=years, y=level, color = period) + 
  geom_line(aes(linetype = period)) + 
  theme_bw()

ggplot(data=Nile2) + 
  aes(x=years, y=level, color = period) + 
  geom_line(aes(linetype = period)) + 
  theme_dark()



ggplot(data=Nile2) + 
  aes(x=years, y=level, color = period) + 
  geom_line(aes(linetype = period)) + 
  theme_economist()

ggplot(data=Nile2) + 
  aes(x=years, y=level, color = period) + 
  geom_line(aes(linetype = period)) + 
  theme_excel()



# Longley data:

data(longley)
ggplot(data=longley) + aes(Year, GNP.deflator) + geom_line()
ggplot(data=longley) + aes(Year, GNP.deflator) + geom_line()+geom_smooth()

# ggplot och histgram:
data(chickwts)
head(chickwts)
table(chickwts$feed)
dim(chickwts)
a0 <- ggplot(data=chickwts, aes(x=weight))
a <- a0 + geom_histogram(binwidth = 20)
a
a <- a + facet_grid(.~feed)
a

# boxplot

ggplot(data = chickwts,aes(y = weight))+geom_boxplot()

ggplot(data = chickwts,aes(x = feed,y = weight))+geom_boxplot()




#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
# statistik, tester mm
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------

# cov() och cor()
data("trees")
head(trees)
var(trees$Girth)
var(trees$Height)

cov(trees$Girth,trees$Height)

cov(trees)

cor(trees$Girth,trees$Height)
cor(trees)

?cor.test
cor.test(x = trees$Girth,y = trees$Height)
a<-cor.test(x = trees$Girth,y = trees$Height)
str(a)

a$statistic
a$p.value
a$estimate
a$conf.int
a$conf.int[1]

# t.test:

summary(trees)

# trees data:

# vi vill testa om höjden är skild från 73 feet
b<-t.test(x = trees$Height,alternative = "two.sided",mu = 73)
b


# vi vill testa om höjden är större än 73 feet

b<-t.test(x = trees$Height,alternative = "greater",mu = 73)
b

b$statistic

b$p.value

round(b$p.value,3)

# beräkan KI för alla variabler i trees
head(trees)
# två gränser för KI och tre variabler i trees
A<-matrix(0,2,3)
A

for(i in 1:3){
  temp<-t.test(x = trees[,i],conf.level = 0.99)
  A[,i]<-temp$conf
}
colnames(A)<-colnames(trees)
rownames(A)<-c("lower","upper")
A






#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
# Frivillig fördjupning: Linjär regression
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
?lm

# Run linear model
x <- lm(formula = Volume ~ Girth, data = trees)
class(x)
print(x)
x
summary(x)
anova(x)
plot(x)

x <- lm(formula = Volume ~ -1 + Girth, data = trees)

coef(x)
predict(x)
resid(x)

ggplot(data = data.frame(Volume = trees$Volume,  Girth = trees$Girth)) + 
  aes(x = Volume, y = Girth) +
  geom_point()

x <- lm(formula = Volume ~ ., data = trees)

x <- lm(formula = Volume ~ Girth + Height, data = trees)
print(x)
x
summary(x)
anova(x)
plot(x)

coef(x)
predict(x)
str(x)



