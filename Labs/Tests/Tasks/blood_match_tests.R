### Assignment : blood_match() ###

context("blood_match()")

test_that("Assignment: blood_match()", {
  expect_true(exists("blood_match"),
              info = "Fel: blood_match() saknas.")
  
  checkmate::expect_function(blood_match, nargs = 1,
                             info = "Fel: blood_match är inte en funktion.")
  expect_function_self_contained(object = blood_match,
                                 "Fel: Funktionen innehåller fria variabler")
  expect_function_arguments(blood_match,c("patients"),
                            info = "Fel: Argumentet i funktionen har felaktiga namn.")
  
  test_patientsA = list(giver = list(AB0 = "0", rh = "-" ),
                        receiver = list(AB0 = "AB", rh = "+"))
  test_patientsB = list(giver = list(AB0 = "AB", rh = "+" ),
                        receiver = list(AB0 = "0", rh = "+"))
  test_patientsC = list(giver = list(AB0 = "0", rh = "+" ),
                        receiver = list(AB0 = "B", rh = "-"))
  test_patientsD = list(giver = list(AB0 = "A", rh = "H" ),
                        receiver = list(AB0 = "AB", rh = "+"))
  test_patientsE = list(giver = list(AB0 = "F", rh = "+" ),
                        receiver = list(AB0 = "AB", rh = "+"))
  expect_output(blood_match(test_patientsA), "They are a match",
                info = "Fel: Funktionen ger fel output för 0- till AB+")
  expect_output(blood_match(test_patientsB), "They are not a match",
                info = "Fel: Funktionen ger fel output för AB+ till 0+")
  expect_output(blood_match(test_patientsB), "Incompatible AB0",
                info = "Fel: Funktionen ger fel output för AB+ till 0+")
  expect_output(blood_match(test_patientsC), "They are not a match",
                info = "Fel: Funktionen ger fel output för 0+ till B-")
  expect_output(blood_match(test_patientsC), "Incompatible rh",
                info = "Fel: Funktionen ger fel output för 0+ till B-")
  expect_error(blood_match(""), "Not a list",
               info = "Fel: Inget fel om patients inte är en lista")
  expect_error(blood_match(test_patientsD), "Wrong bloodtype",
               info = "Fel: Inget fel om rh värde är felaktigt")
  expect_error(blood_match(test_patientsE), "Wrong bloodtype",
               info = "Fel: Inget fel om rh värde är felaktigt")
})
