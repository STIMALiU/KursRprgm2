# Klass: Rektangel
# Höjd och bredd

my_obj <- list(hojd = 3, bredd = 2)
class(my_obj) <- "rektangel"

class(my_obj)
my_obj$hojd
my_obj$bredd

# Konstruktor
rektangel <- function(hojd, bredd) {
  my_obj <- list(hojd = hojd, bredd = bredd)
  class(my_obj) <- "rektangel"
  return(my_obj)
}

rektangel_1 <- rektangel(4,3)
rektangel_1

# Konstruktor för cirkel
# Cirkel behöver bara radie
cirkel <- function(radie) {
  my_obj <- list(radie = radie)
  class(my_obj) <- "cirkel"
  return(my_obj)
}

cirkel_1 <- cirkel(1)

print(rektangel_1)

# Utöka print funktionen
methods(print)

print.rektangel <- function(x) {
  cat("Rektangel med höjd ", x$hojd, " och bredd ", x$bredd)
}

print(rektangel_1)
print.default(rektangel_1)

?omkrets

# Skapa en generisk funktion
omkrets <- function(x) {
  UseMethod("omkrets")
}

# Skapa vår specifika funktion
omkrets.rektangel <- function(x) {
  svar <- 2*(x$hojd + x$bredd)
  return(svar)
}

methods(omkrets)

omkrets(rektangel_1)
omkrets(cirkel_1)

# Skapa default funktion
omkrets.default <- function(x) {
  cat("Omkrets not yet implemented for your object!")
}

omkrets(cirkel_1)

omkrets("Hej")

omkrets.cirkel <- function(x) {
  svar <- 2*pi*x$radie
  return(svar)
}

omkrets(cirkel_1)

# Area
area <- function(x) {
  UseMethod("area")
}

area.default <- function(x) {
  cat("Area ännu inte implementerad")
}

area.rektangel <- function(x) {
  area <- x$bredd * x$hojd
  return(area)
}

area.cirkel <- function(x) {
  area <- x$radie^2 * pi
  return(area)
}

area(rektangel_1)
area(cirkel_1)

# Skapa en kvadrat
# En rektangel med höjd=bredd
kvadrat <- function(bredd) {
  my_obj <- rektangel(hojd = bredd, bredd = bredd)
  class(my_obj) <- c("kvadrat", class(my_obj))
  return(my_obj)
}
k <- kvadrat(2)
k
omkrets(k)
area(k)
class(k)

# Skapa print för kvadrat
print.kvadrat <- function(x) {
  cat("Kvadrat med sidan ", x$bredd)
}

print(k)
omkrets(k)


# Datum of tid
# Lekte runt lite

library(lubridate)
nu <- now()
nu

?now

now(tzone = "UTC")
now(tzone = "EST")

now(tzone = "America/New_York")
now(tzone = "Europe/Stockholm")
now(tzone = "Europe/Copenhagen")
now(tzone = "Asia/Shanghai")

en_tid <- ymd_hms("2025-05-08 11:35:00", tz = "Europe/Stockholm")
en_tid

as.numeric(now())

en_tid
with_tz(en_tid, tzone = "Asia/Tokyo")

en_tid + days(1)

wday(en_tid, label = TRUE, week_start = 1)
wday(en_tid, label = TRUE, abbr = FALSE, week_start = 1)

wday(en_tid, label = TRUE, abbr = FALSE, week_start = 1, locale = "sv_SE")
?wday
wday(en_tid, label = TRUE, abbr = FALSE, week_start = 1, locale = "fi_FI")
wday(en_tid, label = TRUE, abbr = FALSE, week_start = 1, locale = "en_GB")
wday(en_tid, label = TRUE, abbr = FALSE, week_start = 1, locale = "en_US")
wday(en_tid, label = TRUE, abbr = FALSE, week_start = 1, locale = "ru_RU")

month(en_tid, label = TRUE, abbr = FALSE, locale = "sv_SE")


ymd_h("2025//05//05 4 PM")


ymd_hms("2009 några tecken 1 mer tecken 2 ännu mer saker 2 ./.. 2 .. 2")

today() < now()


intervall <- ymd("2025-01-01") %--% ymd("2025-06-30")
intervall

int_start(intervall)
int_end(intervall)

today() > int_start(intervall) && today() < int_end(intervall)
intervall@start
int_start(intervall)

innan_st <- ymd_h("2025-03-27 1", tz = "Europe/Stockholm")
innan_st + days(4)


