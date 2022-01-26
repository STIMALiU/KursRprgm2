### Assignment : product_of_corners() ###

context("product_of_corners()")

test_that("Assignment: product_of_corners()", {
  
  testMatA1 <- matrix(c(3, 1, 5, 6), nrow = 2, ncol = 2)
  testMatB1 <- t(testMatA1)
  testMatA2 <- matrix(c(3, 1, 5, 6, 1, 1), nrow = 3, ncol = 3)
  testMatB2 <- t(testMatA2)
  testMatA3 <- matrix(c(3, 1, 5, 6, 1, 1), nrow = 1, ncol = 6)
  testMatB3 <- t(testMatA3)
  testMatA4 <- matrix(2:9, nrow = 2, ncol = 4)
  testMatB4 <- t(testMatA4)
  
  
  expect_true(exists("product_of_corners"),
              info = "Fel: product_of_corners() saknas.")
  
  checkmate::expect_function(product_of_corners, nargs = 1,
                             info = "Fel: product_of_corners är inte en funktion.")
  expect_function_self_contained(object = product_of_corners,
                                 "Fel: Funktionen innehåller fria variabler")
  
  expect_function_arguments(product_of_corners,c("A"),
                            info = "Fel: Argumentet i funktionen har felaktiga namn.")
  
  expect_silent(product_of_corners(A=testMatA1))
  checkmate::expect_number(product_of_corners(A=testMatA1),
                           info = "Fel: Funktionen returnerar inte ett värde")
  
  expect_equal(product_of_corners(A=testMatA1), prod(testMatA1),
               info = "Fel: Funktionen returnerar fel värde för matrisen matrix(c(3, 1, 5, 6), nrow = 2, ncol = 2).")
  
  expect_equal(product_of_corners(A=testMatA2), 3*3*5*5,
               info = "Fel: Funktionen returnerar fel värde för matrisen matrix(c(3, 1, 5, 6, 1, 1), nrow = 3, ncol = 3).")
  expect_equal(product_of_corners(A=testMatA4), 2*8*3*9,
               info = "Fel: Funktionen returnerar fel värde för matrisen matrix(2:9, nrow = 2, ncol = 4).")
  expect_function_code(object = product_of_corners, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")  
  })
