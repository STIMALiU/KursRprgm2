### Assignment : estimate_pi() ###

context("estimate_pi()")

test_that("Assignment: estimate_pi()", {
  
  expect_true(exists("estimate_pi"))
  checkmate::expect_function(estimate_pi, nargs = 2,
                             info = "Fel: estimate_pi är inte en funktion.")
  expect_function_arguments(estimate_pi, c("N","my_seed"))
  
  expect_silent(res <- estimate_pi(N = 10, my_seed = 1234))
  checkmate::expect_class(estimate_pi(N = 10, my_seed=4711), "list",
                          info = "Fel: funktionen returnerar inte en lista.")
  
  checkmate::assert_names(names(estimate_pi(N = 10, my_seed=4711)), permutation.of = c("est", "punkter"))
  checkmate::expect_class(estimate_pi(N = 10, my_seed=4711)$punkter, "data.frame",
                          info = "Fel: punkter är inte en data.frame")
  checkmate::assert_names(names(estimate_pi(N = 10, my_seed=4711)$punkter), permutation.of = c("x", "y"))
  out <- estimate_pi(N=20,my_seed = 1234)
  expect_equal( out$est , 4*mean(out$punkter$x^2 + out$punkter$y^2 <= 1),
               info = "Fel: Ert estimat för pi stämmer inte med era punkter.")
  out <- estimate_pi(N=1000,my_seed = 1234)
  expect_equal( out$est , 4*mean(out$punkter$x^2 + out$punkter$y^2 <= 1),
                info = "Fel: Ert estimat för pi stämmer inte med era punkter.")
  out <- estimate_pi(N=10000,my_seed = 5555)
  expect_equal( out$est , 4*mean(out$punkter$x^2 + out$punkter$y^2 <= 1),
                info = "Fel: Ert estimat för pi stämmer inte med era punkter.")
  expect_silent(estimate_pi(N = 1000))
  out <- estimate_pi(N=1000)
  expect_equal( out$est , 4*mean(out$punkter$x^2 + out$punkter$y^2 <= 1),
                info = "Fel: Ert estimat för pi stämmer inte med era punkter när inget seed är satt.")
})
