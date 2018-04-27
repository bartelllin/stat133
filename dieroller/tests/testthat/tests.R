# Title: test
# Description: tests functions in rolldie.R
# Input(s): rolldie.R
# Output(s): none
# Author(s): Bartell Lin


test_that("die works as expected", {
  fair <- die()
  roll_die <- roll(fair, 10)
  expect_equal(names(roll_die), c("rolls", "sides", "prob", "total"))
  expect_length(roll_die$rolls, 10)
  expect_equal(roll_die$sides, c(1,2,3,4,5,6))
  expect_equal(roll_die$total, 10)
})

test_that("error works as expected", {
  expect_error(die(c(1)), "len must be 6")
  expect_error(die(prob = c(.075, .1, .125, .15, .2, .45)), "prob must add up to one")
  expect_error(roll(fair, -2), "invalid time")
})
