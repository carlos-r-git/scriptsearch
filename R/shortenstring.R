#' shortenstring
#'
#' Shortens a string if it is longer than 50 characters.
#'
#' @param string The string to be shortened.
#'
#' @return The shortened string.
#' @export
#'
#' @examples
#' shortenstring("text")

shortenstring <- function(string) {

  if (nchar(string) > 50) {

    string <- paste0(substr(string,1,50), "...")

  }

  return(string)

}
