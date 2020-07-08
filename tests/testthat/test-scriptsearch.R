test_that("finds files", {

  data1 <- data.frame("Path" = c(paste(system.file("extdata/test1.txt", package = "scriptsearch")), paste(system.file("extdata/test2.txt", package = "scriptsearch"))),
                     "Hits" = c("TRUE", "TRUE"),
                     "Searchterms" = c("x", "x"),
                     stringsAsFactors = FALSE)

  data2 <- data.frame("Path" = paste(system.file("extdata/test1.txt", package = "scriptsearch")),
                     "Hits" = "TRUE",
                     "Searchterms" = "z",
                     stringsAsFactors = FALSE)

  expect_equal(scriptsearch(system.file("extdata", package = "scriptsearch"), "x", filetypes = "\\.txt$"), data1)
  expect_equal(scriptsearch(system.file("extdata", package = "scriptsearch"), "z", filetypes = "\\.txt$"), data2)

})
