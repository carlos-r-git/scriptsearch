#' showlines
#'
#' Open and list lines containing searchterms from the nth file in the output of scriptsearch().
#'
#' @param data The data frame output from scriptsearch().
#' @param n The index of the file to be searched.
#' @param open Logical option for opening the selected file.
#'
#' @return Table with the line number and first 50 characters of each line that contains searchterms.
#' @export
#'
#' @examples
#'
#' data <- scriptsearch(".", "text")
#' showlines(data, 1, open = TRUE)

showlines <- function(data, n, open = TRUE) {

  if (length(data) == 1 ){

    if (data == "No files containing search terms found."){

      return (data)

    }

    if (data == "No files found in directory."){

      return (data)

    }

  }

  coll <- checkmate::makeAssertCollection()
  checkmate::assertDataFrame(data, ncols = 3)
  checkmate::assertNumber(n, lower = 1, upper = length(data$Path))
  checkmate::assertLogical(open)
  checkmate::reportAssertions(coll)

  if (data[n,2,1] == 0) {

    cat("No hits found.
")
    return(data)

  } else {

    searchterms <- data[n,3,1][[1]]

    tempdata <- readLines(data[n,1,1], warn = FALSE)

    temppos <- findlines(tempdata = tempdata, searchterms = searchterms)

    temphits <- data.frame("Line" = 1:length(temppos), "Text" = 0)

    for (i in 1:length(temppos)) {

      temphits[i,1] <- temppos[i]
      temphits[i,2] <- shortenstring(tempdata[temppos[i]])

    }

  }

  if (open == TRUE) {

    usethis::edit_file(data[n,1,1])

  }

  return(temphits)

}
