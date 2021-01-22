### Assignment : three_elements ###

context("three_elements()")

test_that("three_elements()", {
  expect_true(exists("three_elements"), 
              info = "Fel: three_elements() saknas.")
  checkmate::expect_function(three_elements, nargs = 0)
  

  checkmate::expect_numeric(three_elements())
  expect_silent(three_elements())
  expect_equal(length(three_elements()), 3,
              info = "Fel: Funktionen returnerar inte en vektor av längd 3.")
  expect_true(log(3) %in% three_elements(), 
              info="Kommentar: ln(3) saknas / är fel")
  expect_true(exp(pi+1) %in% three_elements() | exp(1)^(pi+1) %in% three_elements(), 
              info="Kommentar: e^(pi+1) saknas / är fel")
  expect_true(sin(pi/3) %in% three_elements(), 
              info="Kommentar: sin(pi/3) saknas / är fel")
  
  expect_function_code(object = three_elements, expected = "return\\(", 
                       info = "Fel: return() saknas i funktionen.")  
})


