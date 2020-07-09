#' showlines
#'
#' List the lines containing searchterms from the file in the nth row of a data frame (output of scriptsearch).
#'
#' @param data The data frame output from scriptsearch().
#' @param n The row number of the file to be searched.
#'
#' @return Table with the line number and first 50 characters of each line that contains searchterms.
#' @export
#'
#' @examples
#' showlines(scriptsearch(".", "search"), 1)

showlines <- function(data, n) {

  if (length(data) == 1 ){

    if (data == "No files containing search terms found."){

      return (data)

    }

  }

  coll <- checkmate::makeAssertCollection()
  checkmate::assertDataFrame(data, ncols = 3)
  checkmate::assertNumber(n, lower = 1, upper = length(data$Path))
  checkmate::reportAssertions(coll)

  if (data[n,2,1] == 0) {

    cat("No hits found.
        ")
    return(data)

  } else {

    searchterms <- data[n,3,1]

    tempdata <- readLines(data[n,1,1], warn = FALSE)

    temppos <- findlines(tempdata = tempdata, searchterms = searchterms)

    temphits <- data.frame(1:length(temppos),2)
    colnames(temphits) <- c("Line", "Text")

    for (i in 1:length(temppos)) {

      temphits[i,1] <- temppos[i]
      temphits[i,2] <- shortenstring(tempdata[temppos[i]])

    }

  }

  return(temphits)

}
