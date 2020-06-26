showlines <- function(dir, searchterms, filetypes = c(".R", ".rmd"), file) {

  files <- searchdir(dir = dir, filetypes = filetypes)

  data <- scriptsearch(dir = dir, searchterms = searchterms, filetypes = filetypes)

  if (data[file,2] == FALSE) {

    cat("No hits found.")
    return(data)

  } else {

    tempdata <- readfile(dir = dir, files = files, i = file)

    temppos <- findlines(tempdata = tempdata, searchterms = searchterms)

    temphits <- data.frame(1:length(temppos),2)
    colnames(temphits) <- c("Line", "Text")

    for (i in 1:length(temppos)) {

      temphits[i,1] <- temppos[i]
      temphits[i,2] <- tempdata[temppos[i]]

    }
  }

  return(temphits)

}
