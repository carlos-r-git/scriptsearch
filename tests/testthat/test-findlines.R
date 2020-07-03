test_that("finds lines", {
  expect_equal(findlines(c("x", "y"), "x"), 1)
  expect_equal(findlines(c("x", "y"), c("x", "y")), c(1, 2))
  expect_equal(findlines(c("x", "y"), "z"), integer(0))
})
