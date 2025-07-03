
context("matrix_calc()")

test_that("matrix_calc()", {  
  
  #body_contain<-function(object,expected) {any(grepl(x = as.character(body(object)), pattern = expected))}
  #package_loaded<-function(object){any(grepl(object, search()))}
  
  
  expect_true(exists("matrix_calc"),
              info = "Fel: matrix_calc() saknas.")
  expect_true(is.function(matrix_calc),
              info = "Fel: matrix_calc är inte en funktion.")
  expect_function_self_contained(object = matrix_calc,
                                 "Fel: Funktionen innehåller fria variabler")
  
  expect_function_arguments(object = matrix_calc,expected = c("mat_list"),
                            info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  
  B1<-matrix(1:4,2,2)
  B2<-matrix(-5:3,3,3)
  B3<-matrix(c(1,0,2,0,3,2,0,1,3),3,3)
  B4<-matrix(c(1,2,3,4,0,0,0,4,5,6,7,0,0,-12,0,-16),4,4)
  B5<-matrix(3,1,1)
  B6<-matrix(1:8,8,1)
  B7<-matrix(1:2,1,6)
  B8<-matrix(5,2,3)
  B9<-matrix(1:4,4,2)
  
  # --- test av argument ---
  expect_error(object =   matrix_calc(mat_list = B1),
               info="Fel: funktionen avbryter inte när x inte är en lista")
  
  expect_error(object =   matrix_calc(mat_list = "ABC"),
               info="Fel: funktionen avbryter inte när x inte är en lista")
  
  expect_error(object =   matrix_calc(mat_list = "iris"),
               info="Fel: funktionen avbryter inte när x inte är en lista")
  
  # kolla typ output:
  expect_true(is.data.frame(matrix_calc(mat_list = list(B1))),
              info="Fel: Funktionen returnerar inte en data.frame")
  
  expect_true(is.data.frame(matrix_calc(mat_list = list(B2,B3,B1))),
              info="Fel: Funktionen returnerar inte en data.frame")
  
  expect_equal(nrow(matrix_calc(mat_list = list(B1))),1,
               info = "Fel: Inte rätt antal rader (ska vara 1) på output vid matrix_calc(mat_list = list(A1))")
  
  expect_equal(nrow(matrix_calc(mat_list = list(B2,B3,B1))),3,
               info = "Fel: Inte rätt antal rader (ska vara 3) på output vid matrix_calc(mat_list = list(A2,A3,A1))")
  
  
  expect_equal(ncol(matrix_calc(mat_list = list(B1))),2,
               info = "Fel: Inte rätt antal kolumner (ska vara 2) på output vid matrix_calc(mat_list = list(A1))")
  
  expect_equal(ncol(matrix_calc(mat_list = list(B2,B3,B1))),2,
               info = "Fel: Inte rätt antal kolumner (ska vara 2) på output vid matrix_calc(mat_list = list(A2,A3,A1))")
  
  expect_equal(colnames(matrix_calc(mat_list = list(B2,B3,B1))),c("det_val","diff" ),
               info = "Fel: Inte rätt kolumnnamn på output")
  expect_equal(colnames(matrix_calc(mat_list = list(B2))),c("det_val","diff" ),
               info = "Fel: Inte rätt kolumnnamn på output")
  
  # testar värden
  
  # --- test 1 --- 
  expect_equal(matrix_calc(mat_list = list(B1))$det_val, -2,tolerance = 1e-5,
               info="Fel: Funktionen ger inte rätt värde på kolumnen det_val vid matrix_calc(mat_list = list(A1))")
  expect_equal(matrix_calc(mat_list = list(B1))$diff, 3,tolerance = 1e-5,
               info="Fel: Funktionen ger inte rätt värde på kolumnen diff vid matrix_calc(mat_list = list(A1))")
  
  # --- test 2 ---
  expect_equal(matrix_calc(mat_list = list(B1,B2))$det_val, c(-2,0),tolerance = 1e-5,
               info="Fel: Funktionen ger inte rätt värde på kolumnen det_val vid matrix_calc(mat_list = list(A1,A2))")
  expect_equal(matrix_calc(mat_list = list(B1,B2))$diff,c(3,8),tolerance = 1e-5,
               info="Fel: Funktionen ger inte rätt värde på kolumnen diff vid matrix_calc(mat_list = list(A1,A2))")
  
  # --- test 3 ---
  expect_equal(matrix_calc(mat_list = list(B3,B2,B7))$det_val, c(7,0,NA),tolerance = 1e-5,
               info="Fel: Funktionen ger inte rätt värde på kolumnen det_val vid matrix_calc(mat_list = list(A3,A2,A7))")
  expect_equal(matrix_calc(mat_list = list(B3,B2,B7))$diff,c(3,8,1),tolerance = 1e-5,
               info="Fel: Funktionen ger inte rätt värde på kolumnen diff vid matrix_calc(mat_list = list(A3,A2,A7))")

  
  # --- test 4 ---
  expect_equal(matrix_calc(mat_list = list(B3,B2,B7,B8,B1,B6,B4,B5,B9))$det_val, c( 7,0,NA,NA,-2,NA,-384,3,NA),tolerance = 1e-5,
               info="Fel: Funktionen ger inte rätt värde på kolumnen det_val vid matrix_calc(mat_list = list(A3,A2,A7,A8,A1,A6,A4,A5,A9))")
  expect_equal(matrix_calc(mat_list = list(B3,B2,B7,B8,B1,B6,B4,B5,B9))$diff,c(3,8,1,0,3,7,23,0,3),tolerance = 1e-5,
               info="Fel: Funktionen ger inte rätt värde på kolumnen diff vid matrix_calc(mat_list = list(A3,A2,A7,A8,A1,A6,A4,A5,A9))")
  
  # --- test 5 ---
  expect_equal(matrix_calc(mat_list = list(matrix(trees[1:25,1],5,5),matrix(c(2,9.3,2,0.1),2,2),matrix(1:20,10,2)))$det_val, 
               c(-0.02535,-18.40000,NA),tolerance = 1e-5,
               info="Fel: Funktionen ger inte rätt värde på kolumnen det_val vid matrix_calc(mat_list = list(matrix(trees[1:25,1],5,5),matrix(c(2,9.3,2,0.1),2,2),matrix(1:20,10,2)))")
  expect_equal(matrix_calc(mat_list = list(matrix(trees[1:25,1],5,5),matrix(c(2,9.3,2,0.1),2,2),matrix(1:20,10,2)))$diff,
               c(8.0,9.2,19.0),tolerance = 1e-5,
               info="Fel: Funktionen ger inte rätt värde på kolumnen diff vid matrix_calc(mat_list = list(matrix(trees[1:25,1],5,5),matrix(c(2,9.3,2,0.1),2,2),matrix(1:20,10,2)))")
  
  #matrix_calc(mat_list = list(matrix(trees[1:25,1],5,5),matrix(c(2,9.3,2,0.1),2,2),matrix(1:20,10,2)))$det_val
  
})
