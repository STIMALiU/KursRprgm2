### Assignment : return_first_last ###

context("return_first_last()")

test_that("Kontroll av return_first_last", {
  expect_true(exists("return_first_last"),
              info = "Fel: return_first_last() saknas.")
  checkmate::expect_function(return_first_last)  
  expect_function_self_contained(object = return_first_last,
                                 "Fel: Funktionen innehåller fria variabler")
  
  expect_function_arguments(return_first_last, c("vektor"))
  checkmate::expect_numeric(return_first_last(5:10),
                            info = "Fel: Returnerar inte en vektor med tal.")
  expect_equal(length(return_first_last(5:10)), 2,
                           info = "Fel: Funktionen returnerar inte en vektor av längd 2.")
  expect_silent(return_first_last(5:10))
  expect_equal(return_first_last(vektor=5:10), c(5,10),
               info = "Fel: Funktionen returnerar inte rätt värde för vektor = 5:10.")
  expect_equal(return_first_last(vektor=c(8,1,1,1,0,5)), c(8,5),
               info = "Fel: Funktionen returnerar inte rätt värde för vektor = c(8,1,1,1,0,5).")
  expect_function_code(object = return_first_last, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")
})

