### Assignment : hi_name ###

context("hi_name()")

test_that("Kontroll av hi_name", {
  expect_true(exists("hi_name"),
              info = "Fel: hi_name() saknas.")
  checkmate::expect_function(hi_name)
  
  expect_function_self_contained(object = hi_name,
                                 "Fel: Funktionen innehåller fria variabler")
  
  expect_function_arguments(hi_name, "namn")
  
  expect_output(hi_name("Johan"), "Johan!",
                info = "Fel: Funktionen skriver inte ut namnet med utropstecken.")
  expect_output(hi_name("Lisa"), "Lisa!",
                info = "Fel: Funktionen skriver inte ut namnet med utropstecken.")
  expect_output(hi_name("Johan"), "Hi",
                info = "Fel: Funktionen skriver inte ut 'Hi' i början.")
  expect_output(hi_name("Johan"), "Keep coding!",
                info = "Fel: Funktionen skriver inte ut 'Keep coding!' i slutet.")
  expect_output(hi_name("Josef"), "Hi Josef! Keep coding!",
                info = "Fel: Funktionen skriver inte ut rätt textsträng, ska vara 'Hi Josef! Keep coding!'")
  temp <- capture.output(ret_val <- hi_name("Johan"))
  expect_null(ret_val,
              info = "Fel: Funktionen ska inte returnera något, bara skriva ut till Console")
})

