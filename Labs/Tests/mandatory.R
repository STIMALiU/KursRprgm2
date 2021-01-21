### Assignment structure ###

context("Labbinformation")

test_that("Obligatoriska object", {
  expect_true(exists("Namn"), info = "Variabeln 'Namn' saknas.")
  expect_true(exists("LiuId"), info = "Variabeln 'LiuId' saknas.")
  expect_is(Namn, "character", info = "Variabeln 'Namn' ska vara en textvariabel.")
  expect_true(nchar(Namn) > 0, info = "Ange ditt Namn.")
  expect_true(length(Namn)==1, info = "Namn ska endast ha ett element")
  expect_true(length(LiuId)==1, info = "LiuId ska endast ha ett element")
  expect_is(LiuId, "character", info = "Variabeln 'LiuId' ska vara en textvariabel.")
  expect_true(nchar(LiuId) > 0, info = "Ange ditt LiuId.")
  expect_true(nchar(LiuId) ==8 , info = "LiuId ska bestå av åtta tecken.")
  expect_true(all(strsplit(substr(LiuId,start = 1,stop = 5),split = "")[[1]]%in%letters) , 
              info = "De fem första tecknen i LiuId ska vara små bokstäver.")
  expect_true(all(strsplit(substr(LiuId,start = 6,stop = 8),split = "")[[1]]%in%0:9) , 
              info = "De tre sista tecknen i LiuId ska vara siffor.")
})

