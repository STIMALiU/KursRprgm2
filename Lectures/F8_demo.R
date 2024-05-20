
# demo baserat på artiklen nedan och exempel från dok för stringr:
# "stringr: modern, consistent string processing" av Hadley Wickham
# https://journal.r-project.org/archive/2010-2/RJournal_2010-2_Wickham.pdf



library(stringr)

#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
# strängar: grundläggande funktioner
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------

#----------------------------------------------------------------------------
# from doc:
#----------------------------------------------------------------------------


# str_c

str_c("a","b","c",sep = "")
str_c("a","b","c",sep = " ")

paste("a","b","c",sep = " ")
paste0("a","b","c")


str_c("a","b","c",sep = "--")

str_c("a","b",TRUE,3244,sep = "--")

# vektorisering:
str_c(c("a","b","c"),c("d","e","f"),sep = "--")
b<-str_c(c("a","b","c"),c("d","e","f"),sep = "+")
b


# kolumnnamn
str_c("var",1:10,sep="_")


a<-str_c("a","b","c",sep = "\n")
a
cat(a)
print(a)



?Constants
LETTERS
letters
# se även month.name, month.abb


my_letters <- str_c(letters, collapse = "")
str_c(letters,"12", sep = "")
my_letters
str_length(my_letters)
str_length(letters)
str_length(string = a)
str_length(string = b)


my_letters
# str_sub
str_sub(string = my_letters, start = 1, end = 3)
str_sub(string = my_letters, start = 3, end = 6)


# negativa index: 
# Från "stringr: modern, consistent stringprocessing":
#  "It also accepts negative positions, which are calculated from the left ofthe last character.
# The end position defaults to-1, which corresponds to the last character."

str_sub(string = my_letters, start = -3, end = -1)

str_sub(string = my_letters, start = 5, end = -5)

my_letters
str_sub(string = my_letters, start = 3, end = 6) <- "-   hej!   -"
my_letters


# str_trim

# ta bort mellanslag
x<-c("   hej!", "    abc  ","test   ")
x
str_trim(string = x,side = "left")
str_trim(string = x,side = "right")
str_trim(string = x,side = "both")



# str_pad
# lägg till mellanslag
str_length("HEJ!")
str_pad(string = "HEJ!",width = 10,side ="left")

str_pad(string = "HEJ!",width = 10,side ="right")

a<-str_pad(string = "HEJ!",width = 10,side ="both")
a
str_length("HEJ!")
str_length(a)


# läsa in text-filer:

text1<-readLines(
  con = "https://raw.githubusercontent.com/STIMALiU/KursRprgm2/main/Labs/DataFiles/wiki_R.txt",
  encoding = "UTF-8")
text1
text1[1:2]

text2<-readLines(
  con = "https://raw.githubusercontent.com/STIMALiU/KursRprgm2/main/Labs/DataFiles/word_data.txt",
  encoding = "UTF-8"
)
head(text2)
length(text2)

text3<-readLines(
  con = "https://raw.githubusercontent.com/STIMALiU/KursRprgm2/main/Labs/DataFiles/my_text.txt",
  encoding = "UTF-8"
)
text3



#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
# regular expression och pattern matching-funktioner
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------

# Doc för regexp i R
?regexp

# str_split
# vektor av längd 1

str_split(string = "abcbd",pattern = "b")

a<-str_split(string = c("hej, hur är det?"), pattern = "[:space:]")
print(a)
a[[1]][1]

b<-str_split(string = c("hej,1hur2är3det?"), pattern = "[:digit:]")
b
b[[1]]

# vektor av längd >1
b<-c("hej, hur är det?","jag mår bra tack")
b
length(b)
x<-str_split(string = b,pattern = " ")
x
length(x)
str(x)
x[[1]][1]
x[[1]][2]
x[[2]][1]

str_split(string = c("hej, hur är det?"), pattern = ",")


my_letters

# finns mönster?
str_detect(string = my_letters, pattern = "ab")
str_detect(string = my_letters, pattern = "ba")

str_detect(string = my_letters, pattern = "9")

a<-str_locate(string = my_letters, pattern = "hi")
a
a[1]
str_locate(string = my_letters, pattern = "hej")

str_locate(string = my_letters, pattern = "   ")

# förekommer många gånger:
d<-str_c(my_letters,"hi,  sdf hi")
d
str_locate_all(string = d, pattern = "hi")

# mer regexp
x <- "[a-z]{3}"
x <- "(^| )[a-z]{3} " # mellanslag på slutet
x <- "(^| )[a-z]{3}"

str_locate_all(string ="hud hej hejhej",pattern = x)
pattern_index<-str_locate_all(string ="hud hej hejhej",pattern = x)
pattern_index

str_sub(string = "hud hej hejhej",start = pattern_index[[1]][,1],end = pattern_index[[1]][,2])

str_extract_all(string ="hud hej hejhej",pattern = x)



# str_replace
x <- "(^| )[a-z]{3} "
str_replace(string =" hej xyzhej",pattern = x, replacement = "A")


?str_extract
?str_extract_all


?case # stringr
?tolower() # base
str_to_upper(string ="abc")
str_to_lower(string ="XYZ")
str_to_title(string =c("abc errsdf","xyc yrt, rewew"))



#----------------------------------------------------------------------------
#----------------------------------------------------------------------------

# från ?regexp:
# "The period . matches any single character. The symbol \w matches a ‘word’ character 
# (a synonym for [[:alnum:]_], an extension) and \W is its negation ([^[:alnum:]_]). 
# Symbols \d, \s, \D and \S denote the digit and space classes and their negations 
# (these are all extensions)."

# str_extract {stringr}
shopping_list <- c("apples x4", "bag of flour", "bag of sugar", "milk x2")
shopping_list
# första träffen:
str_extract(string = shopping_list, pattern = "\\d")
str_extract(shopping_list, "\\D")

# alla träffar:
str_extract_all(shopping_list, "\\d")
str_extract_all(shopping_list, "\\D")

str_extract(shopping_list, "[a-z]+")
str_extract_all(shopping_list, "[a-z]+")

str_extract(shopping_list, "[a-z]{1,4}")

# från ?regexp:
# " The symbol \b matches the empty string at either edge of a word, 
# and \B matches the empty string provided it is not at an edge of a word. "

# https://www.regular-expressions.info/wordboundaries.html


shopping_list
str_extract(shopping_list, "\\b[a-z]{1,4}\\b")
str_extract(shopping_list, "[a-z]{1,4}")

# Extract all matches

# alla tecken med minst 1 tecken av a till z
g1<-str_extract_all(shopping_list, "[a-z]+")
g1
# alla tecken med minst 1 tecken av a till z, 
# och som har en "ordkant" på varje sida:
g2<-str_extract_all(shopping_list, "\\b[a-z]+\\b")
# str_extract_all(shopping_list, "\\b[a-z0-9]+\\b")
g2

# alla tecken med minst 1 tecken av a till z eller 0 till 9:
g3<-str_extract_all(shopping_list, "[a-z0-9]+")

g3
g1
g2

all.equal(g1,g2)
all.equal(g1,g3)

# Skillnader
g1[[1]]
g2[[1]]
g3[[1]]

g1[[4]]
g2[[4]]
g3[[4]]



# Simplify results into character matrix
str_extract_all(shopping_list, "\\b[a-z]+\\b", simplify = TRUE)
str_extract_all(shopping_list, "[a-z]+", simplify = TRUE)



#-------------------------------------------------------------------------------
# find phone numbers:
# from article:

strings <- c(" 219 733 8965", "329-293-8753 ", "banana", "595 794 7569",
             "387 287 6718", "apple", "233.398.9187  ", "482 952 3315", 
             "239 923 8115","842 566 4692", "Work: 579-499-7527", "$1000", 
             "Home: 543.355.3679")

strings

# definiera telefonnummer:
# tre grupper med nummer
# 1) först en av 2-9, sen två nummer mellan 0-9
# 2) tre nummer av 0-9
# 3) fyra nummer av 0-9
# de separeras med "-", " " eller "."

# grupp 1:
"[2-9][0-9]{2})"

# grupp 2:
"[0-9]{3}"

# grupp 3:
"[0-9]{4}"

# separera:
"[- .]"

# allt tillsammans:
phone <- "([2-9][0-9]{2})[- .]([0-9]{3})[- .]([0-9]{4})"
phone
# Which strings contain phone numbers?
str_detect(strings, phone)
strings[str_detect(strings, phone)]

# Where in the string is the phone number located?
loc <- str_locate(strings, phone)
loc
loc[,1]
class(loc)

# Extract just the phone numbers
str_sub(string = strings,start =  loc[, "start"], end = loc[, "end"])

# Or more conveniently:
str_extract(string = strings, pattern = phone)

# Pull out the three components of the match
str_match(strings, phone)

# Anonymise the data
str_replace(strings, phone, replacement = "XXX-XXX-XXXX")


na.omit()
!is.na()



#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
# Modern databearbetning
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------

#----------------------------------------------------------------------------
# Tidy R
# Taget från: https://blog.rstudio.org/2014/07/22/introducing-tidyr/
#----------------------------------------------------------------------------


library(tidyverse)
library(tidyr)
library(dplyr)

# Multiple observations per row
# a and b are different treatments, values are heartrate
messy <- data.frame(
  name = c("Wilbur", "Petunia", "Gregory"),
  a = c(67, 80, 64),
  b = c(56, 90, 50)
)

messy

# old style:
# gather(data = messy, key = drug, value = heartrate, a:b)

# new style:
?pivot_longer
tidy<-pivot_longer(data = messy,cols = c("a","b"),names_to="drug",values_to="heartrate")

tidy
class(tidy)

as.data.frame(tidy)

# Make multiple observations per row again

# old style:
# spread(tidy, key = drug, value = heartrate)

# new style:
messy2<-pivot_wider(data = tidy,names_from="drug",values_from = "heartrate")
messy2
messy

all.equal(as.data.frame(messy2),messy)



#----------------------------------------------------------------------------
# dplyr
#----------------------------------------------------------------------------


#install.packages("nycflights13")
library(dplyr)
library(nycflights13)
library(tidyverse)

data(flights)
?flights
flights
class(flights)
?select

# Select: välj kolumn
select(.data = flights, day, year, dep_delay)

# med piping:
flights %>%
  select(day, year, dep_delay)

# Filter: välj rader
filter(flights, day == 1 & dep_delay > 60)

filter(flights, !is.na(dep_delay))

# Arrange: sortera/arrangera rader
arrange(flights, desc(dep_delay))
arrange(flights, dep_delay)

system.time(
  arrange(flights, dep_delay)
)

system.time(
  flights[order(flights$dep_delay, decreasing = TRUE),]
)

# Mutate: skapa nya kolumner
flights <- 
  mutate(flights,
         gain = arr_delay - dep_delay,
         speed = distance / air_time * 60)

select(flights, gain, speed)

# Summarise
summarise(flights,
          delay = mean(dep_delay, na.rm = TRUE))

# Group_by: gruppera för “split-apply-combine”/aggregera
daily <- group_by(flights, year, month, day)
per_day   <- summarise(daily, flights = n(), delay = mean(dep_delay, na.rm = TRUE))

per_day

flights%>%group_by(month)%>%
  summarise(mean=mean(dep_delay, na.rm = TRUE),
            median=median(dep_delay, na.rm = TRUE),
            sd=sd(dep_delay, na.rm = TRUE))



flights %>%
  select(dep_delay) %>%
  ggplot(aes(x=dep_delay)) +
  geom_histogram(binwidth = 2)


# Join
# There are different joins for different purposes, see ?join
?join


