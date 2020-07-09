test_that("finds files", {

  data1 <- data.frame("Path" = c(paste(system.file("extdata/test1.txt", package = "scriptsearch")), paste(system.file("extdata/test2.txt", package = "scriptsearch"))),
                     "Hits" = c(1, 1),
                     "Searchterms" = c("x", "x"),
                     stringsAsFactors = FALSE)

  expect_equal(scriptsearch(system.file("extdata", package = "scriptsearch"), "x", filetypes = "\\.txt$"), data1)

})

test_that("removes negatives", {

  data2 <- data.frame("Path" = paste(system.file("extdata/test1.txt", package = "scriptsearch")),
                      "Hits" = 1,
                      "Searchterms" = "z",
                      stringsAsFactors = FALSE)

  data3 <- data.frame("Path" = c(paste(system.file("extdata/test1.txt", package = "scriptsearch")), paste(system.file("extdata/test2.txt", package = "scriptsearch"))),
                      "Hits" = c(1, 0),
                      "Searchterms" = c("z", "z"),
                      stringsAsFactors = FALSE)

  expect_equal(scriptsearch(system.file("extdata", package = "scriptsearch"), "z", rm = T, filetypes = "\\.txt$"), data2)
  expect_equal(scriptsearch(system.file("extdata", package = "scriptsearch"), "z", rm = F, filetypes = "\\.txt$"), data3)

})

test_that("no hits in any files", {

  data4 <- data.frame("Path" = c(paste(system.file("extdata/test1.txt", package = "scriptsearch")), paste(system.file("extdata/test2.txt", package = "scriptsearch"))),
                      "Hits" = c(0, 0),
                      "Searchterms" = c("w", "w"),
                      stringsAsFactors = FALSE)

  expect_equal(scriptsearch(system.file("extdata", package = "scriptsearch"), "w", rm = F, filetypes = "\\.txt$"), data4)
  expect_equal(scriptsearch(system.file("extdata", package = "scriptsearch"), "w", filetypes = "\\.txt$"), "No files containing search terms found.")

})
