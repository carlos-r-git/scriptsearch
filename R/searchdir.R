searchdir <- function(dir, filetypes) {

  files <- list.files(dir, recursive = TRUE, include.dirs = TRUE)
  files <- files[stringr::str_detect(files, paste(filetypes, collapse = "|"))]
  return(files)

}
