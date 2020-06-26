showlines <- function(data, n) {

  if (data[n,2,1] == FALSE) {

    cat("No hits found.")
    return(data)

  } else {

    searchterms <- data[n,3,1]

    tempdata <- readfile(file = data[n,1,1])

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
