
<!-- README.md is generated from README.Rmd. Please edit that file -->

# scriptsearch

<!-- badges: start -->

<!-- badges: end -->

Scriptsearch is an R package intended to help students search through
their previous work. Poorly documented code can be hard to look back on,
preventing you from reusing the solutions you’ve already written. This
package contains two functions to help you search through your scripts.

## Installation

Install scriptsearch from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("carlos-r-git/scriptsearch")
```

To view exercises for testing scriptsearch, add `build_vignettes = TRUE`
to the install function and view the vignette with
`browseVignettes("scriptsearch")`

``` r
# install.packages("devtools")
devtools::install_github("carlos-r-git/scriptsearch, build_vignettes = TRUE")
browseVignettes("scriptsearch")
```

<br><br> *(Coming soon)* You can install the released version of
scriptsearch from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("scriptsearch")
```

## Example

The function `scriptsearch` lists all files in a directory (defaults to
present working directory) that contain specified search terms.

``` r
library(scriptsearch)

scriptsearch("example")
#>                                                  Path Hits Searchterms
#> 1 ./inst/extdata/testing/08CorrelationAndRegression.R    1     example
#> 2  ./inst/extdata/testing/09DevelopingUnderstanding.R    1     example
#> 3                                     ./R/findlines.R    1     example
#> 4                                  ./R/scriptsearch.R    1     example
#> 5                                     ./R/searchdir.R    1     example
#> 6                                 ./R/shortenstring.R    1     example
#> 7                                     ./R/showlines.R    1     example
#> 8                                        ./README.Rmd    4     example
#> 9                ./vignettes/scriptsearch-testing.Rmd    9     example
```

`showlines` can then be used on the output of `scriptsearch` to show all
lines containing hits from the n<sup>th</sup> file in the list.

``` r
library(scriptsearch)

data <- scriptsearch("example")

showlines(data, 6)
#> * Edit './R/shortenstring.R'
#>   Line         Text
#> 1   10 #' @examples
```

## Arguments

### scriptsearch

| Argument    | Default  | Function                               | Example             |
| :---------- | :------- | :------------------------------------- | :------------------ |
| searchterms | N/A      | Strings to search for                  | c(“text1”, “text2”) |
| dir         | “.”      | Directory to search                    | “./scripts”         |
| rm          | TRUE     | Remove files with no hits from output  | TRUE                |
| filetypes   | .R, .Rmd | Strings to be recognised in file names | .R, .Rmd            |

### showlines

| Argument | Default | Function                               | Example                                    |
| :------- | :------ | :------------------------------------- | :----------------------------------------- |
| data     | N/A     | Table containing files and searchterms | data \<- scriptsearch(“./scripts”, “text”) |
| n        | N/A     | Row number of the file to be searched  | 1                                          |
| open     | TRUE    | Open selected file                     | TRUE                                       |
