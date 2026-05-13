# Klass: Rektangel
# Höjd och bredd

my_obj <- list(hojd = 3, bredd = 2)
class(my_obj) <- "rektangel"

str(my_obj)

my_obj$bredd

# Skapa konstruktor
rektangel <- function(hojd, bredd) {
  if(!is.numeric(hojd)) stop("Hojd ska vara ett tal")
  if(!is.numeric(bredd)) stop("Bredd ska vara ett tal")
  my_obj <- list(hojd = hojd, bredd = bredd)
  class(my_obj) <- "rektangel"
  return(my_obj)
}

rekt_1 <- rektangel(hojd = 3, bredd = 5)
rekt_2 <- rektangel(hojd = 1, bredd = 10)

print(rekt_1)

# Ny metod funktion för print
print.rektangel <- function(rektangel) {
  cat("Rektangel med höjd", rektangel$hojd, "och bredd", rektangel$bredd)
}

print(rekt_1)
print.default(rekt_1)

# Klass: Cirkel
# radie

cirkel <- function(radie) {
  my_obj <- list(radie = radie)
  class(my_obj) <- "cirkel"
  return(my_obj)
}

cirk_1 <- cirkel(radie = 1)

print.cirkel <- function(cirkel) {
  cat("Cirkel med radien", cirkel$radie)
}

print(cirk_1)

# Arean och omkretsen
omkrets <- function(x) {
  UseMethod("omkrets")
}

omkrets(rekt_1)

# defaultfunktion
omkrets.default <- function(x) {
  cat("Omkrets not yet defined for your object!")
}

omkrets(rekt_1)

omkrets.rektangel <- function(rektangel) {
  svar <- 2*(rektangel$hojd + rektangel$bredd)
  return(svar)
}

omkrets(rekt_1)
omkrets(rekt_2)

omkrets.cirkel <- function(cirkel) {
  svar <- 2 * pi * cirkel$radie
  return(svar)
}

omkrets(cirk_1)
omkrets(rekt_1)

# Samma sak för arean

area <- function(x) {
  UseMethod("area")
}

area.default <- function(x) {
  cat("Area not yet implemented!")
}

area.rektangel <- function(rektangel) {
  area <- rektangel$hojd * rektangel$bredd
  return(area)
}

area.cirkel <- function(cirkel) {
  area <- pi * cirkel$radie**2
  return(area)
}

# Kvadrat
# Rektangel där bredd = hojd
kvadrat <- function(sida) {
  my_obj <- rektangel(hojd = sida, bredd = sida)
  class(my_obj) <- c("kvadrat", class(my_obj))
  return(my_obj)
}

kvad_1 <- kvadrat(3)
str(kvad_1)

omkrets(kvad_1)
area(kvad_1)

print(kvad_1)

print.kvadrat <- function(kvadrat) {
  cat("Kvadrat med sidan", kvadrat$bredd)
}

print(kvad_1)


mina_geometriska_figurer <- list(
  kvadrat(4),
  kvadrat(10),
  rektangel(1,2),
  rektangel(4,5),
  cirkel(5),
  rektangel(2, 3),
  cirkel(10)
)

?lapply
lapply(mina_geometriska_figurer, FUN = area)


plot.cirkel <- function(cirkel) {
  theta <- seq(0, 2*pi, length.out = 1000)
  x <- cirkel$radie * cos(theta)
  y <- cirkel$radie * sin(theta)
  plot(x, y, type = "l")
}
plot(cirk_1)

# Lite om datum och tid
library(lubridate)


nu <- now()
nu

as.numeric(nu)

?now

now(tzone = "UTC")
now(tzone = "EST")
now(tzone = "GMT")

now(tzone = "America/New_York")
now(tzone = "Europe/Helsinki")
nu <- now(tzone = "Asia/Shanghai")
as.numeric(nu)
?ymd_hms
en_tid <- ymd_hms("2026-05-06 13:15:00", tz = "CET")
en_tid <- ymd_hms("2026-05-06 13:15:00", tz = "Europe/Stockholm")
en_tid
now() < en_tid

en_tid_ny <- with_tz(en_tid, tzone = "America/New_York")
en_tid_ny
en_tid

en_tid == en_tid_ny
as.numeric(en_tid)
as.numeric(en_tid_ny)

sommartid <- ymd_h("2026-03-28 14", tz = "CET")
sommartid
sommartid + days(1)
sommartid + ddays(1)

skottar <- ymd("2024-02-01", tz = "CET")
skottar + years(1)
skottar + dyears(1.5)

now() + dminutes(7.5)

roligt_format <- ymd("Ett år 1988 en månad 1 här kommer massa text 6")
roligt_format

roligt_format <- ymd("Ett år 1988 en månad Jan här kommer massa text 6 mer text")
roligt_format

roligt_format_3 <- ymd("20260506")
roligt_format_3

roligt_format_4 <- ymd("260506")
roligt_format_4

wday(now(), week_start = 1)

wday(today(), week_start = 1, label = TRUE)
wday(today(), week_start = 1, label = TRUE, abbr = FALSE)
wday(today(), week_start = 1, label = TRUE, abbr = FALSE, locale = "sv_SE")
wday(today(), week_start = 1, label = TRUE, abbr = FALSE, locale = "fi_FI")
wday(today(), week_start = 1, label = TRUE, abbr = FALSE, locale = "en_GB")
wday(today(), week_start = 1, label = TRUE, abbr = FALSE, locale = "en_US")
wday(today(), week_start = 1, label = TRUE, abbr = FALSE, locale = "ko_KR")
wday(today(), week_start = 1, label = TRUE, abbr = FALSE, locale = "ja_JP")

veckodagar <- c("måndag", "tisdag", "onsdag", "torsdag", "fredag", "lördag", "söndag")
veckodagar[wday(today(), week_start = 1)]


intervall <- today() %--% ymd("2026-06-02")
intervall

en_dag <- ymd("2026-05-18")
en_dag
# Funkar inte
en_dag %in% intervall

en_dag >= int_start(intervall) && en_dag <= int_end(intervall)

dagar_i_intervallet <- seq(from = int_start(intervall), to = int_end(intervall), by="days")
dagar_i_intervallet
en_dag %in% dagar_i_intervallet
