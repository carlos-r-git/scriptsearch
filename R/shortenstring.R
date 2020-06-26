shortenstring <- function(string) {

  if (nchar(string) > 50) {

    string <- paste0(substr(string,1,50), "...")

  }

  return(string)

}
