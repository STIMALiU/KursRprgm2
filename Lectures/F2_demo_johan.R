# == Demo kod Föreläsning 1 == #
# == Johan Alenlöv == #

# == Matriser == #

A <- matrix(data = c(1, 4, 7, 2, 5, 8, 3, 6, 9), nrow = 3, ncol = 3)
A

is.matrix(A)
?matrix

B <- matrix(data = 4:9, nrow = 2)
B

C <- matrix( data = 4:9, nrow = 4, ncol = 3, byrow=TRUE)
C

D <- matrix(c("a","b","c","d","e","f"), 2)
D

A[1,]

a <- A[1,]
is.vector(a)

a <- A[1, , drop=FALSE]
is.vector(a)
is.matrix(a)

A
A[1,3]
A[1:2,2:3]
A[c(1,3),1,drop=FALSE]


B
length(B)
dim(B)

typeof(A)
typeof(D)

A
A*c(1,2,3)
A + 1


D
D*2

# == data.frame == #

data()

?airquality
data("airquality")

head(airquality)
head(airquality,n=10)
tail(airquality)
dim(airquality)
summary(airquality)

colnames(airquality)
colnames(airquality)[5:6] <- c("Månad", "Dag")

airquality

airquality[,5] <- factor(airquality[,5])
airquality[,5]

levels(airquality[,5])
levels(airquality[,5]) <- c("Maj","Juni","Juli","Augusti","September")

airquality
airquality[,5]

is.factor(airquality[,5])
is.character(airquality[,5])

z <- as.character(airquality[,5])
z

z <- factor(z)
z

typeof(airquality)
typeof(airquality$Månad)
typeof(airquality$Wind)

is.data.frame(airquality)
is.list(airquality)

?mtcars
data("mtcars")
head(mtcars)
tail(mtcars)
rownames(mtcars)
summary(mtcars)

mtcars[2:7,c(5,9,11)]


# == Listor == #

x <- list(a = "Hej", b = TRUE, c = c(1,3,5))
x

y <- list("Hej", TRUE, c(1,3,5))
y

x[1]

typeof(x[1])

x[[1]]

typeof(x[[1]])

x[2:3]
typeof(x[2:3])
x2 <- x[2:3]
x2

x$a
x[[1]]
y[[1]]
y[[2]]
y[[1:2]]
y[1:2]

x[[3]]
x[[3]][1]
x[[3]][1] <- 5
x[[3]][1]

x$c[1]
x

y[3] <- NULL
y

a <- list(x = 1:5, y = c(1,3,5), z = 6:10)
a
b <- matrix(1:12,3,4)
b

kombList <- list(minLista = a, minMatris = b, minBool <- c(TRUE, FALSE))
kombList

kombList$minLista$x
kombList$minMatris[1:2,3:4]

summary(kombList)


# == Databearbetning == #

a <- matrix(1:4,2,2)
b <- matrix(11:14,2,2)
a
b
cbind(a,b)
rbind(a,b)
rbind(b,a)

?merge

x <- data.frame(id = 1:5, weight = c(33,23,10,21,13), length = c(2,2,3,57,23))
x
y <- data.frame(id = c(2,3,1,4,5), year = 2018:2022, temp = c(2,-4,21,15,17))
y
merge(x = x, y = y, by = "id")

?iris
data(iris)
iris[1:10,]
aggregate(x = iris$Sepal.Length, by = list(iris$Species), FUN = mean)

aggregate(x = iris[,-5], by = list(iris$Species), FUN = mean)
aggregate(x = iris[,-5], by = list(iris$Species), FUN = min)
aggregate(x = iris[,-5], by = list(iris$Species), FUN = sd)

# == Input och Output == #

?getwd
getwd()
dir()
setwd()

path <- file.choose()
print(path)

x1 <- read.table(file = path, header = TRUE, sep = ";", dec = ",")
x1

str(x1)
typeof(x1[,1])

x2<-read.table(file = path,header = TRUE,sep = ";",dec = ",",stringsAsFactors = TRUE)
typeof(x2[,1])

str(x2)

?read.csv
?read.csv2


data(iris)
write.table(x = iris[1:20,],file = "myIris1.txt")
write.table(x = iris[1:20,],file = "myIris2.txt",sep = "\t",dec = ",",row.names = FALSE)
write.csv(x = iris[1:20,],file = "myIris3.csv",row.names=FALSE)

myIris<-iris[15:30,2:3]

save(myIris,file = "myIris.RData")
saveRDS(object = myIris,file = "myIris.rds")