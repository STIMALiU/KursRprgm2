### Assignment : logical_equality ###

context("logical_equality()")

test_that("logical_equality()", {
  expect_true(exists("logical_equality"),
              info = "Fel: logical_equality() saknas.")
  
  checkmate::expect_function(logical_equality, args = c("A", "B"))
  
  expect_function_self_contained(object = logical_equality)
  
  expect_function_arguments(logical_equality, c("A", "B"))

  expect_silent(logical_equality(TRUE, TRUE))
  checkmate::expect_logical(logical_equality(TRUE, TRUE))
  
  expect_true(logical_equality(TRUE, TRUE))
  expect_false(logical_equality(FALSE, TRUE))
  expect_false(logical_equality(TRUE, FALSE))
  expect_true(logical_equality(FALSE, FALSE))
  expect_function_code(object = logical_equality, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")  
})


