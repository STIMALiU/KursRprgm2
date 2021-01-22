### Assignment : orth_scalar_prod ###

context("orth_scalar_prod()")

test_that("Kontroll av orth_scalar_prod.", {
  
  expect_true(object = exists("orth_scalar_prod"),
              info = "Fel: orth_scalar_prod() saknas.")
  
  checkmate::expect_function(orth_scalar_prod)  
  
  expect_function_self_contained(object = orth_scalar_prod,
                        "Fel: Funktionen innehåller fria variabler")
  
  expect_function_arguments(orth_scalar_prod, c("a", "b"))
  
  checkmate::expect_number(orth_scalar_prod(a=1:3, b=4:6),
              info = "Fel: Funktionen returnerar inte ett numeriskt värde.")
  expect_equal(length(orth_scalar_prod(a=1:3, b=4:6)), 1,
              info = "Fel: Funktionen returnerar inte ett värde.")
  expect_equal(orth_scalar_prod(a=1:3, b=4:6), 32,
               info = "Fel: Funktionen returnerar inte ett korrekt värde.")
  expect_equal(orth_scalar_prod(a=5:10, b=20:25), 1030,
               info = "Fel: Funktionen returnerar inte ett korrekt värde.")
  
  expect_function_code(object = orth_scalar_prod, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")  
})

