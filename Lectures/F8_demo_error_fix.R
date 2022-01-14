
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
# Modern databearbetning
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------

#----------------------------------------------------------------------------
# Tidy R
# Taget från: https://blog.rstudio.org/2014/07/22/introducing-tidyr/
#----------------------------------------------------------------------------


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
tidy<-pivot_longer(data = messy,c("a","b"),names_to="drug",values_to="heartrate")

tidy

# Make multiple observations per row again


# old style:
# spread(tidy, key = drug, value = heartrate)
pivot_wider(data = tidy,names_from="drug",values_from = "heartrate")
messy

# Multiple variables in same columns
set.seed(10)
messy <- data.frame(
  id = 1:4,
  trt = sample(rep(c('control', 'treatment'), each = 2)),
  work.T1 = runif(4),
  home.T1 = runif(4),
  work.T2 = runif(4),
  home.T2 = runif(4)
)

messy

tidier<-pivot_longer(data = messy,cols = 1:6,names_to="key",values_to="time")
#tidier <- gather(data = messy, key = key, value = time, -id, -trt)
# Can use stringr or...
tidy <- separate(tidier, key, into = c("location", "time"), sep = "\\.") 



#----------------------------------------------------------------------------
# dplyr
# Taget från: https://blog.rstudio.org/2014/07/22/introducing-tidyr/
#----------------------------------------------------------------------------


#install.packages("nycflights13")
library(dplyr)
library(nycflights13)

data(flights)
class(flights)

# Select
select(.data = flights, day, year, dep_delay)

# Filter
filter(flights, day == 1 & dep_delay > 60)

# Arrange
arrange(flights, desc(dep_delay))
system.time(
  arrange(flights, dep_delay)
)

system.time(
  flights[order(flights$dep_delay, decreasing = TRUE),]
)

# Mutate
flights <- 
  mutate(flights,
         gain = arr_delay - dep_delay,
         speed = distance / air_time * 60)
select(flights, gain, speed)

# Summarise
summarise(flights,
          delay = mean(dep_delay, na.rm = TRUE))

# Group by
daily <- group_by(flights, year, month, day)
per_day   <- summarise(daily, flights = n(), delay = mean(dep_delay, na.rm = TRUE))

per_day

# Join
# There are different joins for different purposes, see ?join
flights2 <- left_join(flights, per_day)
select(flights2, dep_delay, delay)

