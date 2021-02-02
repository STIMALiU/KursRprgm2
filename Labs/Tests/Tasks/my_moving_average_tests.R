### Assignment : my_moving_average() ###

context("my_moving_average()")

test_that("Assignment: my_moving_average()", {
  
  x <- 1:3
  y <- c(1, 5, 6, 7, 7, 1, -2)
  y_res_n2 <- c(3.0, 5.5, 6.5, 7.0, 4.0, -0.5) 

  expect_true(exists("my_moving_average"),
              info = "Fel: my_moving_average() saknas.")  
  checkmate::expect_function(my_moving_average, nargs = 2,
              info = "Fel: my_moving_average är inte en funktion.")
  expect_function_self_contained(object = my_moving_average,
                        "Fel: Funktionen innehåller fria variabler")
  
  expect_function_arguments(my_moving_average, expected = c("x","n"),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  checkmate::expect_numeric(my_moving_average(x=y, n=2),
              info = "Fel: Funktionen returnerar inte en numerisk vector.")
  
  expect_silent(my_moving_average(x=y, n=2))
  
  expect_true(all(my_moving_average(x=y, n=2) == y_res_n2),
              info = "Fel: Funktionen returnerar fel om x = c(1,5,6,7,7,1,-2), n=2. Returen ska vara c(3.0, 5.5, 6.5, 7.0, 4.0, -0.5)")
  
  expect_error(my_moving_average(x="Pelle", n=3),
               info = "Fel: Funktionenen stoppar inte om x är icke numerisk.")  
  expect_error(my_moving_average(x=FALSE, n=5), "Not a numeric vector!",
               info = "Fel: Funktionen returnerar inte rätt felmeddelande.")
  
  expect_equal(my_moving_average(x = 5:15,n = 4), c( 6.5 , 7.5,  8.5 , 9.5 ,10.5, 11.5, 12.5, 13.5),
               info="Fel: Funktionen returnerar fel om x=5:15 och n=4")
   
  expect_equal(my_moving_average(x = 1:10,n = 2), c( 1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5, 8.5,9.5),
               info="Fel: Funktionen returnerar fel om x=1:10 och n=2")
  
  expect_function_code(object = my_moving_average, expected = "return", 
                       info = "Fel: return() saknas i funktionen.") 
  
  # icke tillåten kod:
  expect_no_forbidden_function_code(my_moving_average, forbidden = "filter")
  expect_no_forbidden_function_code(my_moving_average, forbidden = "ma\\(")
  expect_no_forbidden_function_code(my_moving_average, forbidden = "forecast")
  expect_no_forbidden_function_code(my_moving_average, forbidden = "rollmean\\(")
  expect_no_forbidden_function_code(my_moving_average, forbidden = "zoo")
  expect_no_forbidden_function_code(my_moving_average, forbidden = "SMA\\(")
  expect_no_forbidden_function_code(my_moving_average, forbidden = "TTR")
  expect_no_forbidden_function_code(my_moving_average, forbidden = "sma\\(")
  expect_no_forbidden_function_code(my_moving_average, forbidden = "smooth")
  
})
