library(tidyverse)
df <- data.frame(ord = c("a","b","c","A","B","C"), antal = c(4,5,6))
df
?arrange
df <- df %>%
  arrange(desc(antal))
df
df <- df %>%
  arrange(desc(antal), desc(ord))
df
?message
message("The word '", df$ord[1],"' is present ", df$antal[1], " times.")

msg_str <- str_c("The word '", df$ord[1],"' is present ", df$antal[1], " times.", sep = "")
message(msg_str)


for(i in 1:100000) {
  if(i %% 1000 == 0) message("Iteration ", i)
}



?str_detect
?str_extract
?str_replace

# Telefonnummer:
# 3 Grupper av nummer
# 1) tre siffror, 2-9 följt av två siffror 0-9
# 2) 3 siffror 0-9
# 3) 4 siffror 0-9

strings <- c(" 219 733 8965", "329-293-8753 ", "banana", "595 794 7569",
             "387 287 6718", "apple", "233.398.9187  ", "482 952 3315", 
             "239 923 8115","842 566 4692", "Work: 579-499-7527", "$1000", 
             "Home: 543.355.3679")

strings

# Regex för telefonnummer
# Grupp 1:
"[2-9][0-9][0-9]"
grupp1 <- "[2-9][0-9]{2}"

# Grupp 2:
grupp2 <- "[0-9]{3}"

# Grupp 3:
grupp3 <- "[0-9]{4}"

# Seperarer grupperna
separerar <- "[ -.]"

telefon_regex <- str_c("(",grupp1,")",separerar,"(",grupp2,")",separerar,"(",grupp3,")")

strings

str_detect(string = strings, pattern = telefon_regex)

strings[str_detect(string = strings, pattern = telefon_regex)]

loc <- str_locate(string = strings, pattern = telefon_regex)
loc

loc[1,]
loc[,1]
class(loc)

str_sub(string = strings, start = loc[,"start"], end = loc[,"end"])

str_match(string = strings, pattern = telefon_regex)
m1 <- str_match(string = strings, pattern = telefon_regex)
m1
class(m1)
m1[1,2]

str_replace(string = strings, pattern = telefon_regex, replacement = "XXX-XXX-XXXX")


strings
all_in_one <- str_c(strings, collapse = " ")
all_in_one
str_replace(string = all_in_one, pattern = telefon_regex, replacement = "XXX-XXX-XXXX")

str_replace_all(string = all_in_one, pattern = telefon_regex, replacement = "XXX-XXX-XXXX")

str_extract(string = all_in_one, pattern = telefon_regex)
str_match(string = all_in_one, pattern = telefon_regex)

str_match_all(string = all_in_one, pattern = telefon_regex)


messy <- data.frame(
  name = c("Wilbur","Petunia","Gregory"),
  a = c(67, 80, 64),
  b = c(56, 90, 50)
)
messy

?pivot_longer
tidy <- messy %>%
  pivot_longer(cols = c("a","b"), names_to = "drug", values_to = "heartrate")

tidy
class(tidy)

as.data.frame(tidy)

messy2 <- tidy %>%
  pivot_wider(names_from = "drug", values_from = "heartrate")
messy2

library(nycflights13)
head(flights)


flights <- flights %>%
  mutate(
    gain = arr_delay - dep_delay,
    speed = distance / air_time * 60
  )

?summarise
flights %>%
  summarise(
    delay = mean(dep_delay, na.rm = TRUE)
  )


flights %>%
  group_by(year, month, day)

flights %>%
  group_by(year, month, day) %>%
  summarise(
    delay = mean(dep_delay, na.rm = TRUE)
  )

flights %>%
  filter(dep_delay > 0) %>%
  group_by(month) %>%
  summarise(
    delay = mean(dep_delay, na.rm = TRUE)
  )

flights %>%
  filter(dep_delay > 0) %>%
  group_by(month) %>%
  summarise(
    delay = mean(dep_delay, na.rm = TRUE),
    delay_std = sd(dep_delay, na.rm = TRUE),
    max_delay = max(dep_delay, na.rm = TRUE)
  )

flights %>%
  filter(dep_delay > 0) %>%
  group_by(month) %>%
  summarise(
    delay = mean(dep_delay, na.rm = TRUE),
    delay_std = sd(dep_delay, na.rm = TRUE),
    max_delay = max(dep_delay, na.rm = TRUE),
    cor_delat = cov(dep_delay, arr_delay)
  ) %>%
  mutate(
    month = factor(month, labels = month.abb)
  ) %>%
  ggplot() +
  aes(x = month) +
  geom_point(mapping = aes(y = delay, size = max_delay))

flights_with_delay <- filter(.data = flights, dep_delay > 0)
flights_with_delay_per_month <- group_by(.data = flights_with_delay, month)
flights_summarise <- summarise(.data = flights_with_delay_per_month,
                               delay = mean(dep_delay, na.rm = TRUE),
                               delay_std = sd(dep_delay, na.rm = TRUE),
                               max_delay = max(dep_delay, na.rm = TRUE)
                               )

flights_summarise

flights_summarise_month_names <- mutate(.data = flights_summarise,
                                        month = factor(month, labels = month.abb)
                                        )
flights_summarise_month_names

p <- ggplot(data = flights_summarise_month_names) +
  aes(x = month) + 
  geom_point(aes(y = delay)) +
  geom_point(aes(y = max_delay, color = "red"))

p
month.name
month.abb
?factor
