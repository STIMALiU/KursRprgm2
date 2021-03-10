### Assignment : wordcount() ###

context("wordcount()")

test_that("Assignment: wordcount()", {
  
  # testfall:
  text1 <- "a b c aa bb cc a bb cc, a a bb. a cc cc a. b b. c d d a, d c cc d b b a a"
  text2 <-  c("The Couple",
              "They switch off the light and its white shade",
              "like a tablet in a glass of darkness. Then up.",
              "The hotel walls rise into the black sky.",
              "The movements of love have settled, and they sleep",         
              "but their most secret thoughts meet as when",                
              "two colours meet and flow into each other",                 
              "on the wet paper of a schoolboys painting.",       
              "It is dark and silent. But the town has pulled closer",
              "tonight. With quenched windows. The houses have approached.",
              "They stand close up in a throng, waiting,",
              "a crowd whose faces have no expressions.")

  expect_that(wordcount, is_a("function"),
              info = "Fel: wordcount är inte en funktion.")
  
  expect_true(all(names(formals(wordcount)) %in% c("text")),
              info = "Fel: Namnen på argumenten i funktionen är fel.")
#  expect_function_self_contained(object = wordcount,
#                        "Fel: Funktionen har fria variabler")
  expect_that(suppressMessages(wordcount(text=text1)), is_a("data.frame"),
              info = "Fel: Funktionen returnerar inte en data.frame")
  
  expect_named(suppressMessages(wordcount(text=text1)),expected = c("word","freq"),
                  info="Fel: Funktionen returnerar en data.frame med fel variabelnamn.")
#   expect_that(all(names(suppressMessages(wordcount(text=text1))) %in% c("freq", "word")), is_true(),
#               info = "Fel: Funktionen returnerar en data.frame med fel variabelnamn.")
  
  expect_is(suppressMessages(wordcount(text=text1))$word, "character",
              info = "Fel: Variabeln word ska vara en textvektor.")
  expect_is(suppressMessages(wordcount(text=text1))$freq, "integer",
            info = "Fel: Variabeln freq ska vara en integervektor.")
  
  expect_equal(suppressMessages(wordcount(text=text1))$word[3:5], c("b", "bb", "c"),
              info = "Fel: Funktionen returnerar inte rätt värden på kolumnen word när text=\"a b c aa bb cc a bb cc, a a bb. a cc cc a. b b. c d d a, d c cc d b b a a\"")
  
  expect_equal(suppressMessages(wordcount(text=text1))$freq[3:5], c(5, 3, 3),
               info = "Fel: Funktionen returnerar inte rätt värden på kolumnen freq när text=\"a b c aa bb cc a bb cc, a a bb. a cc cc a. b b. c d d a, d c cc d b b a a\"")
  
  expect_message(wordcount(text=text1), "The most common word is 'a' and it occured 9 times.",
                 info = "Fel: Funktionen returnerar fel meddelande.")

  expect_equal(suppressMessages(wordcount(text=text2))$word[3:5], c("approached", "as", "black"),
               info = "Fel: Funktionen returnerar inte rätt värden på kolumnen word i testet text<-readLines(\"transtrom.txt\"); wordcount(text=text)")
  
  expect_equal(suppressMessages(wordcount(text=text2))$freq[20:25], c(3, 1, 1, 2, 2, 1),
               info = "Fel: Funktionen returnerar inte rätt värden på kolumnen freq i testet text<-readLines(\"transtrom.txt\"); wordcount(text=text)")
  
  expect_message(wordcount(text=text2), "The most common word is 'the' and it occured 8 times.",
                 info = "Fel: Funktionen returnerar fel meddelande.")

})
