#' scriptsearch
#'
#' Returns the number of times a searchterm appears in each file in a path (defaults to working directory).
#'
#' @param searchterms String/ list of strings to search for.
#' @param dir Path to the directory.
#' @param rm Logical option for removing files with no hits from the output.
#' @param filetypes String/list of strings to be recognised in file endings.
#'
#' @return Data frame containing the file paths, number of hits and search terms found in a directory.
#' @export
#'
#' @examples
#' scriptsearch("text")
#'
#' scriptsearch("text", filetypes = "workshop")
#'
#' data <- scriptsearch("text", rm = FALSE)

scriptsearch <- function(searchterms, dir = ".", rm = TRUE, filetypes = c("R", "Rmd")) {

  coll <- checkmate::makeAssertCollection()
  checkmate::assertCharacter(searchterms)
  checkmate::assertDirectoryExists(dir)
  checkmate::assertLogical(rm)
  checkmate::assertCharacter(filetypes)
  checkmate::reportAssertions(coll)

  for (i in 1:length(filetypes)) {

    filetypes[i] <- paste0("\\.", filetypes[i], "$")

  }

  files <- searchdir(dir = dir, filetypes = filetypes)

  if (length(files) == 0){

    return("No files found in directory.")

  }

  data <- data.frame("Path" = 1:length(files), "Hits" = 0, "Searchterms" = 0)

  for (j in 1:length(files)) {

    tempdata <- readLines(paste0(dir,"/",files[j]), warn = FALSE)

    temppos <- findlines(tempdata = tempdata, searchterms = searchterms)

    data[j,1] <- paste0(paste0(dir,"/",files[j]))

    data[j,2] <- length(temppos)

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
