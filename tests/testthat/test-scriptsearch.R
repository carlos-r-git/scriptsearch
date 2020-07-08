test_that("finds files", {
  data <- data.frame("Path" = c(paste(system.file("extdata/test1.txt", package = "scriptsearch")), paste(system.file("extdata/test2.txt", package = "scriptsearch"))),
                     "Hits" = c("TRUE", "TRUE"),
                     "Searchterms" = c("x", "x"))

  expect_equal(scriptsearch(system.file("extdata", package = "scriptsearch"), "x", filetypes = "\\.txt$"), data)
})
