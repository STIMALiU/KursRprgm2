
context("classroom()")

test_that("classroom()", {  
  
  #-----------------------------------------------------------------------------------
  # test for classroom()
  #-----------------------------------------------------------------------------------
  expect_true(exists("classroom"),
              info = "Fel: classroom() is missing")
  
  expect_true(exists("print.classroom"),
              info = "Fel: print.classroom() saknas")
  
  checkmate::expect_function(classroom, nargs = 2)
  expect_function_arguments(classroom, c("seats", "whiteboards"))
  
  test1<-classroom(5,1)
  
  expect_true(object = is.list(test1),
              info="classroom() returnerar inte ett objekt med liststruktur")
  
  expect_equal(object = length(test1),expected = 2,
               info="Listan har inte två element")
  
  expect_true(object = all(sapply(test1,FUN = function(x){is.numeric(x)|is.integer(x)})),
              info="Elementen i listan är inte numeriska")
  
  checkmate::expect_class(x = test1, classes = "classroom",
                          info="Fel: Funktionen returnerar inte ett classroom-objekt.")
  
  expect_error(object = classroom(0,29),
               info="Fel: funktionen avbryter inte när antalet sittplatser<=0")
  expect_error(object = classroom(-3,29),
               info="Fel: funktionen avbryter inte när antalet sittplatser<=0")
  
  expect_error(object = classroom(5,-10),
               info="Fel: funktionen avbryter inte när antalet whiteboards<0")
  
  expect_error(object = classroom(-5,-10),
               info="Fel: funktionen avbryter inte när antalet sittplatser och antalet whiteboards är mindre än noll")
  
  #-----------------------------------------------------------------------------------
  # test for print.classroom()
  #-----------------------------------------------------------------------------------
  
  test2<-classroom(5,1)
  expect_output(print(test2), regexp = "group room",
                info="Fel: print-metoden för fallet classroom(5,1) fungerar inte") 
  expect_output(print(test2), regexp = "1",
                info="Fel: print-metoden för fallet classroom(5,1) fungerar inte") 
  expect_output(print(test2), regexp = "5",
                info="Fel: print-metoden för fallet classroom(5,1) fungerar inte") 
  
  test3<-classroom(5,0)
  expect_output(print.classroom(test3), regexp = "group room",
                info="Fel: print.classroom() fungerar inte för fallet classroom(5,0)") 
  expect_output(print.classroom(test3), regexp = "5",
                info="Fel: print.classroom() fungerar inte för fallet classroom(5,0)") 
  expect_output(print.classroom(test3), regexp = "no",
                info="Fel: print.classroom() fungerar inte för fallet classroom(5,0)") 
  
  test4<-classroom(25,4)
  expect_output(print(test4), regexp = "classroom",
                info="Fel: print-metoden för fallet classroom(25,4) fungerar inte") 
  expect_output(print(test4), regexp = "4",
                info="Fel: print-metoden för fallet classroom(25,4) fungerar inte") 
  expect_output(print(test4), regexp = "25",
                info="Fel: print-metoden för fallet classroom(25,4) fungerar inte") 
  
  
  test5<-classroom(160,12)
  expect_output(print(test5), regexp = "lecture hall",
                info="Fel: print-metoden för fallet classroom(160,12)) fungerar inte") 
  expect_output(print(test5), regexp = "160",
                info="Fel: print-metoden för fallet classroom(160,12)) fungerar inte") 
  expect_output(print(test5), regexp = "12",
                info="Fel: print-metoden för fallet classroom(160,12)) fungerar inte") 
  
})
