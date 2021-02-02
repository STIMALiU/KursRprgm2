### Assignment : my_matrix_prod() ###

context("my_matrix_prod()")

test_that("Assignment: my_matrix_prod()", {
  
  testMatA1 <- matrix(c(3, 1, 5, 6), nrow = 2, ncol = 2)
  testMatB1 <- t(testMatA1)
  testMatA2 <- matrix(c(3, 1, 5, 6, 1, 1), nrow = 3, ncol = 3)
  testMatB2 <- t(testMatA2)
  testMatA3 <- matrix(c(3, 1, 5, 6, 1, 1), nrow = 1, ncol = 6)
  testMatB3 <- t(testMatA3)  
  testMatA4 <- matrix(2:9, nrow = 2, ncol = 4)
  testMatB4 <- t(testMatA4)


  expect_true(exists("my_matrix_prod"),
              info = "Fel: my_matrix_prod() saknas.")
  
  checkmate::expect_function(my_matrix_prod, nargs = 2,
              info = "Fel: my_matrix_prod är inte en funktion.")
  expect_function_self_contained(object = my_matrix_prod,
                        "Fel: Funktionen innehåller fria variabler")

  expect_function_arguments(my_matrix_prod,c("A","B"),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  expect_silent(my_matrix_prod(A=testMatA1, B=testMatB1))
  checkmate::expect_matrix(my_matrix_prod(A=testMatA1, B=testMatB1),
              info = "Fel: Funktionen returnerar inte en matris.")
  
  expect_equal(my_matrix_prod(A=testMatA1, B=testMatB1), testMatA1%*%testMatB1,
              info = "Fel: Funktionen returnerar fel värde för två 2*2 matriser.")
  
  expect_equal(my_matrix_prod(A=testMatA2, B=testMatB2), testMatA2%*%testMatB2,
               info = "Fel: Funktionen returnerar fel värde för två 3*3 matriser.")
  expect_equal(my_matrix_prod(A=testMatA3, B=testMatB3), testMatA3%*%testMatB3,
               info = "Fel: Funktionen returnerar fel värde för två matriser, med dimensioner 1*6 och 6*1.")
  expect_equal(my_matrix_prod(A=testMatA4, B=testMatB4), testMatA4%*%testMatB4,
               info = "Fel: Funktionen returnerar fel värde för två matriser , med dimensioner 2*4 och 4*2.")
  
  expect_error(my_matrix_prod(A=testMatB3, B=testMatB3),
               info = "Fel: Funktionenen stoppar inte om dimensionerna är fel.")  
  expect_error(my_matrix_prod(A=testMatB3, B=testMatB3), "Matrix dimensions mismatch",
               info = "Fel: Funktionen returnerar inte rätt felmeddelande då dimensionerna är fel.")  
  
  expect_function_code(object = my_matrix_prod, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")  
  
  expect_no_forbidden_function_code(my_matrix_prod, "%*%")
})
