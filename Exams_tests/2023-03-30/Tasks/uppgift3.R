
context("id_detect()")

test_that("id_detect()", {  
  
  #body_contain<-function(object,expected) {any(grepl(x = as.character(body(object)), pattern = expected))}
  #package_loaded<-function(object){any(grepl(object, search()))}
  
  
  expect_true(exists("id_detect"),
              info = "Fel: id_detect() saknas.")
  expect_true(is.function(id_detect),
              info = "Fel: id_detect är inte en funktion.")
  expect_function_self_contained(object = id_detect,
                                 "Fel: Funktionen innehåller fria variabler")
  
  expect_function_arguments(object = id_detect,expected = c("x"),
                            info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  
  
  # testar struktur på output:
  expect_true(is.vector(id_detect(c("abc-123"," xyz-555"))),
              info="Fel: Funktionen returnerar inte en vektor")
  
  expect_true(is.vector(id_detect(c("abc-123"))),
              info="Fel: Funktionen returnerar inte en vektor")
  
  expect_true(is.vector(id_detect(c("abc-988","sadk-123","abc-123"," xyz-555"))),
              info="Fel: Funktionen returnerar inte en vektor")
  
  
  expect_true(is.character(id_detect(c("abc-123"))),
              info="Fel: Funktionen returnerar inte en textvektor")
  expect_true(is.vector(id_detect(c("abc-988","sadk-123","abc-123"," xyz-555"))),
              info="Fel: Funktionen returnerar inte en textvektor")
  
  
  expect_equal(length(id_detect(c("abc-123"))),1,
              info="Fel: Funktionen returnerar inte en vektor med rätt antal element, ska vara 1")
  
  expect_equal(length(id_detect(c("abc-988","sadk-123","abc-123"," xyz-555"))),4,
               info="Fel: Funktionen returnerar inte en vektor med rätt antal element, ska vara 4")
  
  
  # testar värden på output:
  # --- test 1 --- 
  expect_equal(id_detect(c("abc-123"," xyz-555","agq-345 ","abcd-123","abc-1234","abc--123")),
               c("abc-123","xyz-555","agq-345","No ID","No ID","No ID"),
               info="Fel: Funktionen returnerar inte en textvektor med rätt textvärden vid
               id_detect(c('abc-123',' xyz-555','agq-345 ','abcd-123','abc-1234','abc--123')")
  
  # --- test 2 --- 
  expect_equal(id_detect(c("abse abc-123","hejabc-123hej","abc abc-123 abc","abc abc-123 abc","abcabc-123 abc","abc.123")),
               c("abc-123", "No ID", "abc-123", "abc-123", "No ID", "No ID" ),
               info="Fel: Funktionen returnerar inte en textvektor med rätt textvärden vid 
               id_detect(c('abse abc-123','hejabc-123hej','abc abc-123 abc','abc abc-123 abc','abcabc-123 abc','abc.123'))")
  
  # --- test 3 --- 
  expect_equal(id_detect(c("abse abc-126","hejabc-123hej","abc abcg-123 abc","abc abc-1231 abc")),
               c("No ID", "No ID", "No ID", "No ID" ),
               info="Fel: Funktionen returnerar inte en textvektor med rätt textvärden vid
               id_detect(c('abse abc-126','hejabc-123hej','abc abcg-123 abc','abc abc-1231 abc'))")
  
  # --- test 4 --- 
  expect_equal(id_detect(x=c("aBc-122","abt-103")),
               c("No ID","abt-103"),
               info="Fel: Funktionen returnerar inte en textvektor med rätt textvärden vid
               id_detect( c('No ID','abt-103'))")
  
  
  # --- test 5 --- 
  expect_equal(id_detect(x=c("lyc-242","-abt-103","123-gju+")),
               c("lyc-242", "No ID",   "No ID"  ),
               info="Fel: Funktionen returnerar inte en textvektor med rätt textvärden vid
               id_detect( c('lyc-242','-abt-103','123-gju+'))")
  

  
  
  
})
