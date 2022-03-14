## == stringr == ##

library(stringr)

str_c("1","2","3","4")
str_c("1","2","3","4", sep = " ")

paste("1","2","3","4")
paste0("1","2","3","4")

str_c("1","2","3","4", TRUE, 3244, sep = "--")

# Vektorisering

str_c(c("a","b","c"),c("1","2","3"), sep = "--")

a <- str_c("1","2","3",sep = "\n")
a
cat(a)
print(a)

# str_length
?Constants
LETTERS
letters

my_letters <- str_c(letters, collapse = "")
my_letters
str_length(my_letters)
str_length(letters)

# str_sub
str_sub(string = my_letters, start = 1, end = 3)
str_sub(string = my_letters, start = 3, end = 8)

# Kan använda negativa index

str_sub(string = my_letters, start = -2, end = -1)
str_sub(string = my_letters, start = 2, end = -2)

my_letters
str_sub(string = my_letters, start = 3, end = 6) <- " nu lägger vi till saker "
my_letters

# str_trim
str_trim(string = c("   hej", "hej    ", "    hej     "))
str_trim(string = c("   hej", "hej    ", "    hej     "), side = "left")
str_trim(string = c("   hej", "hej    ", "    hej     "), side = "right")
str_trim(string = c("   hej", "hej    ", "    hej     "), side = "both")


# str_pad
str_pad(string = "hej", width = 5)
str_pad(string = "hej", width = 10)
str_pad(string = "hej", width = 5, side = "left")
str_pad(string = "hej", width = 5, side = "right")
str_pad(string = "hej", width = 5, side = "both")

## == regex == ##

?regexp

str_split(string = "Johan", pattern = "h")

a <- str_split(string = c("Hej, hur är det"), pattern = "[:space:]")
print(a)
a[[1]][1]

b <- str_split(string = c("hej,1hur2är3det"), pattern = "[:digit:]")
b

c <- str_split(string = c("hej,1hur2är3det"), pattern = "[0-9]")
c

med_svar <- c("Hej, hur mår du?","Jag mår bra!")
length(med_svar)

d <- str_split(string = med_svar, pattern = " ")
d
typeof(d)
d[[1]]
d[[2]]

my_letters <- str_c(letters, collapse = "")

str_detect(string = my_letters, pattern = "ab")
str_detect(string = my_letters, pattern = "ba")

e <- str_locate(string = my_letters, pattern = "hi")
e
str_sub(string = my_letters, start = e[1], end = e[2] )

# Mer regex

p1 <- "[a-z]{3}"
p2 <- "(^| )[a-z]{3}"
p3 <- "(^| )[a-z]{3} "

test_string <- "abc def ghijkl"

str_locate_all(string = test_string, pattern = p1)
str_locate_all(string = test_string, pattern = p2)
str_locate_all(string = test_string, pattern = p3)

str_extract_all(string = test_string, pattern = p1)
str_extract_all(string = test_string, pattern = p2)
str_extract_all(string = test_string, pattern = p3)

str_replace_all(string = test_string, pattern = p1, replacement = "A")

# från ?regexp:
# "The period . matches any single character. The symbol \w matches a ‘word’ character 
# (a synonym for [[:alnum:]_], an extension) and \W is its negation ([^[:alnum:]_]). 
# Symbols \d, \s, \D and \S denote the digit and space classes and their negations 
# (these are all extensions)."

# str_extract

shopping_list <- c("milk x 2", "bag of flour", "pasta", "bacon x 2", "eggs x 12", "bread", "cheese")
str_extract(string = shopping_list, pattern = "\\d")
str_extract(string = shopping_list, pattern = "\\D")

str_extract_all(string = shopping_list, pattern = "\\d")
str_extract_all(string = shopping_list, pattern = "\\D")

str_extract(string = shopping_list, pattern = "[a-z]+")
str_extract_all(string = shopping_list, pattern = "[a-z]+")

str_extract_all(string = shopping_list, pattern = "[a-z]{2,}")

# från ?regexp:
# " The symbol \b matches the empty string at either edge of a word, 
# and \B matches the empty string provided it is not at an edge of a word. "

str_extract(string = shopping_list, pattern = "\\b[a-z]{1,2}\\b")
str_extract(string = shopping_list, pattern = "[a-z]{1,2}")

e1 <- str_extract_all(string = shopping_list, pattern = "[a-z]+")
e2 <- str_extract_all(string = shopping_list, pattern = "\\b[a-z]+\\b")
e3 <- str_extract_all(string = shopping_list, pattern = "\\w+")
e4 <- str_extract_all(string = shopping_list, "[a-z0-9]+")
e1
e2
e3
e4
all.equal(e1,e2)
all.equal(e1,e3)
all.equal(e3,e4)

str_extract_all(string = shopping_list, pattern = "[a-z]+", simplify = TRUE)
str_extract_all(string = shopping_list, pattern = "\\b[a-z]+\\b", simplify = TRUE)
str_extract_all(string = shopping_list, pattern = "\\w+", simplify = TRUE)
str_extract_all(string = shopping_list, "[a-z0-9]+", simplify = TRUE)

# from article:

strings <- c(" 219 733 8965", "329-293-8753 ", "banana", "595 794 7569",
             "387 287 6718", "apple", "233.398.9187  ", "482 952 3315", "239 923 8115",
             "842 566 4692", "Work: 579-499-7527", "$1000", "Home: 543.355.3679")

strings

# definiera telefonnummer:
# tre grupper med nummer
# 1) först en av 2-9, sen två nummer mellan 0-9
# 2) tre nummer av 0-9
# 3) fyra nummer av 0-9
# de separeras med "-", " " eller "."


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


## == Modern databearbetning == ##
## == tidyr == ##

library(tidyverse)
library(tidyr)
library(dplyr)

messy <- data.frame(
  namn = c("Johan", "Josef", "Rasmus"),
  a = c(20,20,40),
  b = c(50, 30, 45)
)
messy

tidy <- pivot_longer(data = messy, cols = c("a","b"), names_to = "Variabel", values_to = "Värde")
tidy
class(tidy)

messy2 <- pivot_wider(data = tidy, names_from = "Variabel", values_from = "Värde")
messy2
all.equal(as.data.frame(messy2),messy)

## == dplyr == ##

library(nycflights13)
data("flights")
?flights
head(flights)
class(flights)

# select, väljer kolumner
select(.data = flights, day, year, dep_delay)

flights %>%
  select(day, year, dep_delay)

# filter väljer rader
filter(flights, day == 1 & dep_delay > 60)

flights %>%
  filter(day == 1 & dep_delay > 60)

# kokmbinera
flights %>%
  select(day, year, dep_delay) %>%
  filter(day == 1 & dep_delay > 60)

# arrange, sortera
arrange(flights, desc(dep_delay))
arrange(flights, dep_delay)


# Testa tiden
system.time(
  arrange(flights, dep_delay)
)

system.time(
  flights[order(flights$dep_delay, decreasing = TRUE),]
)

# mutate, skapa nya kolumner
flights_mut <- 
  mutate(flights,
         gain = arr_delay - dep_delay,
         speed = distance / air_time * 60)
select(flights_mut, gain, speed)

# summarise
summarise(flights,
          delay = mean(dep_delay, na.rm = TRUE))

# group_by, gruppera data
daily <- group_by(flights, year, month, day)
per_day <- summarise(daily, flights = n(), delay = mean(dep_delay, na.rm = TRUE))
per_day

flights2 <- left_join(flights, per_day)
select(flights2, dep_delay, delay)
