
# lite om matriser
A1<-matrix(data = 1:10,nrow = 5,ncol = 2)
A2<-matrix(data = 1:10,nrow = 2,ncol = 5,byrow = TRUE)
A1
A2

A2[2,3]
A2[2,]
A2[,3]

A2[2,1:3]


A2 + 10

A2 * 10

log(A2)
exp(A2)


# lite om hantering av data.frame
data(iris)
?iris
head(iris)
str(iris)

iris$Petal.Length

iris$Petal.Length[4:6]


q<-quantile(iris$Petal.Length)

q[4]
index<- iris$Petal.Length>=q[4]

iris$Petal.Length[index]


#----------------------------------------
# Från Övningsuppgifter 1:
# 4.2 * Extraproblem
# Uppgift 2)


part1<- - b/(2*a)

under_sqrt<- b^2/(2*a)^2 -c/a

part2_miuns <- -sqrt(under_sqrt)

part2_plus <- sqrt(under_sqrt)

x1<-part1 +part2_miuns
x2<-part1 +part2_plus

x<-c(x1,x2)



g<-function(a,b,c){
  
  part1<- - b/(2*a)
  
  under_sqrt<- b^2/(2*a)^2 -c/a
  
  part2_miuns <- -sqrt(under_sqrt)
  
  part2_plus <- sqrt(under_sqrt)
  
  x1<-part1 +part2_miuns
  x2<-part1 +part2_plus
  
  x<-c(x1,x2)
  return(x)
}

g(a = 4,b = 0,c = 0)

# testa själv med andra ekvationer!
# (dvs andra värden på a, b och c)


