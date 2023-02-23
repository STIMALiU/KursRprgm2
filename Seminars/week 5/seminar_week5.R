#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Seminarium kursvecka 5
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------


# spara plot till pdf:

getwd()


x<-rchisq(n = 1000,df = 5)
hist(x,50)
dev.copy2pdf(file="my_hist.pdf")


dev.copy2pdf(file="/home/joswi05/Dropbox/Josef/732G33_VT2023/KursRprgm2/test_folder/my_hist.pdf")



#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------


df<-data.frame()
str(df)

colnames(df)<-c("a","b")

no_row<-100
df<-data.frame(temp=rep(0,no_row))
str(df)
colnames(df)
colnames(df)<-"hej"
df$b<-"abc"
df

# vi har tre olika data.frames med lika många rader
# -> slå ihop med cbind()

df1<-data.frame(a=1:10)
df2<-data.frame(b=10:1,c=30)
df3<-data.frame(d=11:20)


df_all<-cbind(df1,df2,df3)
df_all


df_all<-cbind(df1,b=df2$b,df3)
df_all



a<-matrix(0,4,2)
a
b<-data.frame(a)
b
is.data.frame(b)
as.data.frame(b)
class(b)

df<-data.frame(x1=rep(0,4),x2=rep(0,4))
df


