### Assignment : coin_test() ###

context("coin_test()")

test_that("Assignment: coin_test()", {
  
  # testfall:
  text1 <- c("Josef singlade slant, klave blev resultatet!",
"Josef singlade slant, klave blev resultatet!",
"Johan singlade slant, krona blev resultatet!",
"Johan singlade slant, klave blev resultatet!",
"Johan singlade slant, klave blev resultatet!",
"Josef singlade slant, krona blev resultatet!",
"Josef singlade slant, krona blev resultatet!",
"Johan singlade slant, klave blev resultatet!",
"Johan singlade slant, krona blev resultatet!",
"Josef singlade slant, klave blev resultatet!",
"Josef singlade slant, krona blev resultatet!",
"Josef singlade slant, krona blev resultatet!",
"Johan singlade slant, klave blev resultatet!",
"Johan singlade slant, krona blev resultatet!",
"Josef singlade slant, krona blev resultatet!",
"Josef singlade slant, klave blev resultatet!",
"Johan singlade slant, klave blev resultatet!",
"Johan singlade slant, krona blev resultatet!",
"Johan singlade slant, klave blev resultatet!",
"Josef singlade slant, krona blev resultatet!")
  text2 <-  c("Adam singlade slant, klave blev resultatet!",
"Bertil singlade slant, klave blev resultatet!",
"Bertil singlade slant, krona blev resultatet!",
"Bertil singlade slant, klave blev resultatet!",
"Adam singlade slant, krona blev resultatet!",
"Adam singlade slant, krona blev resultatet!",
"Bertil singlade slant, krona blev resultatet!",
"Bertil singlade slant, klave blev resultatet!",
"Adam singlade slant, krona blev resultatet!",
"Adam singlade slant, krona blev resultatet!",
"Adam singlade slant, krona blev resultatet!",
"Adam singlade slant, klave blev resultatet!",
"Bertil singlade slant, krona blev resultatet!",
"Bertil singlade slant, klave blev resultatet!",
"Bertil singlade slant, klave blev resultatet!",
"Adam singlade slant, krona blev resultatet!",
"Bertil singlade slant, klave blev resultatet!",
"Bertil singlade slant, krona blev resultatet!",
"Adam singlade slant, klave blev resultatet!",
"Bertil singlade slant, klave blev resultatet!",
"Adam singlade slant, klave blev resultatet!",
"Adam singlade slant, krona blev resultatet!",
"Adam singlade slant, klave blev resultatet!",
"Bertil singlade slant, klave blev resultatet!",
"Adam singlade slant, klave blev resultatet!",
"Bertil singlade slant, klave blev resultatet!",
"Bertil singlade slant, klave blev resultatet!",
"Adam singlade slant, krona blev resultatet!",
"Adam singlade slant, krona blev resultatet!",
"Adam singlade slant, krona blev resultatet!",
"Bertil singlade slant, klave blev resultatet!",
"Adam singlade slant, klave blev resultatet!",
"Adam singlade slant, krona blev resultatet!",
"Bertil singlade slant, klave blev resultatet!",
"Bertil singlade slant, klave blev resultatet!",
"Bertil singlade slant, klave blev resultatet!",
"Adam singlade slant, klave blev resultatet!",
"Adam singlade slant, krona blev resultatet!",
"Adam singlade slant, krona blev resultatet!",
"Adam singlade slant, klave blev resultatet!")

  expect_that(coin_test, is_a("function"),
              info = "Fel: coin_test är inte en funktion.")
  
  expect_function_arguments(coin_test, c("text","alpha"),
              info = "Fel: Fel namn på argumenten")

  expect_function_self_contained(object = coin_test,
                        "Fel: Funktionen har fria variabler")
  expect_that(suppressMessages(coin_test(text=text1, alpha = 0.05)), is_a("table"),
              info = "Fel: Funktionen returnerar inte en table")
  
  expect_equal(suppressMessages(dimnames(coin_test(text=text1, alpha = 0.05)))[[2]],expected = c("klave","krona"),
                  info="Fel: Funktionen returnerar en table med fel kolumnnamn.")
  expect_equal(suppressMessages(dimnames(coin_test(text=text1, alpha = 0.05)))[[1]],expected = c("Johan","Josef"),
                  info="Fel: Funktionen returnerar en table med fel radnamn.")

  expect_message(coin_test(text = text1, alpha = 0.05), "Testet fick p-värdet",
                  info="Fel: Fel i meddelandet.")
  expect_message(coin_test(text = text1, alpha = 0.05), "vi kan därför inte förkasta H0",
                  info="Fel: Fel i meddelandet.")
  expect_message(coin_test(text = text1, alpha = 0.05), "på nivån alpha = 0.05",
                  info="Fel: Fel i meddelandet.")
  
  expect_equal(suppressMessages(length(coin_test(text=text1, alpha = 0.05))), 4,
                  info = "Fel: Korstabellen har fel antal celler.")
  
  expect_equal(as.vector(suppressMessages(coin_test(text=text1, alpha = 0.05))), c(6,4,4,6),
                  info = "Fel: Korstabellen har fel värden.")
  

  expect_equal(suppressMessages(dimnames(coin_test(text=text2, alpha = 0.05)))[[2]],expected = c("klave","krona"),
                  info="Fel: Funktionen returnerar en table med fel kolumnnamn.")
  expect_equal(suppressMessages(dimnames(coin_test(text=text2, alpha = 0.05)))[[1]],expected = c("Adam","Bertil"),
                  info="Fel: Funktionen returnerar en table med fel radnamn.")

  expect_message(coin_test(text = text2, alpha = 0.05), "Testet fick p-värdet",
                  info="Fel: Fel i meddelandet.")
  expect_message(coin_test(text = text2, alpha = 0.05), "vi kan därför förkasta H0",
                  info="Fel: Fel i meddelandet.")
  expect_message(coin_test(text = text2, alpha = 0.05), "på nivån alpha = 0.05",
                  info="Fel: Fel i meddelandet.")
  expect_message(coin_test(text = text2, alpha = 0.01), "vi kan därför inte förkasta H0",
                  info="Fel: Fel i meddelandet.")
  expect_message(coin_test(text = text2, alpha = 0.01), "på nivån alpha = 0.01",
                  info="Fel: Fel i meddelandet.")
  
  expect_equal(suppressMessages(length(coin_test(text=text2, alpha = 0.05))), 4,
                  info = "Fel: Korstabellen har fel antal celler.")
  
  expect_equal(as.vector(suppressMessages(coin_test(text=text2, alpha = 0.05))), c(9,14,13,4),
                  info = "Fel: Korstabellen har fel värden.")
})
