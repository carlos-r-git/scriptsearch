searchdir <- function(dir, filetypes) {

  files <- list.files(dir, recursive = TRUE, include.dirs = TRUE, pattern = paste(filetypes, collapse = "|"))
  return(files)

}
