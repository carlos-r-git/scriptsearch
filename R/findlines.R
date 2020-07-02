#' findlines
#'
#' Returns indicies of items of a list that contain searchterms.
#'
#' @param tempdata Lines of text to be searched.
#' @param searchterms Strings to search for.
#'
#' @return A list of indicies.
#' @export
#'
#' @examples
#' findlines(c("text", "test"), "text")

findlines <- function(tempdata, searchterms) {

  temppos <- which(stringr::str_detect(tempdata, paste(searchterms, collapse = "|")))
  return(temppos)

}
