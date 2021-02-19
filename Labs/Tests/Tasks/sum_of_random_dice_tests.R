### Assignment : sum_of_random_dice() ###

context("sum_of_random_dice()")

test_that("Assignment: sum_of_random_dice()", {
  
  expect_true(exists("sum_of_random_dice"))
  checkmate::expect_function(sum_of_random_dice, nargs = 3,
                             info = "Fel: babylon är inte en funktion.")
  expect_function_arguments(sum_of_random_dice, c("K","lambda","my_seed"))
  
  expect_silent(res <- sum_of_random_dice(K=10,lambda=2,my_seed=4711))
  checkmate::expect_class(sum_of_random_dice(K=10, lambda=2, my_seed=4711), "data.frame")

  checkmate::assert_names(names(sum_of_random_dice(K=2, lambda=2, my_seed=4711)), permutation.of = c("value", "dice"))
  expect_equal(nrow(sum_of_random_dice(K=3, lambda=2, my_seed=4711)), 3)
  expect_equal(nrow(sum_of_random_dice(K=15,lambda=6,my_seed=4711)), 15)

  expect_silent(res <- sum_of_random_dice(K=3000, lambda=6))
  res_mean_value_K3000_lambda6 <- round(mean(res[,1]),2)
  res_sd_value_K3000_lambda6 <- round(sd(res[,1]),2)
  res_mean_dice_K3000_lambda6 <- round(mean(res[,2]),2)
  res_sd_dice_K3000_lambda6 <- round(sd(res[,2]),2)
  
  expect_gt(object = res_mean_value_K3000_lambda6, 20.25, label = "mean(value) of sum_of_random_dice(K=3000, lambda=6)")
  expect_lt(object = res_mean_value_K3000_lambda6, 21.75, label = "mean(value) of sum_of_random_dice(K=3000, lambda=6)")
  expect_gt(object = res_sd_value_K3000_lambda6, 8.95, label = "sd(value) of sum_of_random_dice(K=3000, lambda=6)")
  expect_lt(object = res_sd_value_K3000_lambda6, 10.05, label = "sd(value) of sum_of_random_dice(K=3000, lambda=6)") #
  
  expect_gt(object = res_mean_dice_K3000_lambda6, 5.85, label = "mean(dice) of sum_of_random_dice(K=3000, lambda=6)")
  expect_lt(object = res_mean_dice_K3000_lambda6, 6.15, label = "mean(dice) of sum_of_random_dice(K=3000, lambda=6)")
  expect_gt(object = res_sd_dice_K3000_lambda6, 2.3, label = "sd(dice) of sum_of_random_dice(K=3000, lambda=6)")
  expect_lt(object = res_sd_dice_K3000_lambda6, 2.6, label = "sd(dice) of sum_of_random_dice(K=3000, lambda=6)")
})
