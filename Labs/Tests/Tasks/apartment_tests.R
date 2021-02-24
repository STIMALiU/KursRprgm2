
context("apartment()")

test_that("apartment()", {  

  #-----------------------------------------------------------------------------------
  # test for apartment()
  #-----------------------------------------------------------------------------------
  expect_true(exists("apartment"),
              info = "Fel: apartment() is missing")

  expect_true(exists("print.apartment"),
              info = "Fel: print.apartment() saknas")
  
  checkmate::expect_function(apartment, nargs = 2)
  expect_function_arguments(apartment, c("rooms", "m2"))
  
  test1<-apartment(1,29)
  
  expect_true(object = is.list(test1),
              info="apartment() returnerar inte ett objekt med liststruktur")
  
  expect_equal(object = length(test1),expected = 2,
               info="Listan har inte två element")
  
  expect_true(object = all(sapply(test1,FUN = function(x){is.numeric(x)|is.integer(x)})),
              info="Elementen i listan är inte numeriska")
  
  checkmate::expect_class(x = test1, classes = "apartment",
              info="Fel: Funktionen returnerar inte ett apartment-objekt.")
  
  expect_error(object = apartment(0,29),
               info="Fel: funktionen avbryter inte när antalet rum<0")
  expect_error(object = apartment(-3,29),
               info="Fel: funktionen avbryter inte när antalet rum<0")
  
  expect_error(object = apartment(3,0),
               info="Fel: funktionen avbryter inte när antalet kvadratmeter<0")
  expect_error(object = apartment(5,-10),
               info="Fel: funktionen avbryter inte när antalet kvadratmeter<0")
  
  expect_error(object = apartment(-5,-10),
               info="Fel: funktionen avbryter inte när antalet kvadratmeter och antalet rum är mindre än noll")
  
  #-----------------------------------------------------------------------------------
  # test for print.apartment()
  #-----------------------------------------------------------------------------------

  test2<-apartment(1,28)
  expect_output(print(test2), regexp = "studio",
                info="Fel: print-metoden för fallet apartment(1,28) fungerar inte") 
  expect_output(print(test2), regexp = "28",
                info="Fel: print-metoden för fallet apartment(1,28) fungerar inte") 
  
  test3<-apartment(1,45)
  expect_output(print.apartment(test3), regexp = "studio",
                info="Fel: print.apartment() fungerar inte för fallet apartment(1,45)") 
  expect_output(print.apartment(test3), regexp = "45",
                info="Fel: print.apartment() fungerar inte för fallet apartment(1,45)") 
  
  test4<-apartment(3,88)
  expect_output(print(test4), regexp = "apartment",
                info="Fel: print-metoden för fallet apartment(3,88) fungerar inte") 
  expect_output(print(test4), regexp = "88",
                info="Fel: print-metoden för fallet apartment(3,88) fungerar inte") 
  
  
  test5<-apartment(10,230)
  expect_output(print(test5), regexp = "apartment",
                info="Fel: print-metoden för fallet apartment(10,230)) fungerar inte") 
  expect_output(print(test5), regexp = "230",
                info="Fel: print-metoden för fallet apartment(10,230)) fungerar inte") 

})
