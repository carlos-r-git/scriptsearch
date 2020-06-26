scriptsearch <- function(dir, searchterms, filetypes = c(".R", ".rmd"), showlines = 0) {

  files <- searchdir(dir = dir, filetypes = filetypes)

  data <- data.frame(1:length(files),2)
  colnames(data) <- c("Path", "Hits")

  for (i in 1:length(files)) {

    tempdata <- readfile(dir = dir, files = files, i = i)

    temppos <- findlines(tempdata = tempdata, searchterms = searchterms)

    data[i,1] <- paste0(dir,"/",files[i])

    if (length(temppos) == 0) {

      data[i,2] <- "FALSE"
      assign(paste0("script.search.hits",i), "No hits found.")

    } else {

      data[i,2] <- "TRUE"
      temphits <- data.frame(1:length(temppos),2)
      colnames(temphits) <- c("Line", "Text")

      for (j in 1:length(temppos)) {

        temphits[j,1] <- temppos[j]
        temphits[j,2] <- tempdata[temppos[j]]

      }
      assign(paste0("script.search.hits",i), temphits)
      rm("temphits")

    }
  }

  if (showlines == 0) {

    print(data)
    cat("Use script.search(dir = directory, searchterms = x, showlines = N) to view lines containing x in the Nth document.")

  } else {

    get(paste0("script.search.hits", showlines))

  }
}
