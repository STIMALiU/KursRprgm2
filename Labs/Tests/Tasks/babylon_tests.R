### Assignment : babylon() ###
context("babylon()")

test_that("Assignment: babylon()", {
  
  expect_true(exists("babylon"),
              info = "Fel: babylon() saknas.")
  
  checkmate::expect_function(babylon, nargs = 3,
              info = "Fel: babylon är inte en funktion.")
  
  expect_function_self_contained(object = babylon,
                        "Fel: Funktionen innehåller fria variabler")
  
  expect_function_arguments(babylon, c("x", "init", "tol"))
  
  checkmate::expect_list(babylon(x=2, init=1.5, tol=0.01),
                         info = "Fel: Funktionen returnerar inte en lista.")
  
  expect_silent(babylon_output <- babylon(x=2, init=1.5, tol=0.01))
  checkmate::expect_names(names(babylon_output), permutation.of = c("iter", "rot"))
  
  expect_equal(babylon(x=2, init=1.5, tol=0.01)$rot, 1.414216, tolerance = .01,
              info = "Fel: Approximationen är felaktig för x = 2, init = 1.5 och tol = 0.01.")
  
  expect_equal(babylon(x=2, init=1.5, tol=0.01)$iter, 2,
               info = "Fel: Antalet iterationer är felaktig för x = 2, init = 1.5 och tol = 0.01.")  
  
  test_exact<-babylon(x=2, init=1.5, tol=0.01)$rot == sqrt(2)
  if(length(test_exact)==1){
    expect_false(test_exact,
                 info = "Fel: Ingen approximation gjorde, utan det exakta värdet används.") 
  }
  
  expect_equal(babylon(x=15, init=1.5, tol=0.01)$rot, 3.872, tolerance = .01,
               info = "Fel: Approximationen är felaktig för x = 15, init = 1.5 och tol = 0.01.")
  
  expect_equal(babylon(x=15, init=1.5, tol=0.01)$iter, 5,
               info = "Fel: Antalet iterationer är felaktig för x = 15, init = 1.5 och tol = 0.01.")
  
  expect_equal(babylon(x=15, init=0.1, tol=0.01)$rot, 3.872, tolerance = .01,
               info = "Fel: Approximationen är felaktig för x = 15, init = 1.5 och tol = 0.01.")
  
  expect_equal(babylon(x=15, init=0.1, tol=0.01)$iter, 9,
               info = "Fel: Antalet iterationer är felaktig för x = 15, init = 1.5 och tol = 0.01.")  
  
  expect_function_code(object = babylon, expected = "return", 
                       info = "Fel: return() saknas i funktionen.") 
  
  expect_no_forbidden_function_code(babylon, "sqrt") 
})

