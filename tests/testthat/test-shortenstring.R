test_that("shortens the right strings", {
  expect_equal(shortenstring(strrep("1", 51)), paste0(strrep("1", 50), "..."))
  expect_equal(shortenstring("1"), "1")
})

