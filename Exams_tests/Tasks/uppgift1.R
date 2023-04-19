
context("customer_handling()")

test_that("customer_handling()", {  
  
  #body_contain<-function(object,expected) {any(grepl(x = as.character(body(object)), pattern = expected))}
  #package_loaded<-function(object){any(grepl(object, search()))}
  
  
  expect_true(exists("customer_handling"),
              info = "Fel: customer_handling() saknas.")
  expect_true(is.function(customer_handling),
              info = "Fel: customer_handling är inte en funktion.")
  expect_function_self_contained(object = customer_handling,
                                 "Fel: Funktionen innehåller fria variabler")
  
  expect_function_arguments(object = customer_handling,expected = c("dataset"),
                            info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  
  # testar argumenten:
  expect_error(object = customer_handling(list(x1=1,x2="new",x3=10)),
               info="Fel: funktionen avbryter inte när dataset inte är en data.frame")
  
  expect_error(object = customer_handling(letters[1:5]),
               info="Fel: funktionen avbryter inte när dataset inte är en data.frame")
  
  expect_error(object = customer_handling(list(1,2,"hej")),
               info="Fel: funktionen avbryter inte när dataset inte är en data.frame")
  
  expect_error(object = customer_handling(matrix(2,2,2)),
               info="Fel: funktionen avbryter inte när dataset inte är en data.frame")
  
  # kolla typ output:
  mark_df0<-data.frame(x1=c(1.5,3.9),x2=c("new","old"),x3=c(13,8))
  expect_true(is.vector(customer_handling(dataset = mark_df0)),
              info="Fel: Funktionen returnerar inte en vektor")
  expect_true(is.character(customer_handling(dataset = mark_df0)),
              info="Fel: Funktionen returnerar inte en textvektor")

  expect_equal(length(customer_handling(dataset = mark_df0)),2,
               info="Inte rätt längd på vektorn som returneras när dataset har två rader")
  
  expect_equal(length(customer_handling(dataset = mark_df0[1,])),1,
               info="Inte rätt längd på vektorn som returneras när dataset har en rad")
  
  mark_df1<-data.frame(x1=1.5,x2="new",x3=13) 
  x1<-c(4,10,14,2,1) 
  x2<-c("new","old","old","new","old") 
  x3<-c(10,7,20,4,12) 
  mark_df2<-data.frame(x1=x1,x2=x2,x3=x3) 
  expect_equal(length(customer_handling(dataset = mark_df2)),5,
               info="Inte rätt längd på vektorn som returneras när dataset har fem rader")
  
  
  #-----------------------------------------------------------------------------
  # testar rätt värden på output
  #-----------------------------------------------------------------------------
  # --- test 1 --- 
  expect_equal(customer_handling(mark_df1), "B",
               info="Fel: Funktionen ger inte rätt värde på output vid customer_handling(dataset=test_df1)")
  
  # --- test 2 --- 
  expect_equal(customer_handling(mark_df2), c( "B", "A", "C", "A", "B"),
               info="Fel: Funktionen ger inte rätt värde på output vid customer_handling(dataset=test_df2)")
  
  # --- test 3 --- 
  x1<-c(2.1,3,3,3,0.3) 
  x2<-c("new","new","old","old","old") 
  x3<-c(17.7,-6,15,15.5,5) 
  mark_df3<-data.frame(x1=x1,x2=x2,x3=x3) 
  expect_equal(customer_handling(mark_df3), c( "B", "B", "A", "C", "A"),
               info="Fel: Funktionen ger inte rätt värde på output vid customer_handling(dataset=test_df3)")
  
  # --- test 4 --- 
  no_obs<-30 
  set.seed(13) 
  x1<-round(runif(n = no_obs,min = 2,max = 10),1) 
  x2<-sample(x = c("new","old","old"),size = no_obs,replace = TRUE) 
  x3<-round(runif(n = no_obs,min = 5,max = 18),1) 
  mark_df4<-data.frame(x1=x1,x2=x2,x3=x3) 
  expect_equal(customer_handling(mark_df4), 
               c("B", "B", "A", "A", "A", "A", "B", "C", "A", "B", "B", "A", "A",
                 "A", "B", "A", "A", "A", "C", "A", "B", "C", "A", "C", "A", "C",
                 "A", "A", "B", "C"),
               info="Fel: Funktionen ger inte rätt värde på output vid customer_handling(dataset=test_df4)")
})
