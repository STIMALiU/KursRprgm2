
context("hilbert_matrix()")

test_that("hilbert_matrix()", {  
  
  body_contain<-function(object,expected) {any(grepl(x = as.character(body(object)), pattern = expected))}
  package_loaded<-function(object){any(grepl(object, search()))}
  
  
  expect_true(exists("hilbert_matrix"),
              info = "Fel: hilbert_matrix() saknas.")
  expect_true(is.function(hilbert_matrix),
              info = "Fel: hilbert_matrix är inte en funktion.")
  expect_function_self_contained(object = hilbert_matrix,
                        "Fel: Funktionen innehåller fria variabler")
  
  expect_function_arguments(object = hilbert_matrix,expected = c("nrow", "ncol"),
                            info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  
  
  expect_true(is.matrix(hilbert_matrix(1,1)),
              info="Fel: Funktionen returnerar inte en matrix")
  
  expect_equal(dim(hilbert_matrix(nrow=2, ncol=2)), c(2,2),
               info="Fel: Funktionen returnerar en matrix med fel dimension")
  
  expect_equal(dim(hilbert_matrix(nrow=5, ncol=1)), c(5,1),
               info="Fel: Funktionen returnerar en matrix med fel dimension")
  
  expect_equal(round(as.vector(hilbert_matrix(nrow=2, ncol=2)), 3), c(1.000,0.500,0.500,0.333),
               info="Fel: Funktionen returnerar en felaktig matris med hilbert_matrix(nrow=2, ncol=2)")
  
  expect_equal(round(as.vector(hilbert_matrix(nrow=10, ncol=10)), 3)[13:14], c(0.25, 0.20),
               info="Fel: Funktionen returnerar en felaktig matris med hilbert_matrix(nrow=10, ncol=10)")
  
  test_mat<-matrix(c(1,1/2,1/3,1/2,1/3,1/4),3,2)
  expect_equal(round(hilbert_matrix(nrow=3, ncol=2),5), round(test_mat,5),
               info="Fel: Funktionen returnerar en felaktig matris med hilbert_matrix(nrow=3, ncol=2)")
  
  expect_function_code(object = hilbert_matrix, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")
  
  
  expect_false(body_contain(object = hilbert_matrix,expected = "Hilbert\\s*\\(.*\\)$"),
               info = "Fel: Funktionen Hilbert() används i funktionen.")

  expect_false(body_contain(object = hilbert_matrix,expected = "hilbert.matrix\\s*\\(.*\\)$"),
               info = "Fel: Funktionen hilbert.matrix() används i funktionen.")

  expect_false(body_contain(object = hilbert_matrix,expected = "hilb\\s*\\(.*\\)$"),
               info = "Fel: Funktionen hilb() används i funktionen.")

  expect_false(body_contain(object = hilbert_matrix,expected = "Matrix"),
               info = "Fel: Funktioner ur paketet Matrix används i funktionen.")

  expect_false(body_contain(object = hilbert_matrix,expected = "matrixcalc"),
               info = "Fel: Funktioner ur paketet matrixcalc används i funktionen.")

  expect_false(body_contain(object = hilbert_matrix,expected = "pracma"),
               info = "Fel: Funktioner ur paketet pracma används i funktionen.")

  expect_false(body_contain(object = hilbert_matrix,expected = "pbdDMAT"),
               info = "Fel: Funktioner ur paketet pbdDMAT används i funktionen.")

  expect_false(body_contain(object = hilbert_matrix,expected = "hilbert\\s*\\(.*\\)$"),
               info = "Fel: Funktionen/namnet/texten hilbert får inte används i funktionen.")

  # lägg in test för Hilbert (Matrix)hilbert.matrix (matrixcalc), hilb (pracma), Hilbert (pbdDMAT)
  
  # lägg till test för return()!
  
  expect_silent(object = hilbert_matrix(2,2))
})