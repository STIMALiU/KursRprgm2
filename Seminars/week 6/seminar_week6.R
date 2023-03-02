#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Seminarium kursvecka 6
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------




#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------

# Linjär algebra: 2.2
# uppgift 8

A <- matrix(c(1,1,1,1,1,2,1,3,4),ncol=3)
B <- matrix(c(-1,2,2,-2,-2,1,1,1,-1),ncol=3)

A
B
# skapa C och D enligt uppgiften
# C har bara nollor

matrix(data = 0,ncol = 3,nrow = 3)
C<-matrix(0,3,3)
#C<-diag(c(1,0,0))

# D är en diagonalmatris
D<-diag(x = c(1,2,3))
D

# uppgift 9

# vi ska göra en blockmatris med fyra block
# vi kallar dem X1, X2, X3 och X4

# X1
# X1 = (A-B(D^-1)C)^-1

X1_temp<-A-B%*%solve(D)%*%C
solve(X1_temp)

X1<-solve(A-B%*%solve(D)%*%C)


#
X2<- -solve(A-B%*%solve(D)%*%C)%*%B%*%solve(D)
X2

# 
X3<- -solve(D)%*%C%*%solve(A-B%*%solve(D)%*%C)

X4<- solve(D)+solve(D)%*%C%*%(-X2)


cbind(X1,X2)
cbind(X3,X4)

X<-rbind(cbind(X1,X2),cbind(X3,X4))

# uppgift 10

Y<-solve( rbind( cbind(A,B) , cbind(C,D) ) )

# testa att addera lite fel till Y
#Y<-Y+1e-6

X
Y

# uppgift 11: kolla om X och Y är samma

a<-2
b<-2

a==b

a-b

X==Y
all(X==Y)

X-Y
abs(X-Y)
tol_val<-1e-8
abs(X-Y)<tol_val
all(abs(X-Y)<tol_val)

