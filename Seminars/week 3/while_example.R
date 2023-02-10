

# While-loop uppgift,där man ska summera 5:200. Hur summerar man i en while loop,
# vad ska stå i ”condition” while(condition)


# alt 1:

# fixar en indexvariabel:
i<-5
# en "tom" summavariabel:
sum_val<-0
while(i<=200){ 
  sum_val<-sum_val+i
  i<-i+1

}
sum_val
# jämför med:
sum(5:200)


# alt 2:

# fixar en indexvariabel:
i<-5
# en "tom" summavariabel:
sum_val<-0
while(TRUE){ # med villkoret TRUE så måste vi använda break senare i loopen
  sum_val<-sum_val+i
  i<-i+1
  if(i>200){
    break
  }
}
sum_val
# jämför med:
sum(5:200)


