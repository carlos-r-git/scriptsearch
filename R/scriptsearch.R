#' scriptsearch
#'
#' Create a table listing files in a directory that contain specified strings.
#'
#' @param dir Path of the directory.
#' @param searchterms Strings to search for.
#' @param rm TRUE/FALSE for removing files with no hits from the output.
#' @param filetypes Strings to be recognised in file names.
#'
#' @return Data frame containing: file paths, TRUE/FALSE if text detected and search terms.
#' @export
#'
#' @examples
#' scriptsearch(".", "x")

scriptsearch <- function(dir, searchterms, rm = TRUE, filetypes = c("\\.R$", "\\.Rmd$")) {

  coll <- checkmate::makeAssertCollection()
  checkmate::assertDirectoryExists(dir)
  checkmate::assertCharacter(searchterms)
  checkmate::assertLogical(rm)
  checkmate::assertCharacter(filetypes)
  checkmate::reportAssertions(coll)

  files <- searchdir(dir = dir, filetypes = filetypes)

  if (length(files) == 0){

    return("No files found in directory.")

  }

  data <- data.frame(1:length(files),0,0)
  colnames(data) <- c("Path", "Hits", "Searchterms")

  for (i in 1:length(files)) {

    tempdata <- readLines(paste0(dir,"/",files[i]), warn = FALSE)

    temppos <- findlines(tempdata = tempdata, searchterms = searchterms)

    data[i,1] <- paste0(dir,"/",files[i])

    data[i,2] <- length(temppos)

  }

  command <- paste0("data$Searchterms <- ", "list(", strrep("searchterms, ", (length(files) - 1)), "searchterms)")
  eval(parse(text = command))

  if (isTRUE(rm)) {

    if (length(which(data$Hits >= 1)) == 0) {

      return("No files containing search terms found.")

    }

    data <- data[data$Hits >= 1,]
    rownames(data) <- 1:length(data$Hits)

  }

  return(data)

}
