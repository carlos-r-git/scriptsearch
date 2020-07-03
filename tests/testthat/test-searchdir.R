test_that("filters files from string", {
  expect_equal(searchdir(system.file("extdata", package = "scriptsearch"), "test"), c("test1.txt", "test2.txt"))
  expect_equal(searchdir(system.file("extdata", package = "scriptsearch"), "1"),"test1.txt")
  expect_equal(searchdir(system.file("extdata", package = "scriptsearch"), "3"), character(0))
})
