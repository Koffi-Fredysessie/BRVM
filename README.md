
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BRVM

<!-- badges: start -->

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/BRVM)](https://cran.r-project.org/package=BRVM)
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
#>    ticker company_name                                percentage_variation
#>    <chr>  <chr>                                                      <dbl>
#>  1 ETIT   Ecobank Transnational Incorporated TOGO                     5   
#>  2 SIBC   SOCIETE IVOIRIENNE DE BANQUE COTE D'IVOIRE                  5   
#>  3 SIVC   AIR LIQUIDE COTE D'IVOIRE                                   4.65
#>  4 CFAC   CFAO MOTORS COTE D'IVOIRE                                   3.45
#>  5 FTSC   FILTISAC COTE D'IVOIRE                                      2.24
#>  6 PRSC   TRACTAFRIC MOTORS COTE D'IVOIRE                             2.17
#>  7 SDSC   BOLLORE TRANSPORT & LOGISTICS COTE D'IVOIRE                 2   
#>  8 TTLC   TOTAL COTE D'IVOIRE                                         1.85
#>  9 TTLS   TOTAL SENEGAL                                               0.48
#> 10 SNTS   SONATEL SENEGAL                                             0.17
```
