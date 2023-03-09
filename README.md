
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BRVM

<!-- badges: start -->

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/BRVM)](https://cran.r-project.org/package=BRVM)
![](https://cranlogs.r-pkg.org/badges/BRVM)
![](https://cranlogs.r-pkg.org/badges/grand-total/BRVM) [![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html##experimental)
[![PRs
Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://makeapullrequest.com)
<!-- badges: end -->

# BRVM

BRVM is an R package that provides real-time data from the BRVM
(“Regional Securities Exchange SA” call Bourse Régionale des Valeurs
Mobilières in french). As a goal, we want to facilitate access to data
for all users of the R programming language. This package includes a
variety of data accessible just by function call.

BRVM est un package R qui permet d’obtenir des données à temps réel de
la BRVM (Bourse Régionale des Valeurs Mobilières). Comme objectif, nous
voulons faciliter l’accès aux données à tous les utilisateurs du langage
de programmation R. Ce package comporte une diversité de données
accessibles juste par appel de fonction.

## Installation

You can install the development version of BRVM from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Koffi-Fredysessie/BRVM")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(BRVM)
#> 
#> == Welcome to BRVM ===========================================================================
#> If you find this package useful, please leave a star: 
#>    https://github.com/Koffi-Fredysessie/BRVM
#> 
#> If you encounter a bug or want to request an enhancement please file an issue at:
#>    https://github.com/Koffi-Fredysessie/BRVM/issues
#> 
#> Thank you for using BRVM!
```

Lets take a look at a simple function that will get any n number of
records based on whether they are ‘Top’ or ‘Bottom’ ranked.

``` r
BRVM_rank("Top", 10)
#> # A tibble: 10 x 3
#>    Symbole Nom                                     `Variation (%)`
#>    <chr>   <chr>                                             <dbl>
#>  1 SCRC    SUCRIVOIRE COTE D'IVOIRE                           7.5 
#>  2 STAC    SETAO COTE D'IVOIRE                                7.44
#>  3 PALC    PALM COTE D'IVOIRE                                 7.43
#>  4 SAFC    SAFCA COTE D'IVOIRE                                7.21
#>  5 BOAB    BANK OF AFRICA BENIN                               7.05
#>  6 BOAM    BANK OF AFRICA MALI                                6.51
#>  7 BOAN    BANK OF AFRICA NIGER                               6.31
#>  8 BOAC    BANK OF AFRICA COTE D'IVOIRE                       5.67
#>  9 NEIC    NEI-CEDA COTE D'IVOIRE                             5.59
#> 10 ETIT    Ecobank Transnational Incorporated TOGO            5.26
```

The following function plot candlestick charts of ticker BICC

```{r BRVM_plot("BICC")}
 library(highcharter)
 library(lubridate)
 library(rlang)
 library(httr2)
 library(dplyr)
 library(stringr)
 library(xts)

BRVM_plot("BICC")
```


You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.
