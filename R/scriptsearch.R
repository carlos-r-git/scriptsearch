scriptsearch <- function(dir, searchterms, filetypes = c(".R", ".rmd")) {

  files <- searchdir(dir = dir, filetypes = filetypes)

  data <- data.frame(1:length(files),2)
  colnames(data) <- c("Path", "Hits")

  for (i in 1:length(files)) {

    tempdata <- readfile(dir = dir, files = files, i = i)

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
