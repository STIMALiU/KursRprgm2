

context("client_id")

test_that("Obligatoriska object", {
  expect_true(exists("client_id"), info = "Variabeln 'client_id' saknas.")
  expect_is(client_id, "character", info = "Variabeln 'client_id' ska vara en textvariabel.")
  expect_true(nchar(client_id) > 4, info = "Variablen client_id har för få tecken")
  expect_true(length(client_id)==1, info = "client_id ska endast ha ett element")
  expect_true(grepl(pattern = "SC",x = substr(client_id,start = 1,stop = 2)), 
              info = "De två första tecken ska vara 'SC' i client_id")
  expect_true(grepl(pattern = "[0-9]+",x = substr(client_id,start = 3,stop = nchar(client_id))) , 
              info = "client_id ska ha siffror efter 'SC'")
})





