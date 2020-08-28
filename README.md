
<!-- README.md is generated from README.Rmd. Please edit that file -->

# scriptsearch

<!-- badges: start -->

<!-- badges: end -->

Scriptsearch is an R package intended to help people search through
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

The function `scriptsearch()` lists all files in a directory (defaults
to present working directory) that contain specified search terms.

``` r

library(scriptsearch)

scriptsearch("example")
#>                             Path Hits Searchterms
#> 1 ./08CorrelationAndRegression.R    1     example
#> 2  ./09DevelopingUnderstanding.R    1     example
#> 3             ./exampleprac2.Rmd    1     example
#> 4             ./exampleprac4.Rmd    1     example
#> 5             ./exampleprac5.Rmd    1     example
#> 6             ./exampleprac6.Rmd    1     example
#> 7             ./exampleprac7.Rmd    1     example
#> 8             ./exampleprac8.Rmd    1     example
```

By default `scriptsearch()` will add escape characters to special
characters in the searchterms string (using
[this](https://github.com/richierocks/rebus.base/blob/master/R/escape_special.R)
method). The special characters recognised are: `\\ ^ $ . | ? * + ( ) [
{`

``` r

scriptsearch("t.test")
#>                            Path Hits Searchterms
#> 1    ./05OneAndTwoSampleTests.R    4    t\\.test
#> 2 ./09DevelopingUnderstanding.R    1    t\\.test
#> 3            ./exampleprac5.Rmd    1    t\\.test
```

`showlines()` can then be used on the output of `scriptsearch` to show
all lines containing hits from the n<sup>th</sup> file in the list.

``` r

library(scriptsearch)

data <- scriptsearch("example")

showlines(data, 2)
#> * Edit './09DevelopingUnderstanding.R'
#>   Line                                        Text
#> 1   82 ## # for example, the binomial distribution
```

## Arguments

### scriptsearch

| Argument    | Default       | Function                              | Example             |
| :---------- | :------------ | :------------------------------------ | :------------------ |
| searchterms | N/A           | Strings to search for                 | c(“text1”, “text2”) |
| dir         | “.”           | Directory to search                   | “./scripts”         |
| rm          | TRUE          | Remove files with no hits from output | TRUE                |
| filetypes   | c(“R”, “Rmd”) | File endings recognised               | txt                 |
| escape      | TRUE          | Add escape characters                 | TRUE                |

### showlines

| Argument | Default | Function                               | Example                                    |
| :------- | :------ | :------------------------------------- | :----------------------------------------- |
| data     | N/A     | Table containing files and searchterms | data \<- scriptsearch(“./scripts”, “text”) |
| n        | N/A     | Index of the file to be searched       | 1                                          |
| open     | TRUE    | Open selected file                     | TRUE                                       |
