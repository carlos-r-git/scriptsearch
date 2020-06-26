readfile <- function(dir, files, i) {

  tempdata <- readLines(paste0(dir,"/",files[i]))
  return(tempdata)

}
