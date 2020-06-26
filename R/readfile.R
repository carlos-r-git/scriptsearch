readfile <- function(file) {

  tempdata <- readLines(file, warn = FALSE)
  return(tempdata)

}
