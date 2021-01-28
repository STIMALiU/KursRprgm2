

#------------------------------------------------------------------------------------------
# markmyassignment
#------------------------------------------------------------------------------------------

library(markmyassignment)

lab_path <-  "https://raw.githubusercontent.com/STIMALiU/KursRprgm/master/Labs/Tests/d1.yml"

set_assignment(lab_path)
show_tasks()


LiuId<-"josad732"
Namn<-"josef wilzén"
three_elements<-function(){
  x<-c(1,2,3)
  return(x)
}

mark_my_assignment("three_elements")

mark_my_assignment()

# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
# Demo: Matriser, data.frame och listor 
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------


# -------------------------------------------------------------------------------------------
# Matriser
# -------------------------------------------------------------------------------------------
A1<-matrix(data = c(1,42,323,11,434,54,34,23,2),nrow = 3,ncol = 3)
A1
?matrix
# ändra namn:
colnames(A1)
colnames(A1)<-c("x","y","z")
colnames(A1)
A1
rownames(A1)
rownames(A1)<-c("rad1","rad2","rad3")
A1

# indexering:
A1[1,]
A1[,1]
A1[1,,drop=FALSE]
A1[,1,drop=FALSE]



a1<-A1[1,]
a2<-A1[1,,drop=FALSE]
a1
a2
dim(A1)
dim(a2)
dim(a1)
is.vector(a1)
is.matrix(a2)

is.vector(a2)

dim(A1)
dim(A1[,1])

x<-A1[,1]
dim(x)
dim(A1[,1])

length(A1[,1])
dim(A1[,1,drop=FALSE])

x[length(x)]

d<-dim(A1)
d
d[1]
dim(A1)[1]

A1[dim(A1)[1],dim(A1)[2]]


A2<-matrix(c("a","b","c","d","e","f","g","h"),4,2)
A2
typeof(A1)
A1*2
A1-7
typeof(A2)
A2*2

A2[1:2,]
A2[-2,]
A2[-c(1,4),]
A2[4,2]

str(A1)
str(A2)
is.matrix(A1)
is.list(A1)

# -------------------------------------------------------------------------------------------
# Data.frame
# -------------------------------------------------------------------------------------------

data()
?iris
data(iris)
?head

head(iris,n=10)
tail(iris)
dim(iris)
iris
colnames(iris)
iris$Species
is.factor(iris$Species)
x<-iris$Species
table(x)
table(iris$Species)

y<-factor(c("a","a","c","d","d"))
y
levels(y)
levels(y)[1]<-c("hej")
y
is.factor(y)
is.character(y)
z<-as.character(y)
z

typeof(iris$Species)
typeof(iris$Sepal.Length)


mean(iris$Sepal.Length)
iris[1:10,-5]
colMeans(iris[,-5])
rowMeans(iris[,-5])
colSums(iris[,-5])

summary(iris)

?mtcars
data(mtcars)
head(mtcars)
tail(mtcars)
rownames(mtcars)
summary(mtcars)

mtcars[1:3,c(1,3,5)]

mtcars[4,3]
mtcars$disp[4]
mtcars[[3]]
mtcars[[3]][4]

is.data.frame(mtcars)
is.list(mtcars)
is.matrix(mtcars)
is.vector(mtcars)


# -------------------------------------------------------------------------------------------
# Listor
# -------------------------------------------------------------------------------------------

x<-list(a="hej",b=TRUE,c=5:8)
x
y<-list("hej",TRUE,1:4)
y
x[1]
typeof(x[1])
x[[1]]
typeof(x[[1]])
x[1:2]
typeof(x[1:2])

x$a
x[[1]]
y[[1]]
y[[1:2]]
y[1:2]

x[[3]][4]
x[[3]][4]<-4746
x$c[4]
x
y[3]<-NULL
y

# mer komplex lista:
a<-list(x1=1:10,x2=c(2,4,22),x3=3:9)
a
b<-matrix(1:10,2,5)
b

storList<-list(minLista=a,minMat=b,logi=TRUE)
storList
str(storList)

storList$minMat[1:2,3:4]
storList$minLista[2]
storList$minLista[[2]]

summary(storList)

# -------------------------------------------------------------------------------------------
# Grundläggande databearbetning
# -------------------------------------------------------------------------------------------

a<-matrix(1:4,2,2)
b<-matrix(11:14,2,2)
a
b
cbind(a,b)
rbind(a,b)
rbind(b,a)

?merge
# från example(merge)

x <- data.frame(id = 1:5,weight=c(33,23,10,21,13) ,length=c(2,2,3,57,23))
x
y<-data.frame(id = c(2,3,1,4,5),year=2000:2004 ,temp=c(2,-4,21,15,17))
y
merge(x = x,y = y,by = "id")


data(iris)
?iris
iris[1:10,]
aggregate(x = iris$Sepal.Length,by=list(iris$Species),FUN = mean)
aggregate(x = iris[,-5],by=list(iris$Species),FUN = mean)
aggregate(x = iris[,-5],by=list(iris$Species),FUN = min)
aggregate(x = iris[,-5],by=list(iris$Species),FUN = sd)






# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
# Demo: Filhantering, Input och Output (I/O)
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------

?getwd
getwd()
dir()
# /home/joswi05/Dropbox/Josef/732G33_VT2020/KursRprgm/Labs/DataFiles
setwd(dir = "/home/josef/Dropbox/Josef/732G33_VT2018/temp")
dir()

# -------------------------------------------------------------------------------------------
# input:
# -------------------------------------------------------------------------------------------

path<-file.choose()
print(path)

x1<-read.table(file = "data1.txt",header = TRUE,sep = ";",dec = ",")
x1
str(x1)
typeof(x1[,1])
x2<-read.table(file = "data1.txt",header = TRUE,sep = ";",dec = ",",stringsAsFactors = FALSE)
typeof(x2[,1])
str(x2)
typeof(x2[,1])


?read.csv()
?read.csv2()

load(file = "testdata.Rdata")
new_data<-readRDS(file = "testdata.rds")



# -------------------------------------------------------------------------------------------
# output:
# -------------------------------------------------------------------------------------------
data(iris)
write.table(x = iris[1:20,],file = "myIris1.txt")
write.table(x = iris[1:20,],file = "myIris2.txt",sep = "\t",dec = ",",row.names = FALSE)
write.csv(x = iris[1:20,],file = "myIris3.csv",row.names=FALSE)

myIris<-iris[15:30,2:3]

save(myIris,file = "myIris.RData")
saveRDS(object = myIris,file = "myIris.rds")




# -------------------------------------------------------------------------------------------
# mer om funktioner:
# -------------------------------------------------------------------------------------------

f<-function(x){
  z<-10
  y<-x*z
  return(y)
}

f
f(x = 3)

z

# skillnad på () och []?




