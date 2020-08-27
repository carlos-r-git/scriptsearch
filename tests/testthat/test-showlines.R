test_that("shows lines", {

  data1 <- data.frame("Line" = c(1, 2),
                      "Text" = c("x", "y"),
                      stringsAsFactors = FALSE)

  expect_equal(showlines(scriptsearch(c("x", "y"), system.file("extdata", package = "scriptsearch"), filetypes = "txt"), 1, open = FALSE), data1)

})
