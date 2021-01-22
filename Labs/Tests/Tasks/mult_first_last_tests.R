### Assignment : mult_first_last ###

context("mult_first_last()")

test_that("Kontroll av mult_first_last.", {
  expect_true(exists("mult_first_last"),
              info = "Fel: mult_first_last() saknas.")
  checkmate::expect_function(mult_first_last)  
  expect_function_self_contained(object = mult_first_last,
                        "Fel: Funktionen innehåller fria variabler")
  
  expect_function_arguments(mult_first_last, c("vektor"))

  checkmate::expect_number(mult_first_last(5:10),
              info = "Fel: Funktionen returnerar inte ett numeriskt värde.")
  expect_silent(mult_first_last(5:10))
  expect_equal(length(mult_first_last(5:10)), 1,
              info = "Fel: Funktionen returnerar inte ett värde.")
  expect_equal(mult_first_last(vektor=5:10), 50,
               info = "Fel: Funktionen returnerar inte rätt värde för vektor = 5:10.")
  expect_equal(mult_first_last(vektor=c(8,1,1,1,0,5)), 40,
               info = "Fel: Funktionen returnerar inte rätt värde för vektor = c(8,1,1,1,0,5).")
  expect_function_code(object = mult_first_last, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")
})

