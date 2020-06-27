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

  files <- searchdir(dir = dir, filetypes = filetypes)

  data <- data.frame(1:length(files),0,0)
  colnames(data) <- c("Path", "Hits", "Search Terms")
  data[,3] <- searchterms

  for (i in 1:length(files)) {

    tempdata <- readLines(paste0(dir,"/",files[i]), warn = FALSE)

    temppos <- findlines(tempdata = tempdata, searchterms = searchterms)

    data[i,1] <- paste0(dir,"/",files[i])

    if (length(temppos) == 0) {

      data[i,2] <- "FALSE"

    } else {

      data[i,2] <- "TRUE"

    }

  }

  if (isTRUE(rm)) {

    data <- data[data$Hits == TRUE,]
    rownames(data) <- 1:length(data$Hits)

  }

  return(data)

}
