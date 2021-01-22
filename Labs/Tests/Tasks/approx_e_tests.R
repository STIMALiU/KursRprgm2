### Assignment : approx_e ###

context("approx_e()")

test_that("approx_e()", {
  
  expect_true(exists("approx_e"),
              info = "Fel: approx_e() saknas.")
  checkmate::expect_function(approx_e)
  
  expect_function_arguments(approx_e, "N")

  checkmate::expect_number(approx_e(2))
  expect_silent(approx_e(2))

  expect_equal(approx_e(2), 2.5,
              info = "Fel: Funktionen returnerar fel värde.")
  expect_equal(approx_e(4), 2.708333, tolerance=0.0001,
               info = "Fel: Funktionen returnerar fel värde.")
  expect_equal(approx_e(100), exp(1), 
               info = "Fel: Funktionen returnerar fel värde.")
  expect_function_code(object = approx_e, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")  
})

