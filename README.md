
<!-- README.md is generated from README.Rmd. Please edit that file -->

# scriptsearch

<!-- badges: start -->

<!-- badges: end -->

Scriptsearch is a package for searching R scripts you have previously
made, but forgot to document. This is intended to help students look
back at their old work and enable them to reuse solutions they have
already learned.

## Installation

You can install the released version of scriptsearch from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("scriptsearch")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("carlos-r-git/scriptsearch")
```

## Example

The function `scriptsearch` lists all files in a directory that contain
specified search terms.

``` r
library(scriptsearch)

scriptsearch(dir = ".", searchterms = "search")
#>                                   Path Hits Searchterms
#> 1                      ./R/findlines.R    5      search
#> 2                   ./R/scriptsearch.R   10      search
#> 3                      ./R/searchdir.R    3      search
#> 4                      ./R/showlines.R    8      search
#> 5                         ./README.Rmd   16      search
#> 6                   ./tests/testthat.R    2      search
#> 7 ./tests/testthat/test-scriptsearch.R   10      search
#> 8    ./tests/testthat/test-searchdir.R    3      search
#> 9    ./tests/testthat/test-showlines.R    1      search
```

`showlines` can then be used on the output of `scriptsearch` to show all
lines containing hits from the n<sup>th</sup> file in the list.

``` r
library(scriptsearch)

data <- scriptsearch(dir = ".", searchterms = "search")

showlines(data = data, n = 1)
#>   Line                                                  Text
#> 1    3 #' Returns indicies of items of a list that contai...
#> 2    5      #' @param tempdata Lines of text to be searched.
#> 3    6          #' @param searchterms Strings to search for.
#> 4   14        findlines <- function(tempdata, searchterms) {
#> 5   16   temppos <- which(stringr::str_detect(tempdata, p...
```

## scriptsearch

| Argument    | Default  | Function                               | Example             |
| :---------- | :------- | :------------------------------------- | :------------------ |
| dir         | N/A      | Path of the directory                  | “./scripts”         |
| searchterms | N/A      | Strings to search for                  | c(“text1”, “text2”) |
| rm          | TRUE     | Remove files with no hits from output  | TRUE                |
| filetypes   | .R, .Rmd | Strings to be recognised in file names | .R, .Rmd            |

## showlines

| Argument | Default | Function                               | Example                                    |
| :------- | :------ | :------------------------------------- | :----------------------------------------- |
| data     | N/A     | Table containing files and searchterms | data \<- scriptsearch(“./scripts”, “text”) |
| n        | N/A     | Row number of the file to be searched  | 1                                          |
| open     | FALSE   | Open selected file                     | TRUE                                       |
