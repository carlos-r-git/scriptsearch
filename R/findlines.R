findlines <- function(tempdata, searchterms) {
  temppos <- which(stringr::str_detect(tempdata, paste(searchterms, collapse = "|")))
  return(temppos)
}
