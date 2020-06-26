scriptsearch <- function(dir, searchterms, filetypes = c(".R", ".rmd")) {

  files <- searchdir(dir = dir, filetypes = filetypes)

  data <- data.frame(1:length(files),0,0)
  colnames(data) <- c("Path", "Hits", "Search Terms")
  data[,3] <- searchterms

  for (i in 1:length(files)) {

    tempdata <- readfile(file = paste0(dir,"/",files[i]))

    temppos <- findlines(tempdata = tempdata, searchterms = searchterms)

    data[i,1] <- paste0(dir,"/",files[i])

    if (length(temppos) == 0) {

      data[i,2] <- "FALSE"

    } else {

      data[i,2] <- "TRUE"

    }

  }

  return(data)

}
