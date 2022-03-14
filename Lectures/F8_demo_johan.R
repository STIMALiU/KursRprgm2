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


