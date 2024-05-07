# Klass: Rektangel
# Höjd och bredd

my_object <- list(hojd = 3, bredd = 2)
class(my_object) <- "rektangel"

class(my_object)
my_object$hojd
my_object$bredd

# Konstruktor
rektangel <- function(hojd, bredd) {
  obj <- list(hojd = hojd, bredd = bredd)
  class(obj) <- "rektangel"
  return(obj)
}

rektangel(4,3)

# Utöka print funktion
print(rektangel(4,3))

print.rektangel <- function(x) {
  cat("Rektangel med Höjd", x$hojd, "Bredd", x$bredd)
}

print(rektangel(4,3))

methods(data)
methods(print)

# Skriv en egen generisk funktion för area
area <- function(x) {
  UseMethod("area")
}

methods(area)

# Börja med att skapa default
area.default <- function(x) {
  cat("No method available")
}

methods(area)

area(rektangel(4,3))

# Metod för rektangel
area.rektangel <- function(x) {
  arean <- x$hojd * x$bredd
  return(arean)
}

area(rektangel(4,3))

# Skapa en kvadrat
my_object <- rektangel(4,4)
my_object$langd <- 4
class(my_object) <- c("kvadrat", "rektangel")

kvadrat <- function(langd) {
  obj <- rektangel(langd, langd)
  obj$langd <- langd
  class(obj) <- c("kvadrat", class(obj))
  return(obj)
}

min_kvadrat <- kvadrat(4)

print(min_kvadrat)
area(min_kvadrat)

print.kvadrat <- function(x) {
  cat("Kvadrat med Längd",x$langd)
}

print(min_kvadrat)
area(min_kvadrat)


my_object <- list(sida = 2, bredd = 4, vinkel = 80)
class(my_object) <- "parallellogram"

# Konstruktor för parallellogram
parallellogram <- function(sida, bredd, vinkel) {
  if (sida <= 0 | bredd <= 0) stop("Negativa längder")
  if (vinkel <= 0 | vinkel > 90) stop("Vinkel ska vara mellan 0 och 90")
  obj <- list(sida = sida, bredd = bredd, vinkel = vinkel)
  class(obj) <- "parallellogram"
  return(obj)
}

parallellogram_1 <- parallellogram(2, 4, 80)
parallellogram(1,4,160)

area.parallellogram <- function(x) {
  # Konvertera grader till radianer
  radianer <- x$vinkel*pi/180
  hojd <- sin(radianer) * x$sida
  arean <- hojd * x$bredd
  return(arean)
}

area(parallellogram_1)

area(parallellogram(2,4,90))

# Datum och tid

library(lubridate)
nu <- now()
nu
now(tzone = "UTC")
now(tzone = "EST")
now(tzone = "America/New_York")
now(tzone = "America/Los_Angeles")

en_tid <- ymd_hms("2024-03-30 22:22:22", tz = "Europe/Stockholm")
en_tid
with_tz(en_tid, tzone = "Asia/Shanghai")

en_tid + days(1)
en_tid + ddays(1)

?with_tz

wday(en_tid, label = TRUE, week_start = 1)

wday(en_tid, label = TRUE, abbr = FALSE, week_start = 1)

wday(en_tid, label = TRUE, abbr = FALSE, week_start = 1, locale = "sv_SE")

wday(en_tid, label = TRUE, abbr = FALSE, week_start = 1, locale = "en_GB")

wday(en_tid, label = TRUE, abbr = FALSE, week_start = 1, locale = "fi_FI")

wday(en_tid, label = TRUE, abbr = FALSE, week_start = 1, locale = "ru_RU")

month(en_tid, label = TRUE, abbr = TRUE, locale = "sv_SE")

en_tid

en_ny_tid <- today()
en_tid
en_ny_tid
en_tid < en_ny_tid

today() < now()

?ymd_hms
tid_am <- ymd_h("2024-02-28 4 AM")
tid_am
tid_pm <- ymd_h("2024-02-28 4 PM")
tid_pm
ymd_hms("2009 arbitrary 1 non-decimal 6 chars 12 in between 1 !!! 6")


intervall_1 <- ymd("2024-02-28") %--% ymd("2024-06-04")
intervall_1
today() %in% intervall_1
intervall_1@start
int_end(intervall_1)

int_start(intervall_1)
(today() >= int_start(intervall_1) & today() <= int_end(intervall_1))

nu1 <- now()
nu1
nu2 <- now(tzone = "America/New_York")
nu2
nu1 < nu2
