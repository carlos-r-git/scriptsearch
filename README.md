
<!-- README.md is generated from README.Rmd. Please edit that file -->

# scriptsearch

<!-- badges: start -->

<!-- badges: end -->

Scriptsearch is a package for searching R scripts you have previously
made, but forgot to document. This is intended to help students look
back at their old work and enable them to reuse solutions they have
already learned.

## Installation

(Coming soon) You can install the released version of scriptsearch from
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

The function `scriptsearch` lists all files in a directory (defaults to
present working directory) that contain specified search terms.

``` r
library(scriptsearch)

scriptsearch("example")
#>                  Path Hits Searchterms
#> 1     ./R/findlines.R    1     example
#> 2  ./R/scriptsearch.R    1     example
#> 3     ./R/searchdir.R    1     example
#> 4 ./R/shortenstring.R    1     example
#> 5     ./R/showlines.R    1     example
#> 6        ./README.Rmd    4     example
```

`showlines` can then be used on the output of `scriptsearch` to show all
lines containing hits from the n<sup>th</sup> file in the list.

```` r
library(scriptsearch)

data <- scriptsearch("example")

showlines(data, 6)
#> * Edit './README.Rmd'
#>   Line                            Text
#> 1   41                  ```{r example}
#> 2   44         scriptsearch("example")
#> 3   49                 ```{r example2}
#> 4   52 data <- scriptsearch("example")
````

## scriptsearch

| Argument    | Default  | Function                               | Example             |
| :---------- | :------- | :------------------------------------- | :------------------ |
| searchterms | N/A      | Strings to search for                  | c(“text1”, “text2”) |
| dir         | “.”      | Directory to search                    | “./scripts”         |
| rm          | TRUE     | Remove files with no hits from output  | TRUE                |
| filetypes   | .R, .Rmd | Strings to be recognised in file names | .R, .Rmd            |

## showlines

| Argument | Default | Function                               | Example                                    |
| :------- | :------ | :------------------------------------- | :----------------------------------------- |
| data     | N/A     | Table containing files and searchterms | data \<- scriptsearch(“./scripts”, “text”) |
| n        | N/A     | Row number of the file to be searched  | 1                                          |
| open     | TRUE    | Open selected file                     | TRUE                                       |
