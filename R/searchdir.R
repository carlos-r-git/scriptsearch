#' searchdir
#'
#' Lists files in a directory.
#'
#' @param dir Path of the directory.
#' @param filetypes Strings to be recognised in file names.
#'
#' @return List of files.
#' @export
#'
#' @examples
#' searchdir(".", "\\.R$")

searchdir <- function(dir, filetypes) {

  files <- list.files(dir, recursive = TRUE, include.dirs = TRUE, pattern = paste(filetypes, collapse = "|"))
  return(files)

}
