### Assignment : mult_first_last ###

context("add_first_last()")

test_that("Kontroll av add_first_last", {
  expect_true(exists("add_first_last"),
              info = "Fel: add_first_last() saknas.")
  checkmate::expect_function(add_first_last)  
  expect_function_self_contained(object = add_first_last,
                                 "Fel: Funktionen innehåller fria variabler")
  
  expect_function_arguments(add_first_last, c("vektor"))
  
  checkmate::expect_number(add_first_last(5:10),
                           info = "Fel: Funktionen returnerar inte ett numeriskt värde.")
  expect_silent(add_first_last(5:10))
  expect_equal(length(add_first_last(5:10)), 1,
               info = "Fel: Funktionen returnerar inte ett värde.")
  expect_equal(add_first_last(vektor=5:10), 15,
               info = "Fel: Funktionen returnerar inte rätt värde för vektor = 5:10.")
  expect_equal(add_first_last(vektor=c(8,1,1,1,0,5)), 13,
               info = "Fel: Funktionen returnerar inte rätt värde för vektor = c(8,1,1,1,0,5).")
  expect_function_code(object = add_first_last, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")
})

