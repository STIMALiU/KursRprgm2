### Assignment : my_grouped_test() ###

context("my_grouped_test()")

test_that("Assignment: my_grouped_test()", {
      
  # General tests
  expect_true(exists("my_grouped_test"))
  
  checkmate::expect_function(my_grouped_test, nargs = 3)

  expect_function_arguments(my_grouped_test, c("data_vector","my_groups","alpha"))
  
  data(chickwts)
  chickwts_results <- my_grouped_test(chickwts[,1], chickwts[,2], 0.05)
  checkmate::expect_class(chickwts_results, "matrix",
               info = "chickwts_results <- my_grouped_test(chickwts[,1], chickwts[,2], 0.05)")
  
  checkmate::expect_names(colnames(chickwts_results), permutation.of = c("Lower CI-limit", "Mean", "Upper CI-limit", "No of obs."),
               info = "chickwts_results <- my_grouped_test(chickwts[,1], chickwts[,2], 0.05)")
  
  checkmate::expect_names(rownames(chickwts_results), permutation.of = c("casein", "horsebean", "linseed", "meatmeal", "soybean", "sunflower"),
               info = "chickwts_results <- my_grouped_test(chickwts[,1], chickwts[,2], 0.05)")

  expect_equal(dim(chickwts_results), c(6,4),
            info = "chickwts_results <- my_grouped_test(chickwts[,1], chickwts[,2], 0.05)")
  expect_equal(chickwts_results["soybean", "Mean"], 246.43, tolerance = 0.01, info = "chickwts_results <- my_grouped_test(chickwts[,1], chickwts[,2], 0.05)") 
  expect_equal(chickwts_results["meatmeal", "Upper CI-limit"], 320.51, tolerance = 0.01, info = "chickwts_results <- my_grouped_test(chickwts[,1], chickwts[,2], 0.05)") 
  expect_equal(chickwts_results["meatmeal", "No of obs."], 11, tolerance = 0.01, info = "chickwts_results <- my_grouped_test(chickwts[,1], chickwts[,2], 0.05)") 

  data(InsectSprays)
  insect_results <- my_grouped_test(InsectSprays$count, InsectSprays$spray, 0.1)
  checkmate::expect_class(insect_results, "matrix",
               info = "insect_results <- my_grouped_test(InsectSprays$count, InsectSprays$spray, 0.1)")
  
  checkmate::expect_names(colnames(insect_results), permutation.of = c("Lower CI-limit", "Mean", "Upper CI-limit", "No of obs."),
               info = "insect_results <- my_grouped_test(InsectSprays$count, InsectSprays$spray, 0.1)")
  
  checkmate::expect_names(rownames(insect_results), permutation.of = c("A", "B", "C", "D", "E", "F"),
               info = "insect_results <- my_grouped_test(InsectSprays$count, InsectSprays$spray, 0.1)")
  
  expect_equal(dim(insect_results), c(6,4),
               info = "insect_results <- my_grouped_test(InsectSprays$count, InsectSprays$spray, 0.1)")
  expect_equal(unname(insect_results[c("A", "B", "C", "D", "E", "F"), "Mean"]), c(14.5, 15.333, 2.083,  4.916,  3.5, 16.666), tolerance = 0.01, info = "insect_results <- my_grouped_test(InsectSprays$count, InsectSprays$spray, 0.1)") 
  expect_equal(insect_results["F", "Upper CI-limit"], 19.89, tolerance = 0.01, info = "insect_results <- my_grouped_test(InsectSprays$count, InsectSprays$spray, 0.1)") 
  expect_equal(insect_results["D", "No of obs."], 12, tolerance = 0.01, info = "insect_results <- my_grouped_test(InsectSprays$count, InsectSprays$spray, 0.1)") 

})

