test_that("finds files", {

  data1 <- data.frame("Path" = c(paste(system.file("extdata/test1.txt", package = "scriptsearch")), paste(system.file("extdata/test2.txt", package = "scriptsearch"))),
                     "Hits" = c(1, 1),
                     "Searchterms" = c("x", "x"),
                     stringsAsFactors = FALSE)
  data1$Searchterms <- list(c("x"), c("x"))


  expect_equal(scriptsearch("x", system.file("extdata", package = "scriptsearch"), filetypes = "txt"), data1)
  expect_equal(scriptsearch("x", system.file("extdata", package = "scriptsearch"), filetypes = "csv"), "No files found in directory.")

})

test_that("removes negatives", {

  data1 <- data.frame("Path" = paste(system.file("extdata/test1.txt", package = "scriptsearch")),
                      "Hits" = 1,
                      "Searchterms" = "z",
                      stringsAsFactors = FALSE)
  data1$Searchterms <- list(c("z"))

  data2 <- data.frame("Path" = c(paste(system.file("extdata/test1.txt", package = "scriptsearch")), paste(system.file("extdata/test2.txt", package = "scriptsearch"))),
                      "Hits" = c(1, 0),
                      "Searchterms" = c("z", "z"),
                      stringsAsFactors = FALSE)
  data2$Searchterms <- list(c("z"), c("z"))

  expect_equal(scriptsearch("z", system.file("extdata", package = "scriptsearch"), rm = T, filetypes = "txt"), data1)
  expect_equal(scriptsearch("z", system.file("extdata", package = "scriptsearch"), rm = F, filetypes = "txt"), data2)

})

test_that("no hits in any files", {

  data1 <- data.frame("Path" = c(paste(system.file("extdata/test1.txt", package = "scriptsearch")), paste(system.file("extdata/test2.txt", package = "scriptsearch"))),
                      "Hits" = c(0, 0),
                      "Searchterms" = c("w", "w"),
                      stringsAsFactors = FALSE)
  data1$Searchterms <- list(c("w"), c("w"))

  expect_equal(scriptsearch("w", system.file("extdata", package = "scriptsearch"), rm = F, filetypes = "txt"), data1)
  expect_equal(scriptsearch("w", system.file("extdata", package = "scriptsearch"), filetypes = "txt"), "No files containing search terms found.")

})
