
context("days_to_birthday()")

test_that("days_to_birthday()", {  
  library(lubridate)
  library(stringr)
  #body_contain<-function(object,expected) {any(grepl(x = as.character(body(object)), pattern = expected))}
  #package_loaded<-function(object){any(grepl(object, search()))}
  
  
  expect_true(exists("days_to_birthday"),
              info = "Fel: days_to_birthday() saknas.")
  expect_true(is.function(days_to_birthday),
              info = "Fel: days_to_birthday är inte en funktion.")
  expect_function_self_contained(object = days_to_birthday,
                                 "Fel: Funktionen innehåller fria variabler")
  
  expect_function_arguments(object = days_to_birthday,expected = c("name", "birth"),
                            info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  
  
  # testar struktur på output:
  expect_true(is.character(days_to_birthday("Johan", ymd("1988-07-06") )),
              info="Fel: Funktionen returnerar inte en textsträng")
  
  
  expect_equal(length(days_to_birthday("Johan", ymd("1988-07-06"))), 1,
               info="Fel: Funktionen returnerar mer än ett element, ska bara returnera 1 textsträng")
  
  # testar värden på output:
  # --- test 1 --- 
  expect_equal(days_to_birthday("Johan", ymd("1988-07-06")),
               "Johan, you have 25 days until your next birthday! You will turn 37",
               info="Fel: Funktionen returnerar inte korrekt textsträng vid
               days_to_birthday('Johan', ymd('1988-07-06'))")
  
  # --- test 2 --- 
  expect_equal(days_to_birthday("Elvis", ymd("1935-01-08")),
               "Elvis, you have 211 days until your next birthday! You will turn 91",
               info="Fel: Funktionen returnerar inte korrekt textsträng vid
               days_to_birthday('Elvis', ymd('1935-01-08'))")
  
  # --- test 3 --- 
  expect_equal(days_to_birthday("Klara", ymd("2008-06-12")),
               "Klara, you have 1 days until your next birthday! You will turn 17",
               info="Fel: Funktionen returnerar inte korrekt textsträng vid
               days_to_birthday('Klara', ymd('2008-06-12'))")
  
  # --- test 4 --- 
  expect_equal(days_to_birthday("Anton", ymd("1754-06-10")),
               "Anton, you have 364 days until your next birthday! You will turn 272",
               info="Fel: Funktionen returnerar inte korrekt textsträng vid
               days_to_birthday('Anton', ymd('1754-06-10'))")
  
  
  
  
})
