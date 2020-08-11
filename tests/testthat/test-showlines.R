test_that("shows lines", {

  data1 <- data.frame("Line" = c(1, 2),
                      "Text" = c("x", "y"),
                      stringsAsFactors = FALSE)

  expect_equal(showlines(scriptsearch(system.file("extdata", package = "scriptsearch"), c("x", "y"), filetypes = "\\.txt$"), 1, open = FALSE), data1)

})
