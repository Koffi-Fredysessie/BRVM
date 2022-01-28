
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
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
