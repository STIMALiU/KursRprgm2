#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Seminarium kursvecka 3
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Funktionerna: paste(), paste0(), cat(), print()
#-------------------------------------------------------------------------------


min_text<-"ldskgölksflä"

data("iris")
print(iris)

print(min_text)
print("abc")

paste("del 1","del 2","del 3", "del 4",sep = "-")
paste0("del1","del2","del3", "del4")


x<-123
paste("x = ",x)

a<-c("a","b","c")

paste(a,1,sep="-")

paste("x",1:5,sep="_")

a
paste(a,collapse = "-")

x<-349
cat("mitt x",x,sep = "-")



f<-function(x){
  return(x^3)
}

y<-f(x = 4)



#-------------------------------------------------------------------------------
# for-loopar
#-------------------------------------------------------------------------------


# upprepade beräkningar
# loopvektor/loopindex ändras i varje iteration, resten är "konstant"

1^2
2^2
3^2
4^2
# osv
(1:4)^2

x<-1:5
for(i in x){
  print("Detta ändras inte, då det inte beror på loopindex i")
  val<-2^i 
  print(paste("Detta ändras, då det beror på i, nu är i =",i, "och val = 2^i =",val))
}



loop_vektor<-iris[1,1:4]
for(i in loop_vektor){
  print(i)
}

x<-1:3
c(x,33)
c(x,33:37)

res<-vector()

res<-c()
for(i in 1:200){
  if(i %% 3==0){
    res<-c(res,i)
  }
}


vector("numeric",length = 4)
vector("logical",length = 3)
vector("character",length = 10)


5%%2==1
5%%2!=0

i<-9
i %% 3==0 & i%%2==1

res<-c()

res<-vector("numeric",length = 0)
for(i in 1:21){
  if(i %% 3==0 & i%%2==1){
    res<-c(res,i)
    #print(res)
  }
}
res

sum_val<-0
for(i in 1:100){
  sum_val<-sum_val+i
  #print(sum_val)
  if(i==20){
    break 
  }
}
i

sum_val
sum(1:20)



g<-function(){
  sum_val<-0
  for(i in 1:20){
    sum_val<-sum_val+i
  }
  return(sum_val)
}
sum<-2049
g()

g<-function(n){
  sum_val<-0
  for(i in 1:n){
    sum_val<-sum_val+i
  }
  return(sum_val)
}
g(n = 20)

g(n = 10)



#-------------------------------------------------------------------------------
# 1.2.2 Nästlade for-loopar
#-------------------------------------------------------------------------------

# Uppgift 1

for (i in 1:2){
  
  for (j in 1:3){
    print(paste("yttre index i=",i))
    print(paste("inre index j=",j))
  }
  print("slut på inre loop")
}


for (i in 1:2){
  print(paste("yttre index i=",i))
  for (j in 1:3){
    print(paste("inre index j=",j))
  }
  print("slut på inre loop")
}


# (a) Pröva att ändra loppvektorerna ovan till c(1) och 1:2, vad händer?
# (b) Pröva att ändra loppvektorerna ovan till 1:3 och 1:2, vad händer?


for (i in 1){
  print(paste("yttre index i=",i))
  for (j in 1:3){
    print(paste("inre index j=",j))
  }
  print("slut på inre loop")
}

for (i in 1:3){
  print(paste("yttre index i=",i))
  for (j in 1:2){
    print(paste("inre index j=",j))
  }
  print("slut på inre loop")
}


# uppgift 2

# två matriser att addera:
A <- matrix(1:6,ncol=3)
B <- matrix(7:12,ncol=3)

C <- matrix(0, ncol=3, nrow=2)  # i denna matris sparar vi resultatet

# vi börjar med rader och sen kolumner

i<-1
j<-1

for (i in 1:2){  # rad-loopen, vi har två rader
  
  for (j in 1:3){ # kolumn-loopen, vi har tre kolumner
    
    print(paste("Rad i=",i,"Kolumn j=",j,"A = ",A[i,j]," B =",B[i,j]))
    # print(A[i,j])
    # print(B[i,j])
    
    C[i,j] <- A[i,j] + B[i,j]
    print(C[i,j])
  }
}
C
#jämför med:
A+B
(A+B)==C

all((A+B)==C)



A<-matrix(data = 1:8,nrow = 4,ncol = 2)
B<-matrix(data = 9:16,nrow = 4,ncol = 2)
A
B
C<-matrix(data = 0,nrow = 4,ncol = 2)
C
A-B
for(i in 1:4){
  for(j in 1:2){
    C[i,j]<-A[i,j]-B[i,j]
    print(C[i,j])
  }
}
C



#-------------------------------------------------------------------------------
# 1.2.3 while loopar
#-------------------------------------------------------------------------------

# Uppgift 1:

x<-1
while(x<10){
  print("x is less than 10")
  x<-x+1
}


# Uppgift 3: Skriv en while - loop som:

# a) Skriver ut talen 1 till 35


#-------------------------------------------------------------------------------
# Debugging
#-------------------------------------------------------------------------------



