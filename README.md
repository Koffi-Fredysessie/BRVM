---
title: "Library BRVM"
author:
    - Koffi Frederic Sessie
    - Abdoul Oudouss Diakité
    - Sanderson Steven
creator : "Koffi Frederic SESSIE"
cph: "Koffi Frederic SESSIE"
date: "25 mars,2023"
output:
  html_document: 
    toc: yes
    fig_caption: yes
    keep_md: yes
    fig_width: 10
    fig_height: 10
  word_document: 
    toc: yes
  pdf_document: 
    toc: yes
    latex_engine: lualatex
always_allow_html: true
---


<!-- README.md is generated from README.Rmd. Please edit that file -->



# BRVM <img src="man/figures/brvm-logo.png" width="147" height="170" align="right" />

<!-- badges: start -->
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/BRVM)](https://cran.r-project.org/package=BRVM)
![](https://cranlogs.r-pkg.org/badges/BRVM)
![](https://cranlogs.r-pkg.org/badges/grand-total/BRVM)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html##experimental)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://makeapullrequest.com)
<!-- badges: end -->

## BRVM

`BRVM` is an R package that provides real-time data from the BRVM (“Regional Securities Exchange SA” call Bourse Régionale des Valeurs Mobilières in french). As a goal, we want to facilitate access to data for all users of the R programming language. This package includes a variety of data accessible just by function call.

`BRVM` est un package R qui permet d’obtenir des données à temps réel de la BRVM (Bourse Régionale des Valeurs Mobilières). Comme objectif, nous voulons faciliter l’accès aux données à tous les utilisateurs du langage de programmation R. Ce package comporte une diversité de données accessibles juste par appel de fonction.

## Installation guidelines
You can install the development version of BRVM from [github](https://github.com/Koffi-Fredysessie/BRVM) with:


```r
# github dev version
## We can use devtools
# install.packages("devtools")
devtools::install_github("Koffi-Fredysessie/BRVM")

# Or use remotes
# install.packages("remotes")
remotes::install_github("Koffi-Fredysessie/BRVM")
```


```r
library(BRVM)
```

## The **BRVM_tickers()** function
 
It receives no argument and returns two informations about BRVM exchange companies (ticker and company name). It is important to visualize the tickers. Indeed, they are used by the other functions of the package to obtain data and even plot the OHCL graph of their prices.


```r
#' Show tickers
ticks <- BRVM_tickers()
#> [1] "Make sure you have an active internet connection"
dput(ticks[[1]]) # Returns the name of all tickers
#> "Make sure you have an active internet connection"
```


## The **BRVM_ticker_desc()** function
 
It receives no argument and returns the BRVM ticker information such as its full name, sector and country.


```r
BRVM_ticker_desc()
#> # A tibble: 47 × 4
#>    Ticker `Company name`                 Sector       Country     
#>    <chr>  <chr>                          <fct>        <fct>       
#>  1 ABJC   SERVAIR ABIDJAN  COTE D'IVOIRE DISTRIBUTION IVORY COAST 
#>  2 BICC   BICI COTE D'IVOIRE             FINANCE      IVORY COAST 
#>  3 BNBC   BERNABE COTE D'IVOIRE          DISTRIBUTION IVORY COAST 
#>  4 BOAB   BANK OF AFRICA BENIN           FINANCE      BENIN       
#>  5 BOABF  BANK OF AFRICA BURKINA FASO    FINANCE      BURKINA FASO
#>  6 BOAC   BANK OF AFRICA COTE D'IVOIRE   FINANCE      IVORY COAST 
#>  7 BOAM   BANK OF AFRICA MALI            FINANCE      MALI        
#>  8 BOAN   BANK OF AFRICA NIGER           FINANCE      NIGER       
#>  9 BOAS   BANK OF AFRICA SENEGAL         FINANCE      SENEGAL     
#> 10 CABC   SICABLE COTE D'IVOIRE          INDUSTRY     IVORY COAST 
#> # … with 37 more rows
```

## The **BRVM_index()** function :
It receives no argument and returns a table of updated data (with as table header: indexes, previous closing, closing, change (%), Year to Date Change) on all the indices available on the BRVM exchange.


```r
BRVM_index()
#> [1] "Make sure you have an active internet connection"
```


## The ** BRVM_get(".symbol", ".from", ".to")** function
 
This function will get data of the companies listed on the BVRM exchange through the Rich Bourse site. The function takes in a single parameter of .symbol(which represents the "Ticker".
The function will auto-format the tickers you input into all upper case by using toupper() and will next make sure that the ticker passed is inside of a google spreadsheet of allowed tickers.

* .symbol : A vector of symbols, like: c("BICC","XOM","SlbC") ;
* .from : A quoted start date, ie. "2020-01-01" or "2020/01/01". The date must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD" ;
* .to : A quoted end date, ie. "2022-01-31" or "2022/01/31". The date must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD".


```r
library(lubridate)
library(rlang)
library(httr2)
library(dplyr)
library(stringr)
#' Displaying data of SONATEL Senegal stock
BRVM_get(.symbol = "snts")
#> [1] "SNTS"
#> # A tibble: 251 × 6
#>    Date        Open  High   Low Close Volume
#>    <date>     <dbl> <dbl> <dbl> <dbl>  <dbl>
#>  1 2022-03-25 15595 15900 15500 15900  13128
#>  2 2022-03-28 15895 15900 15505 15505   2107
#>  3 2022-03-29 15515 15800 15500 15600  33932
#>  4 2022-03-30 15600 15895 15600 15895    516
#>  5 2022-03-31 15700 15900 15600 15800  10671
#>  6 2022-04-01 15700 15800 15600 15650   5542
#>  7 2022-04-04 15655 15775 15655 15775    126
#>  8 2022-04-05 15775 15775 15660 15750  25792
#>  9 2022-04-06 15800 15895 15750 15800   7436
#> 10 2022-04-07 15800 15900 15750 15900   1265
#> # … with 241 more rows

symbols <- c("BiCc","XOM","SlbC")   # We use here three tickers
data_tbl <- BRVM_get(.symbol = symbols, .from = "2020-01-01", .to = Sys.Date() - 1)
#> [1] "BICC" "SLBC"
head(data_tbl, 20) # display the first two tens elements of the table
#> # A tibble: 20 × 7
#>    Date        Open  High   Low Close Volume Ticker
#>    <date>     <dbl> <dbl> <dbl> <dbl>  <dbl> <chr> 
#>  1 2020-01-10  6500  6500  6500  6500     24 BICC  
#>  2 2020-01-13  6370  6500  6370  6500     29 BICC  
#>  3 2020-01-14  6495  6495  6495  6495     10 BICC  
#>  4 2020-01-29  6010  6010  6010  6010     24 BICC  
#>  5 2020-01-30  6000  6000  6000  6000     50 BICC  
#>  6 2020-02-04  5800  5800  5800  5800     12 BICC  
#>  7 2020-02-07  5650  5650  5650  5650      5 BICC  
#>  8 2020-02-10  5500  5500  5500  5500      5 BICC  
#>  9 2020-02-14  5300  5300  5300  5300      9 BICC  
#> 10 2020-02-17  4910  4910  4910  4910    210 BICC  
#> 11 2020-02-18  4910  4910  4910  4910     50 BICC  
#> 12 2020-02-20  4895  4895  4895  4895      5 BICC  
#> 13 2020-02-21  4895  4895  4890  4890     13 BICC  
#> 14 2020-02-25  4525  4525  4525  4525     16 BICC  
#> 15 2020-02-26  4435  4435  4430  4430     21 BICC  
#> 16 2020-02-27  4345  4760  4335  4760   1809 BICC  
#> 17 2020-03-03  4745  4750  4745  4750     11 BICC  
#> 18 2020-03-05  4700  4700  4700  4700      5 BICC  
#> 19 2020-03-06  4695  4695  4695  4695      6 BICC  
#> 20 2020-03-11  4345  4450  4345  4450    135 BICC
tail(data_tbl, 20) # display the two tens of the last elements of the table
#> # A tibble: 20 × 7
#>    Date        Open  High   Low Close Volume Ticker
#>    <date>     <dbl> <dbl> <dbl> <dbl>  <dbl> <chr> 
#>  1 2023-01-30 75865 75865 75865 75865      1 SLBC  
#>  2 2023-02-07 81550 81550 81550 81550      1 SLBC  
#>  3 2023-02-09 85000 85000 85000 85000      2 SLBC  
#>  4 2023-02-10 85000 85000 85000 85000      2 SLBC  
#>  5 2023-02-13 85000 85000 85000 85000      1 SLBC  
#>  6 2023-02-14 79000 79000 79000 79000      2 SLBC  
#>  7 2023-02-15 80000 80000 79000 79000      2 SLBC  
#>  8 2023-02-17 78000 78000 78000 78000      5 SLBC  
#>  9 2023-02-21 80000 80000 80000 80000      5 SLBC  
#> 10 2023-02-23 80000 80000 80000 80000     18 SLBC  
#> 11 2023-02-24 80000 80000 80000 80000      6 SLBC  
#> 12 2023-02-27 80000 80000 80000 80000     98 SLBC  
#> 13 2023-02-28 80000 80000 80000 80000     11 SLBC  
#> 14 2023-03-02 80000 80000 80000 80000     11 SLBC  
#> 15 2023-03-08 80000 80000 80000 80000      2 SLBC  
#> 16 2023-03-09 80000 80000 80000 80000      2 SLBC  
#> 17 2023-03-13 80005 80005 80000 80000     12 SLBC  
#> 18 2023-03-14 80000 80000 80000 80000      1 SLBC  
#> 19 2023-03-20 80000 80000 80000 80000      3 SLBC  
#> 20 2023-03-21 80000 80000 80000 80000      4 SLBC
```

## The **BRVM_get1("ticker ", "Period", "from", "to")** function

This function will get data of the companies listed on the BVRM exchange through the sikafinance site.
The function takes in a single parameter of ticker and will auto-format the tickers you input into all upper case by using toupper()

* ticker : A vector of ticker, like: c("BICC","XOM","SlbC", "BRvm10");
* Period : Numeric number indicating time period. Valid entries are 0, 1, 5, 30, 91, and 365 representing respectively 'daily', 'one year', 'weekly', 'monthly', 'quarterly' and 'yearly';
* from : A quoted start date, ie. "2020-01-01" or "2020/01/01". The date must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD";
* to : A quoted end date, ie. "2022-01-31" or "2022/01/31". The date must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD"

** NB : There is a small difference between the BRVM_get and BRVM_get1 functions.
* With BRVM_get it is only possible to download tickers' daily data.
* But with BRVM_get1, you can download daily, weekly, monthly, annual tickers’ data, indices and even market capitalization.


```r
library(lubridate)
library(rlang)
library(httr2)
library(dplyr)
library(stringr)
#' Displaying data of SONATEL Senegal stock
BRVM_get1("snts")
#> [1] "We obtained SNTS data from 2022-12-26 to 2023-03-24"
#> # A tibble: 65 × 5
#>    Date        Open  High   Low Close
#>    <date>     <int> <int> <int> <int>
#>  1 2022-12-26 15000 15600 15000 15600
#>  2 2022-12-27 15400 15500 15400 15500
#>  3 2022-12-28 15400 15450 15400 15450
#>  4 2022-12-29 15395 15450 15395 15450
#>  5 2022-12-30 15435 15435 15200 15200
#>  6 2023-01-02 15195 15395 15195 15395
#>  7 2023-01-03 15390 15390 15375 15375
#>  8 2023-01-04 15295 15295 15280 15280
#>  9 2023-01-05 15265 15265 15160 15160
#> 10 2023-01-06 15100 15100 15000 15000
#> # … with 55 more rows

# Get daily data of all indexes
all_ind <- BRVM_get1("ALL INDEXES", Period = 0, from = "2010-01-04", to = "2022-01-04") 
#> [1] "We obtained BRVM10 data from 2009-10-07 to 2022-01-04"
#> [1] "We obtained BRVMAG data from 2009-10-07 to 2022-01-04"
#> [1] "We obtained BRVMC data from 2009-10-07 to 2022-01-04"
#> [1] "We obtained BRVMAS data from 2009-10-07 to 2022-01-04"
#> [1] "We obtained BRVMDI data from 2009-10-07 to 2022-01-04"
#> [1] "We obtained BRVMFI data from 2009-10-07 to 2022-01-04"
#> [1] "We obtained BRVMIN data from 2009-10-07 to 2022-01-04"
#> [1] "We obtained BRVMSP data from 2009-10-07 to 2022-01-04"
#> [1] "We obtained BRVMTR data from 2009-10-07 to 2022-01-04"
#> [1] "BRVMPR data aren't available between 2010-01-04 and 2022-01-04"
#> [1] "BRVMPA data aren't available between 2010-01-04 and 2022-01-04"
#> [1] "BRVM30 data aren't available between 2010-01-04 and 2022-01-04"
#> [1] "We obtained CAPIB data from 2020-01-02 to 2022-01-04"
head(all_ind, 20) # display the first two tens elements of the table
#> # A tibble: 20 × 7
#>    Date        Open  High   Low Close Volume Ticker
#>    <date>     <dbl> <dbl> <dbl> <dbl>  <dbl> <chr> 
#>  1 2021-10-07  145.  145.  145.  145.      0 BRVM10
#>  2 2021-10-08  145.  145.  145.  145.      0 BRVM10
#>  3 2021-10-11  146.  146.  146.  146.      0 BRVM10
#>  4 2021-10-12  147.  147.  147.  147.      0 BRVM10
#>  5 2021-10-13  147.  147.  147.  147.      0 BRVM10
#>  6 2021-10-14  147.  147.  147.  147.      0 BRVM10
#>  7 2021-10-15  147.  147.  147.  147.      0 BRVM10
#>  8 2021-10-18  147.  147.  147.  147.      0 BRVM10
#>  9 2021-10-19  147.  147.  147.  147.      0 BRVM10
#> 10 2021-10-20  148.  148.  148.  148.      0 BRVM10
#> 11 2021-10-21  148.  148.  148.  148.      0 BRVM10
#> 12 2021-10-22  147.  147.  147.  147.      0 BRVM10
#> 13 2021-10-25  147.  147.  147.  147.      0 BRVM10
#> 14 2021-10-26  147.  147.  147.  147.      0 BRVM10
#> 15 2021-10-27  147.  147.  147.  147.      0 BRVM10
#> 16 2021-10-28  147.  147.  147.  147.      0 BRVM10
#> 17 2021-10-29  148.  148.  148.  148.      0 BRVM10
#> 18 2021-11-01  148.  148.  148.  148.      0 BRVM10
#> 19 2021-11-02  149.  149.  149.  149.      0 BRVM10
#> 20 2021-11-03  149.  149.  149.  149.      0 BRVM10
tail(all_ind, 20) # display the two tens of the last elements of the table
#> # A tibble: 20 × 7
#>    Date          Open    High     Low   Close Volume Ticker
#>    <date>       <dbl>   <dbl>   <dbl>   <dbl>  <dbl> <chr> 
#>  1 2020-03-11 4332656 4332656 4332656 4332656      0 CAPIB 
#>  2 2020-03-12 4318096 4318096 4318096 4318096      0 CAPIB 
#>  3 2020-03-13 4318112 4318112 4318112 4318112      0 CAPIB 
#>  4 2020-03-16 4285184 4285184 4285184 4285184      0 CAPIB 
#>  5 2020-03-17 4301727 4301727 4301727 4301727      0 CAPIB 
#>  6 2020-03-18 4288582 4288582 4288582 4288582      0 CAPIB 
#>  7 2020-03-19 4207231 4207231 4207231 4207231      0 CAPIB 
#>  8 2020-03-20 4209788 4209788 4209788 4209788      0 CAPIB 
#>  9 2020-03-23 4154445 4154445 4154445 4154445      0 CAPIB 
#> 10 2020-03-24 4144325 4144325 4144325 4144325      0 CAPIB 
#> 11 2020-03-25 4121087 4121087 4121087 4121087      0 CAPIB 
#> 12 2020-03-26 4090924 4090924 4090924 4090924      0 CAPIB 
#> 13 2020-03-27 4063317 4063317 4063317 4063317      0 CAPIB 
#> 14 2020-03-30 4045799 4045799 4045799 4045799      0 CAPIB 
#> 15 2020-03-31 4028869 4028869 4028869 4028869      0 CAPIB 
#> 16 2020-04-01 4034121 4034121 4034121 4034121      0 CAPIB 
#> 17 2020-04-02 4027430 4027430 4027430 4027430      0 CAPIB 
#> 18 2020-04-03 4012613 4012613 4012613 4012613      0 CAPIB 
#> 19 2020-01-02 4688403 4688403 4688403 4688403      0 CAPIB 
#> 20 2020-01-03 4661438 4661438 4661438 4661438      0 CAPIB

# To get yearly data
yearly_data <- BRVM_get1(c("brvmtr", "BiCc", "BOAS"), Period = 365 ) 
head(yearly_data, 20) # display the first two tens elements of the table
#> # A tibble: 20 × 6
#>    Date         Open   High    Low  Close Ticker
#>    <date>      <dbl>  <dbl>  <dbl>  <dbl> <chr> 
#>  1 2003-03-31   74.0   88.6   73.6   88.6 BRVMTR
#>  2 2004-01-02   88.6   89.2   72.9   89.2 BRVMTR
#>  3 2005-01-03   89.2  107.    70.7  104.  BRVMTR
#>  4 2006-01-02  104.   158.   104.   153.  BRVMTR
#>  5 2007-01-02  153.   275.   149.   249.  BRVMTR
#>  6 2008-01-02  249.   386.   226.   296.  BRVMTR
#>  7 2009-01-02  275.   296.   227.   236.  BRVMTR
#>  8 2010-01-04  236.   259.   224.   238.  BRVMTR
#>  9 2011-01-03  238.   249.   204.   239   BRVMTR
#> 10 2012-01-02  239    349.   201.   349.  BRVMTR
#> 11 2013-01-02  349.   794.   339.   789.  BRVMTR
#> 12 2014-01-02  789.  1213.   601.  1213.  BRVMTR
#> 13 2015-01-02 1213.  1525.   653.  1525.  BRVMTR
#> 14 2016-01-04 1525.  1525.  1216.  1432.  BRVMTR
#> 15 2017-01-02 1432.  1433.   764.  1203.  BRVMTR
#> 16 2018-01-02 1114.  1193.   966.   966.  BRVMTR
#> 17 2019-06-03  403.   429.   311.   367.  BRVMTR
#> 18 2020-01-01  367.   475.   292.   379.  BRVMTR
#> 19 2021-01-04  376.   622.   325    622.  BRVMTR
#> 20 2022-01-03  667.   667.   295.   342.  BRVMTR
tail(yearly_data, 20) # display the two tens of the last elements of the table
#> # A tibble: 20 × 6
#>    Date        Open  High   Low Close Ticker
#>    <date>     <dbl> <dbl> <dbl> <dbl> <chr> 
#>  1 2014-01-02  5650  7848  5650  7800 BICC  
#>  2 2015-01-02  8385 10750  7800 10100 BICC  
#>  3 2016-01-04 10000 10700  8566  9890 BICC  
#>  4 2017-01-05  9750 10000  6440  8490 BICC  
#>  5 2018-01-02  8700  8750  3795  7900 BICC  
#>  6 2019-01-04  7550  7550  3710  6800 BICC  
#>  7 2020-01-01  6800  6890  2855  6680 BICC  
#>  8 2021-01-04  6680  7525  4280  7400 BICC  
#>  9 2022-01-03  7250  7250  5550  6850 BICC  
#> 10 2023-01-02  6500  6850  5785  6300 BICC  
#> 11 2014-12-10  1613  3225  1613  3225 BOAS  
#> 12 2015-01-02  3370  4300  2900  3950 BOAS  
#> 13 2016-01-04  3700  4101  2000  2350 BOAS  
#> 14 2017-01-02  2325  3875  2035  2500 BOAS  
#> 15 2018-01-02  2400  3250  1700  2020 BOAS  
#> 16 2019-01-02  1900  2000  1500  1545 BOAS  
#> 17 2020-01-01  1550  1700  1295  1495 BOAS  
#> 18 2021-01-04  1480  2750  1340  2350 BOAS  
#> 19 2022-01-03  2350  2780  2200  2450 BOAS  
#> 20 2023-01-02  2580  2585  2175  2175 BOAS
```

## The **BRVM.index()** function :
It receives no argument and returns the name of all indexes available on BRVM Stock Exchange.


```r
BRVM.index()
#>  [1] "BRVMAG" "BRVMC"  "BRVMAS" "BRVMDI" "BRVMFI" "BRVMIN" "BRVMSP" "BRVMTR"
#>  [9] "BRVMPR" "BRVMPA" "BRVM30"
```


 
## The **BRVM_bySector(".sectors")** function :
 
This function will take in the name of sector(s) and returns data for companies belonging to that/those sector(s)

* .sectors : A vector of sectors you wish to have returned.


```r
# Get informations about brvm sectors like other and agriculture sectors
BRVM_bySector(.sectors = c("Other", "Agriculture"))
#> [1] "There is 1 company that belongs to Other's sector"
#> # A tibble: 1 × 6
#>   Ticker Volume `Previous price`  Open Close `Change (%)`
#>   <chr>   <dbl>            <dbl> <dbl> <dbl>        <dbl>
#> 1 STAC    10972             1050  1050  1050        -4.55
#> [1] "There are 5 companies that belong to Agriculture's sector"
#> # A tibble: 5 × 6
#>   Ticker Volume `Previous price`  Open Close `Change (%)`
#>   <chr>   <dbl>            <dbl> <dbl> <dbl>        <dbl>
#> 1 PALC     3171            10900 10850 10945         0.41
#> 2 SCRC      776              685   650   685        -0.72
#> 3 SICC        8             5945  5945  5945        -7.47
#> 4 SOGC      205             5700  5650  5650        -0.88
#> 5 SPHC       20             5000  5000  4995        -0.1
#> # A tibble: 6 × 8
#>   Ticker `Company name`           Volume Previous p…¹  Open Close Chang…² Sector
#>   <chr>  <chr>                     <dbl>        <dbl> <dbl> <dbl>   <dbl> <chr> 
#> 1 STAC   SETAO COTE D'IVOIRE       10972         1050  1050  1050   -4.55 Other 
#> 2 PALC   PALM COTE D'IVOIRE         3171        10900 10850 10945    0.41 Agric…
#> 3 SCRC   SUCRIVOIRE COTE D'IVOIRE    776          685   650   685   -0.72 Agric…
#> 4 SICC   SICOR COTE D'IVOIRE           8         5945  5945  5945   -7.47 Agric…
#> 5 SOGC   SOGB COTE D'IVOIRE          205         5700  5650  5650   -0.88 Agric…
#> 6 SPHC   SAPH COTE D'IVOIRE           20         5000  5000  4995   -0.1  Agric…
#> # … with abbreviated variable names ¹​`Previous price`, ²​`Change (%)`
```

 
## The **BRVM_stock_market(".weekday")** function :
This function receives as input a day of the week (working day) and returns the official quotation revews of that day.
* .weekday : A quoted date, ie. "2022-01-31" or "2022/01/31". The date must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD". Must not be a weekend or a holiday.


```r
# The BOC of 2022-02-23
BRVM_stock_market("2022-02-23")
```


<table class="table table-condensed">
 <thead>
  <tr>
   <th style="text-align:left;"> Ticker </th>
   <th style="text-align:left;"> Equity </th>
   <th style="text-align:center;"> Volume </th>
   <th style="text-align:right;"> Value </th>
   <th style="text-align:center;"> Previous price </th>
   <th style="text-align:center;"> Open </th>
   <th style="text-align:center;"> Close </th>
   <th style="text-align:left;"> Change (%) </th>
   <th style="text-align:center;"> Annual change (%) </th>
   <th style="text-align:center;"> Reference price </th>
   <th style="text-align:center;"> Low </th>
   <th style="text-align:center;"> High </th>
   <th style="text-align:center;"> Net Income </th>
   <th style="text-align:center;"> Date </th>
   <th style="text-align:center;"> Compartment </th>
   <th style="text-align:center;"> Yield Net (%) </th>
   <th style="text-align:center;"> PER </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> INDUSTRY SECTOR </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:center;"> -4.85% </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">      </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold">
  <i class></i>
  NA
</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CABC </td>
   <td style="text-align:left;"> SICABLE CI </td>
   <td style="text-align:center;"> 517 </td>
   <td style="text-align:right;"> 665880 </td>
   <td style="text-align:center;"> 1225 </td>
   <td style="text-align:center;"> 1225 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffefe">1225  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: black">
  <i class="glyphicon glyphicon-"></i>
  0
</span> </td>
   <td style="text-align:center;"> 20.69 </td>
   <td style="text-align:center;"> 1225 </td>
   <td style="text-align:center;"> 1000 </td>
   <td style="text-align:center;"> 1030 </td>
   <td style="text-align:center;"> 133.00 </td>
   <td style="text-align:center;"> 02/08/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 10.86 </td>
   <td style="text-align:center;"> 6.22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FTSC </td>
   <td style="text-align:left;"> FILTISAC CI </td>
   <td style="text-align:center;"> 840 </td>
   <td style="text-align:right;"> 1343210 </td>
   <td style="text-align:center;"> 1560 </td>
   <td style="text-align:center;"> 1600 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffefe">1600  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -2.5
</span> </td>
   <td style="text-align:center;"> -7.14 </td>
   <td style="text-align:center;"> 1600 </td>
   <td style="text-align:center;"> 17020 </td>
   <td style="text-align:center;"> 19780 </td>
   <td style="text-align:center;"> 235.00 </td>
   <td style="text-align:center;"> 31/08/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 14.69 </td>
   <td style="text-align:center;"> 6.35 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NEIC </td>
   <td style="text-align:left;"> NEI-CEDA CI </td>
   <td style="text-align:center;"> 10866 </td>
   <td style="text-align:right;"> 8915565 </td>
   <td style="text-align:center;"> 880 </td>
   <td style="text-align:center;"> 875 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffefe">850   </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -7.37
</span> </td>
   <td style="text-align:center;"> 40.80 </td>
   <td style="text-align:center;"> 950 </td>
   <td style="text-align:center;"> 33 </td>
   <td style="text-align:center;"> 37 </td>
   <td style="text-align:center;"> 9.00 </td>
   <td style="text-align:center;"> 28/06/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 0.00 </td>
   <td style="text-align:center;"> 15.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NTLC </td>
   <td style="text-align:left;"> NESTLE CI </td>
   <td style="text-align:center;"> 207 </td>
   <td style="text-align:right;"> 1168515 </td>
   <td style="text-align:center;"> 5645 </td>
   <td style="text-align:center;"> 5640 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffcfc">5645  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -0.09
</span> </td>
   <td style="text-align:center;"> 22.58 </td>
   <td style="text-align:center;"> 5650 </td>
   <td style="text-align:center;"> 1850 </td>
   <td style="text-align:center;"> 2140 </td>
   <td style="text-align:center;"> 363.67 </td>
   <td style="text-align:center;"> 30/07/2021 </td>
   <td style="text-align:center;"> 2eme </td>
   <td style="text-align:center;"> 6.44 </td>
   <td style="text-align:center;"> 5.97 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEMC </td>
   <td style="text-align:left;"> CROWN SIEM CI </td>
   <td style="text-align:center;"> 602 </td>
   <td style="text-align:right;"> 445980 </td>
   <td style="text-align:center;"> 730 </td>
   <td style="text-align:center;"> 750 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffefe">750   </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: green">
  <i class="glyphicon glyphicon-arrow-up"></i>
  2.74
</span> </td>
   <td style="text-align:center;"> -1.96 </td>
   <td style="text-align:center;"> 730 </td>
   <td style="text-align:center;"> 12835 </td>
   <td style="text-align:center;"> 14915 </td>
   <td style="text-align:center;"> 14.40 </td>
   <td style="text-align:center;"> 28/12/2021 </td>
   <td style="text-align:center;"> 2eme </td>
   <td style="text-align:center;"> 1.97 </td>
   <td style="text-align:center;"> 24.97 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SIVC </td>
   <td style="text-align:left;"> AIR LIQUIDE CI </td>
   <td style="text-align:center;"> 1549 </td>
   <td style="text-align:right;"> 1255650 </td>
   <td style="text-align:center;"> 925 </td>
   <td style="text-align:center;"> 900 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffefe">860   </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -7.03
</span> </td>
   <td style="text-align:center;"> -3.91 </td>
   <td style="text-align:center;"> 925 </td>
   <td style="text-align:center;"> 3980 </td>
   <td style="text-align:center;"> 4620 </td>
   <td style="text-align:center;"> 63.00 </td>
   <td style="text-align:center;"> 29/09/2020 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 0.00 </td>
   <td style="text-align:center;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SLBC </td>
   <td style="text-align:left;"> SOLIBRA CI </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:center;"> 167700 </td>
   <td style="text-align:center;"> 160000 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #ffb6c1">167700</span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: green">
  <i class="glyphicon glyphicon-arrow-up"></i>
  4.81
</span> </td>
   <td style="text-align:center;"> 7.50 </td>
   <td style="text-align:center;"> 160000 </td>
   <td style="text-align:center;"> 115625 </td>
   <td style="text-align:center;"> 134375 </td>
   <td style="text-align:center;"> 2736.00 </td>
   <td style="text-align:center;"> 03/08/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 1.71 </td>
   <td style="text-align:center;"> 15.03 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SMBC </td>
   <td style="text-align:left;"> SMB CI </td>
   <td style="text-align:center;"> 144 </td>
   <td style="text-align:right;"> 1069980 </td>
   <td style="text-align:center;"> 7495 </td>
   <td style="text-align:center;"> 7495 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffbfc">7495  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: green">
  <i class="glyphicon glyphicon-arrow-up"></i>
  4.83
</span> </td>
   <td style="text-align:center;"> 8.62 </td>
   <td style="text-align:center;"> 7150 </td>
   <td style="text-align:center;"> 7770 </td>
   <td style="text-align:center;"> 9030 </td>
   <td style="text-align:center;"> 810.00 </td>
   <td style="text-align:center;"> 15/07/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 11.33 </td>
   <td style="text-align:center;"> 5.93 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> STBC </td>
   <td style="text-align:left;"> SITAB CI </td>
   <td style="text-align:center;"> 111 </td>
   <td style="text-align:right;"> 961900 </td>
   <td style="text-align:center;"> 5800 </td>
   <td style="text-align:center;"> 5800 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffcfc">5800  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: black">
  <i class="glyphicon glyphicon-"></i>
  0
</span> </td>
   <td style="text-align:center;"> -6.15 </td>
   <td style="text-align:center;"> 5800 </td>
   <td style="text-align:center;"> 72150 </td>
   <td style="text-align:center;"> 83850 </td>
   <td style="text-align:center;"> 445.12 </td>
   <td style="text-align:center;"> 22/07/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 7.52 </td>
   <td style="text-align:center;"> 12.19 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TTRC </td>
   <td style="text-align:left;"> TRITURAF CI </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:center;"> 490 </td>
   <td style="text-align:center;"> NC </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">NC    </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: black">
  <i class="glyphicon glyphicon-"></i>
  0
</span> </td>
   <td style="text-align:center;"> 0.00 </td>
   <td style="text-align:center;"> 490 </td>
   <td style="text-align:center;"> 455 </td>
   <td style="text-align:center;"> 525 </td>
   <td style="text-align:center;"> 1440.00 </td>
   <td style="text-align:center;"> 19/07/2019 </td>
   <td style="text-align:center;"> 2eme </td>
   <td style="text-align:center;"> 0.00 </td>
   <td style="text-align:center;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UNLC </td>
   <td style="text-align:left;"> UNILEVER CI </td>
   <td style="text-align:center;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:center;"> 4850 </td>
   <td style="text-align:center;"> NC </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">NC    </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: black">
  <i class="glyphicon glyphicon-"></i>
  0
</span> </td>
   <td style="text-align:center;"> -0.82 </td>
   <td style="text-align:center;"> 4850 </td>
   <td style="text-align:center;"> 7865 </td>
   <td style="text-align:center;"> 9135 </td>
   <td style="text-align:center;"> 1233.00 </td>
   <td style="text-align:center;"> 09/07/2020 </td>
   <td style="text-align:center;"> 2eme </td>
   <td style="text-align:center;"> 0.00 </td>
   <td style="text-align:center;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UNXC </td>
   <td style="text-align:left;"> UNIWAX CI </td>
   <td style="text-align:center;"> 808 </td>
   <td style="text-align:right;"> 1683980 </td>
   <td style="text-align:center;"> 2085 </td>
   <td style="text-align:center;"> 2085 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffefe">2085  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -0.24
</span> </td>
   <td style="text-align:center;"> 4.25 </td>
   <td style="text-align:center;"> 2090 </td>
   <td style="text-align:center;"> 3885 </td>
   <td style="text-align:center;"> 4515 </td>
   <td style="text-align:center;"> 18.00 </td>
   <td style="text-align:center;"> 16/08/2021 </td>
   <td style="text-align:center;"> 2eme </td>
   <td style="text-align:center;"> 0.86 </td>
   <td style="text-align:center;"> 117.28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TOTAL </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> 15644 </td>
   <td style="text-align:right;"> 17510660 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">      </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold">
  <i class></i>
  NA
</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PUBLIC SERVICES SECTOR </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:center;"> -6.94% </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">      </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold">
  <i class></i>
  NA
</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CIEC </td>
   <td style="text-align:left;"> CIE CI </td>
   <td style="text-align:center;"> 4192 </td>
   <td style="text-align:right;"> 8773320 </td>
   <td style="text-align:center;"> 2095 </td>
   <td style="text-align:center;"> 2100 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffefe">2095  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -0.24
</span> </td>
   <td style="text-align:center;"> 10.55 </td>
   <td style="text-align:center;"> 2100 </td>
   <td style="text-align:center;"> 1840 </td>
   <td style="text-align:center;"> 1695 </td>
   <td style="text-align:center;"> 153.16 </td>
   <td style="text-align:center;"> 25/07/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 7.96 </td>
   <td style="text-align:center;"> 7.27 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ONTBF </td>
   <td style="text-align:left;"> ONATEL BF </td>
   <td style="text-align:center;"> 1238 </td>
   <td style="text-align:right;"> 5221520 </td>
   <td style="text-align:center;"> 4240 </td>
   <td style="text-align:center;"> 4210 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffdfd">4240  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: green">
  <i class="glyphicon glyphicon-arrow-up"></i>
  0.71
</span> </td>
   <td style="text-align:center;"> 7.48 </td>
   <td style="text-align:center;"> 4210 </td>
   <td style="text-align:center;"> 6245 </td>
   <td style="text-align:center;"> 7255 </td>
   <td style="text-align:center;"> 399.56 </td>
   <td style="text-align:center;"> 01/06/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 9.49 </td>
   <td style="text-align:center;"> 9.22 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SDCC </td>
   <td style="text-align:left;"> SODECI </td>
   <td style="text-align:center;"> 1285 </td>
   <td style="text-align:right;"> 4897025 </td>
   <td style="text-align:center;"> 4050 </td>
   <td style="text-align:center;"> 4100 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffdfd">3750  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -7.41
</span> </td>
   <td style="text-align:center;"> -12.69 </td>
   <td style="text-align:center;"> 4050 </td>
   <td style="text-align:center;"> 39775 </td>
   <td style="text-align:center;"> 46225 </td>
   <td style="text-align:center;"> 337.50 </td>
   <td style="text-align:center;"> 27/08/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 8.33 </td>
   <td style="text-align:center;"> 8.46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SNTS </td>
   <td style="text-align:left;"> SONATEL SN </td>
   <td style="text-align:center;"> 17445 </td>
   <td style="text-align:right;"> 255870465 </td>
   <td style="text-align:center;"> 14650 </td>
   <td style="text-align:center;"> 14650 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fff8f9">14650 </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: black">
  <i class="glyphicon glyphicon-"></i>
  0
</span> </td>
   <td style="text-align:center;"> 4.83 </td>
   <td style="text-align:center;"> 14650 </td>
   <td style="text-align:center;"> 20305 </td>
   <td style="text-align:center;"> 23595 </td>
   <td style="text-align:center;"> 1225.00 </td>
   <td style="text-align:center;"> 21/05/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 8.36 </td>
   <td style="text-align:center;"> 7.28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TOTAL </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> 24160 </td>
   <td style="text-align:right;"> 274762330 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">      </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold">
  <i class></i>
  NA
</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FINANCE SECTOR </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:center;"> -16.09% </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">      </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold">
  <i class></i>
  NA
</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BICC </td>
   <td style="text-align:left;"> BICICI </td>
   <td style="text-align:center;"> 1275 </td>
   <td style="text-align:right;"> 7901650 </td>
   <td style="text-align:center;"> 6200 </td>
   <td style="text-align:center;"> 6200 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffcfc">6010  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -3.06
</span> </td>
   <td style="text-align:center;"> -18.78 </td>
   <td style="text-align:center;"> 6200 </td>
   <td style="text-align:center;"> 7865 </td>
   <td style="text-align:center;"> 6090 </td>
   <td style="text-align:center;"> 50.00 </td>
   <td style="text-align:center;"> 15/07/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 0.81 </td>
   <td style="text-align:center;"> 22.12 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAB </td>
   <td style="text-align:left;"> BOA BENIN </td>
   <td style="text-align:center;"> 3524 </td>
   <td style="text-align:right;"> 21132470 </td>
   <td style="text-align:center;"> 5995 </td>
   <td style="text-align:center;"> 5995 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffcfc">5995  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -0.08
</span> </td>
   <td style="text-align:center;"> 13.11 </td>
   <td style="text-align:center;"> 6000 </td>
   <td style="text-align:center;"> 6475 </td>
   <td style="text-align:center;"> 5100 </td>
   <td style="text-align:center;"> 436.00 </td>
   <td style="text-align:center;"> 20/05/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 7.27 </td>
   <td style="text-align:center;"> 9.14 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOABF </td>
   <td style="text-align:left;"> BOA BURKINA FASO </td>
   <td style="text-align:center;"> 307 </td>
   <td style="text-align:right;"> 1903400 </td>
   <td style="text-align:center;"> 6200 </td>
   <td style="text-align:center;"> 6195 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffcfc">6200  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: black">
  <i class="glyphicon glyphicon-"></i>
  0
</span> </td>
   <td style="text-align:center;"> 0.00 </td>
   <td style="text-align:center;"> 6200 </td>
   <td style="text-align:center;"> 6750 </td>
   <td style="text-align:center;"> 4900 </td>
   <td style="text-align:center;"> 370.00 </td>
   <td style="text-align:center;"> 03/05/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 5.97 </td>
   <td style="text-align:center;"> 7.75 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAC </td>
   <td style="text-align:left;"> BOA CI </td>
   <td style="text-align:center;"> 143 </td>
   <td style="text-align:right;"> 772200 </td>
   <td style="text-align:center;"> 5490 </td>
   <td style="text-align:center;"> 5490 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffcfd">5400  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -1.64
</span> </td>
   <td style="text-align:center;"> -7.77 </td>
   <td style="text-align:center;"> 5490 </td>
   <td style="text-align:center;"> 3885 </td>
   <td style="text-align:center;"> 4495 </td>
   <td style="text-align:center;"> 315.00 </td>
   <td style="text-align:center;"> 12/05/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 5.74 </td>
   <td style="text-align:center;"> 7.72 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAM </td>
   <td style="text-align:left;"> BOA MALI </td>
   <td style="text-align:center;"> 342 </td>
   <td style="text-align:right;"> 481920 </td>
   <td style="text-align:center;"> 1430 </td>
   <td style="text-align:center;"> 1400 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffefe">1450  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: green">
  <i class="glyphicon glyphicon-arrow-up"></i>
  1.4
</span> </td>
   <td style="text-align:center;"> -2.36 </td>
   <td style="text-align:center;"> 1430 </td>
   <td style="text-align:center;"> 21645 </td>
   <td style="text-align:center;"> 3060 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 0.00 </td>
   <td style="text-align:center;"> 49.53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAN </td>
   <td style="text-align:left;"> BOA NIGER </td>
   <td style="text-align:center;"> 571 </td>
   <td style="text-align:right;"> 3399875 </td>
   <td style="text-align:center;"> 6015 </td>
   <td style="text-align:center;"> 6000 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffcfc">6015  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: green">
  <i class="glyphicon glyphicon-arrow-up"></i>
  0.25
</span> </td>
   <td style="text-align:center;"> 17.94 </td>
   <td style="text-align:center;"> 6000 </td>
   <td style="text-align:center;"> 3610 </td>
   <td style="text-align:center;"> 4600 </td>
   <td style="text-align:center;"> 429.66 </td>
   <td style="text-align:center;"> 06/05/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 7.16 </td>
   <td style="text-align:center;"> 10.51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAS </td>
   <td style="text-align:left;"> BOA SENEGAL </td>
   <td style="text-align:center;"> 867 </td>
   <td style="text-align:right;"> 2145825 </td>
   <td style="text-align:center;"> 2475 </td>
   <td style="text-align:center;"> 2475 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffdfe">2475  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: green">
  <i class="glyphicon glyphicon-arrow-up"></i>
  0.2
</span> </td>
   <td style="text-align:center;"> 5.32 </td>
   <td style="text-align:center;"> 2470 </td>
   <td style="text-align:center;"> 2270 </td>
   <td style="text-align:center;"> 2495 </td>
   <td style="text-align:center;"> 161.01 </td>
   <td style="text-align:center;"> 06/07/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 6.52 </td>
   <td style="text-align:center;"> 7.73 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CBIBF </td>
   <td style="text-align:left;"> CORIS BANK INTERNATIONAL BF </td>
   <td style="text-align:center;"> 282 </td>
   <td style="text-align:right;"> 2909300 </td>
   <td style="text-align:center;"> 10800 </td>
   <td style="text-align:center;"> 10250 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffafb">10800 </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: black">
  <i class="glyphicon glyphicon-"></i>
  0
</span> </td>
   <td style="text-align:center;"> 2.86 </td>
   <td style="text-align:center;"> 10800 </td>
   <td style="text-align:center;"> 8605 </td>
   <td style="text-align:center;"> 2495 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 3.76 </td>
   <td style="text-align:center;"> 10.05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ECOC </td>
   <td style="text-align:left;"> ECOBANK CI </td>
   <td style="text-align:center;"> 7784 </td>
   <td style="text-align:right;"> 33865535 </td>
   <td style="text-align:center;"> 4500 </td>
   <td style="text-align:center;"> 4500 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffdfd">4500  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -2.07
</span> </td>
   <td style="text-align:center;"> -5.96 </td>
   <td style="text-align:center;"> 4595 </td>
   <td style="text-align:center;"> 14800 </td>
   <td style="text-align:center;"> 189 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 6.40 </td>
   <td style="text-align:center;"> 8.43 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ETIT </td>
   <td style="text-align:left;"> ECOBANK TRANSNATIONAL INCORPORATED (ETI TG) </td>
   <td style="text-align:center;"> 248019 </td>
   <td style="text-align:right;"> 5129708 </td>
   <td style="text-align:center;"> 20 </td>
   <td style="text-align:center;"> 20 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #ffffff">20    </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: black">
  <i class="glyphicon glyphicon-"></i>
  0
</span> </td>
   <td style="text-align:center;"> 11.11 </td>
   <td style="text-align:center;"> 20 </td>
   <td style="text-align:center;"> 23 </td>
   <td style="text-align:center;"> 22 </td>
   <td style="text-align:center;"> 1.21 </td>
   <td style="text-align:center;"> 28/04/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 0.00 </td>
   <td style="text-align:center;"> 1.87 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NSBC </td>
   <td style="text-align:left;"> NSIA BANQUE CI </td>
   <td style="text-align:center;"> 335 </td>
   <td style="text-align:right;"> 1926200 </td>
   <td style="text-align:center;"> 5750 </td>
   <td style="text-align:center;"> 5750 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffcfc">5750  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: black">
  <i class="glyphicon glyphicon-"></i>
  0
</span> </td>
   <td style="text-align:center;"> -7.03 </td>
   <td style="text-align:center;"> 5750 </td>
   <td style="text-align:center;"> 14800 </td>
   <td style="text-align:center;"> 189 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 1.35 </td>
   <td style="text-align:center;"> 19.75 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ORGT </td>
   <td style="text-align:left;"> ORAGROUP TG </td>
   <td style="text-align:center;"> 982 </td>
   <td style="text-align:right;"> 3829065 </td>
   <td style="text-align:center;"> 3900 </td>
   <td style="text-align:center;"> 3900 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffdfd">3900  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -4.06
</span> </td>
   <td style="text-align:center;"> -6.92 </td>
   <td style="text-align:center;"> 4065 </td>
   <td style="text-align:center;"> 14800 </td>
   <td style="text-align:center;"> 189 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 1.46 </td>
   <td style="text-align:center;"> 29.89 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SAFC </td>
   <td style="text-align:left;"> SAFCA CI </td>
   <td style="text-align:center;"> 132 </td>
   <td style="text-align:right;"> 131340 </td>
   <td style="text-align:center;"> 1160 </td>
   <td style="text-align:center;"> 1160 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffefe">1075  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -7.33
</span> </td>
   <td style="text-align:center;"> 26.47 </td>
   <td style="text-align:center;"> 1160 </td>
   <td style="text-align:center;"> 5740 </td>
   <td style="text-align:center;"> 5740 </td>
   <td style="text-align:center;"> 23.04 </td>
   <td style="text-align:center;"> 29/07/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 0.00 </td>
   <td style="text-align:center;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SGBC </td>
   <td style="text-align:left;"> SGCI </td>
   <td style="text-align:center;"> 534 </td>
   <td style="text-align:right;"> 6885855 </td>
   <td style="text-align:center;"> 6885855 </td>
   <td style="text-align:center;"> 13105 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fff9fa">12995 </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -0.84
</span> </td>
   <td style="text-align:center;"> 22.65 </td>
   <td style="text-align:center;"> 13105 </td>
   <td style="text-align:center;"> 11990 </td>
   <td style="text-align:center;"> 11840 </td>
   <td style="text-align:center;"> 368.30 </td>
   <td style="text-align:center;"> 30/06/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 2.81 </td>
   <td style="text-align:center;"> 6.05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SIBC </td>
   <td style="text-align:left;"> SIB CI </td>
   <td style="text-align:center;"> 3339 </td>
   <td style="text-align:right;"> 13466125 </td>
   <td style="text-align:center;"> 3955 </td>
   <td style="text-align:center;"> 3955 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffdfd">4000  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: green">
  <i class="glyphicon glyphicon-arrow-up"></i>
  1.14
</span> </td>
   <td style="text-align:center;"> 0.38 </td>
   <td style="text-align:center;"> 3955 </td>
   <td style="text-align:center;"> 14800 </td>
   <td style="text-align:center;"> 189 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 9.10 </td>
   <td style="text-align:center;"> 6.53 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TOTAL </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> 268436 </td>
   <td style="text-align:right;"> 105880468 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">      </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold">
  <i class></i>
  NA
</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TRANSPORT SECTOR </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:center;"> 0.00% </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">      </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold">
  <i class></i>
  NA
</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SDSC </td>
   <td style="text-align:left;"> BOLLORE TRANSPORT & LOGISTICS CI </td>
   <td style="text-align:center;"> 45 </td>
   <td style="text-align:right;"> 113000 </td>
   <td style="text-align:center;"> 2500 </td>
   <td style="text-align:center;"> 2400 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffdfe">2500  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: black">
  <i class="glyphicon glyphicon-"></i>
  0
</span> </td>
   <td style="text-align:center;"> -2.72 </td>
   <td style="text-align:center;"> 2550 </td>
   <td style="text-align:center;"> 3935 </td>
   <td style="text-align:center;"> 3695 </td>
   <td style="text-align:center;"> 100.00 </td>
   <td style="text-align:center;"> 11/08/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 4.00 </td>
   <td style="text-align:center;"> 10.11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SVOC </td>
   <td style="text-align:left;"> MOVIS CI </td>
   <td style="text-align:center;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:center;"> 2395 </td>
   <td style="text-align:center;"> NC </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">NC    </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: black">
  <i class="glyphicon glyphicon-"></i>
  0
</span> </td>
   <td style="text-align:center;"> 0.00 </td>
   <td style="text-align:center;"> 2395 </td>
   <td style="text-align:center;"> 2965 </td>
   <td style="text-align:center;"> 2900 </td>
   <td style="text-align:center;"> 270.00 </td>
   <td style="text-align:center;"> 23/07/2021 </td>
   <td style="text-align:center;"> 2eme </td>
   <td style="text-align:center;"> 0.00 </td>
   <td style="text-align:center;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TOTAL </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> 45 </td>
   <td style="text-align:right;"> 113000 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">      </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold">
  <i class></i>
  NA
</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AGRICULTURE SECTOR </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:center;"> -12.42% </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">      </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold">
  <i class></i>
  NA
</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PALC </td>
   <td style="text-align:left;"> PALM CÔTE D'IVOIRE </td>
   <td style="text-align:center;"> 1310 </td>
   <td style="text-align:right;"> 11723360 </td>
   <td style="text-align:center;"> 9420 </td>
   <td style="text-align:center;"> 9295 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffbfb">8900  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -0.16
</span> </td>
   <td style="text-align:center;"> 34.76 </td>
   <td style="text-align:center;"> 9435 </td>
   <td style="text-align:center;"> 5250 </td>
   <td style="text-align:center;"> 4800 </td>
   <td style="text-align:center;"> 1236.34 </td>
   <td style="text-align:center;"> 31/08/2021 </td>
   <td style="text-align:center;"> 2eme </td>
   <td style="text-align:center;"> 1.09 </td>
   <td style="text-align:center;"> 41.42 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SCRC </td>
   <td style="text-align:left;"> SUCRIVOIRE CI </td>
   <td style="text-align:center;"> 11629 </td>
   <td style="text-align:right;"> 11117870 </td>
   <td style="text-align:center;"> 1015 </td>
   <td style="text-align:center;"> 1075 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffefe">1015  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -7.31
</span> </td>
   <td style="text-align:center;"> 5.73 </td>
   <td style="text-align:center;"> 1095 </td>
   <td style="text-align:center;"> 735 </td>
   <td style="text-align:center;"> 1005 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 3.70 </td>
   <td style="text-align:center;"> 12.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SICC </td>
   <td style="text-align:left;"> SICOR CI </td>
   <td style="text-align:center;"> 4 </td>
   <td style="text-align:right;"> 21500 </td>
   <td style="text-align:center;"> 5320 </td>
   <td style="text-align:center;"> 5500 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffcfd">5000  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -6.02
</span> </td>
   <td style="text-align:center;"> -2.34 </td>
   <td style="text-align:center;"> 5320 </td>
   <td style="text-align:center;"> 3655 </td>
   <td style="text-align:center;"> 3530 </td>
   <td style="text-align:center;"> 1919.00 </td>
   <td style="text-align:center;"> 25/09/2020 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 0.00 </td>
   <td style="text-align:center;"> 3.23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SOGC </td>
   <td style="text-align:left;"> SOGB CI </td>
   <td style="text-align:center;"> 517 </td>
   <td style="text-align:right;"> 2810115 </td>
   <td style="text-align:center;"> 5500 </td>
   <td style="text-align:center;"> 5495 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffcfc">5500  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: green">
  <i class="glyphicon glyphicon-arrow-up"></i>
  0.09
</span> </td>
   <td style="text-align:center;"> 10.00 </td>
   <td style="text-align:center;"> 5495 </td>
   <td style="text-align:center;"> 3795 </td>
   <td style="text-align:center;"> 2900 </td>
   <td style="text-align:center;"> 541.81 </td>
   <td style="text-align:center;"> 21/07/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 4.55 </td>
   <td style="text-align:center;"> 15.51 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPHC </td>
   <td style="text-align:left;"> SAPH CI </td>
   <td style="text-align:center;"> 1169 </td>
   <td style="text-align:right;"> 5962125 </td>
   <td style="text-align:center;"> 5150 </td>
   <td style="text-align:center;"> 5145 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffcfd">5150  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: green">
  <i class="glyphicon glyphicon-arrow-up"></i>
  0.98
</span> </td>
   <td style="text-align:center;"> -0.87 </td>
   <td style="text-align:center;"> 5100 </td>
   <td style="text-align:center;"> 2740 </td>
   <td style="text-align:center;"> 2800 </td>
   <td style="text-align:center;"> 132.30 </td>
   <td style="text-align:center;"> 24/08/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 2.59 </td>
   <td style="text-align:center;"> 17.46 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TOTAL </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> 14629 </td>
   <td style="text-align:right;"> 31634970 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">      </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold">
  <i class></i>
  NA
</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> DISTRIBUTION SECTOR </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:center;"> -1.84% </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">      </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold">
  <i class></i>
  NA
</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ABJC </td>
   <td style="text-align:left;"> SERVAIR ABIDJAN CI </td>
   <td style="text-align:center;"> 1000 </td>
   <td style="text-align:right;"> 1643825 </td>
   <td style="text-align:center;"> 1650 </td>
   <td style="text-align:center;"> 1640 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffefe">1650  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -5.44
</span> </td>
   <td style="text-align:center;"> -5.71 </td>
   <td style="text-align:center;"> 1745 </td>
   <td style="text-align:center;"> 1148 </td>
   <td style="text-align:center;"> 1005 </td>
   <td style="text-align:center;"> 164.96 </td>
   <td style="text-align:center;"> 30/09/2020 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 0.00 </td>
   <td style="text-align:center;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNBC </td>
   <td style="text-align:left;"> BERNABE CI </td>
   <td style="text-align:center;"> 1088 </td>
   <td style="text-align:right;"> 2615160 </td>
   <td style="text-align:center;"> 2395 </td>
   <td style="text-align:center;"> 2395 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffdfe">2500  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: green">
  <i class="glyphicon glyphicon-arrow-up"></i>
  4.38
</span> </td>
   <td style="text-align:center;"> 14.94 </td>
   <td style="text-align:center;"> 2395 </td>
   <td style="text-align:center;"> 576 </td>
   <td style="text-align:center;"> 1200 </td>
   <td style="text-align:center;"> 45.00 </td>
   <td style="text-align:center;"> 30/09/2019 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 0.00 </td>
   <td style="text-align:center;"> 25.18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CFAC </td>
   <td style="text-align:left;"> CFAO MOTORS CI </td>
   <td style="text-align:center;"> 198 </td>
   <td style="text-align:right;"> 232590 </td>
   <td style="text-align:center;"> 1160 </td>
   <td style="text-align:center;"> 1160 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffefe">1200  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: black">
  <i class="glyphicon glyphicon-"></i>
  0
</span> </td>
   <td style="text-align:center;"> -2.52 </td>
   <td style="text-align:center;"> 1160 </td>
   <td style="text-align:center;"> 605 </td>
   <td style="text-align:center;"> 430 </td>
   <td style="text-align:center;"> 22.15 </td>
   <td style="text-align:center;"> 15/07/2021 </td>
   <td style="text-align:center;"> 2eme </td>
   <td style="text-align:center;"> 1.91 </td>
   <td style="text-align:center;"> 55.67 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PRSC </td>
   <td style="text-align:left;"> TRACTAFRIC MOTORS CI </td>
   <td style="text-align:center;"> 252 </td>
   <td style="text-align:right;"> 1158140 </td>
   <td style="text-align:center;"> 4600 </td>
   <td style="text-align:center;"> 4600 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffdfd">4600  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: black">
  <i class="glyphicon glyphicon-"></i>
  0
</span> </td>
   <td style="text-align:center;"> 9.52 </td>
   <td style="text-align:center;"> 4600 </td>
   <td style="text-align:center;"> 10 </td>
   <td style="text-align:center;"> 2800 </td>
   <td style="text-align:center;"> 162.90 </td>
   <td style="text-align:center;"> 02/09/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 3.54 </td>
   <td style="text-align:center;"> 25.28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SHEC </td>
   <td style="text-align:left;"> VIVO ENERGY CI </td>
   <td style="text-align:center;"> 158 </td>
   <td style="text-align:right;"> 147150 </td>
   <td style="text-align:center;"> 925 </td>
   <td style="text-align:center;"> 925 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffefe">925   </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -0.54
</span> </td>
   <td style="text-align:center;"> 7.56 </td>
   <td style="text-align:center;"> 930 </td>
   <td style="text-align:center;"> 1172 </td>
   <td style="text-align:center;"> 585 </td>
   <td style="text-align:center;"> 63.90 </td>
   <td style="text-align:center;"> 26/11/2020 </td>
   <td style="text-align:center;"> 2eme </td>
   <td style="text-align:center;"> 6.80 </td>
   <td style="text-align:center;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TTLC </td>
   <td style="text-align:left;"> TOTAL CI </td>
   <td style="text-align:center;"> 8600 </td>
   <td style="text-align:right;"> 18586860 </td>
   <td style="text-align:center;"> 2160 </td>
   <td style="text-align:center;"> 2200 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffefe">2160  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: black">
  <i class="glyphicon glyphicon-"></i>
  0
</span> </td>
   <td style="text-align:center;"> 2.86 </td>
   <td style="text-align:center;"> 2160 </td>
   <td style="text-align:center;"> 1961 </td>
   <td style="text-align:center;"> 1475 </td>
   <td style="text-align:center;"> 109.31 </td>
   <td style="text-align:center;"> 27/09/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 5.06 </td>
   <td style="text-align:center;"> 17.78 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TTLS </td>
   <td style="text-align:left;"> TOTAL SN </td>
   <td style="text-align:center;"> 1648 </td>
   <td style="text-align:right;"> 3486710 </td>
   <td style="text-align:center;"> 2095 </td>
   <td style="text-align:center;"> 2100 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffefe">2095  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -0.24
</span> </td>
   <td style="text-align:center;"> 6.08 </td>
   <td style="text-align:center;"> 2100 </td>
   <td style="text-align:center;"> 1634 </td>
   <td style="text-align:center;"> 1445 </td>
   <td style="text-align:center;"> 223.60 </td>
   <td style="text-align:center;"> 30/09/2021 </td>
   <td style="text-align:center;"> 1er </td>
   <td style="text-align:center;"> 10.65 </td>
   <td style="text-align:center;"> 11.28 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TOTAL </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> 12944 </td>
   <td style="text-align:right;"> 27870435 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">      </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold">
  <i class></i>
  NA
</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> OTHER SECTOR </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:center;"> -7.48% </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">      </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold">
  <i class></i>
  NA
</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> STAC </td>
   <td style="text-align:left;"> SETAO CI </td>
   <td style="text-align:center;"> 6517 </td>
   <td style="text-align:right;"> 10304135 </td>
   <td style="text-align:center;"> 1805 </td>
   <td style="text-align:center;"> 1670 </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px; background-color: #fffefe">1670  </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold; color: red">
  <i class="glyphicon glyphicon-arrow-down"></i>
  -7.48
</span> </td>
   <td style="text-align:center;"> 147.26 </td>
   <td style="text-align:center;"> 1805 </td>
   <td style="text-align:center;"> 281 </td>
   <td style="text-align:center;"> 565 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> 2eme </td>
   <td style="text-align:center;"> 3.66 </td>
   <td style="text-align:center;"> 10.45 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TOTAL </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> 6517 </td>
   <td style="text-align:right;"> 10304135 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">      </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold">
  <i class></i>
  NA
</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TOTAL - Equities market </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> 342375 </td>
   <td style="text-align:right;"> 468075998 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> <span style="display: block; padding: 0 4px; border-radius: 4px">      </span> </td>
   <td style="text-align:left;"> <span style="font-weight: bold">
  <i class></i>
  NA
</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
</tbody>
</table>

 
## The **BRVM_plot(".company",  "up.col", "down.col")** function:
 This function will get Ticker(s) data and then plot it.

* .company : is the Ticker(s) name(s)
* from : A quoted start date, ie. "2020-01-01" or "2020/01/01". The date must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD".
* to : A quoted end date, ie. "2022-01-31" or "2022/01/31". The date must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD"
* up.col	 : is the up color
* down.col : is down color


```r
library(highcharter)
library(lubridate)
library(rlang)
library(httr2)
library(dplyr)
library(stringr)
library(xts)

BRVM_plot("BICC") # The default colors for the up and down are green and red respectively.
#> [1] "BICC"
```

```{=html}
<div class="highchart html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-3ccedbc211542c365f6b" style="width:100%;height:960px;"></div>
<script type="application/json" data-for="htmlwidget-3ccedbc211542c365f6b">{"x":{"hc_opts":{"chart":{"reflow":true},"title":{"text":"BICC chart : from 2022-03-25 to 2023-03-24","style":{"fontWeight":"bold","fontSize":"25px"},"align":"center"},"yAxis":[{"title":{"style":{"color":"#333333","fontSize":"20px","fontFamily":"Erica One"},"text":"Price"},"top":"-10%","height":"90%","opposite":false},{"title":{"style":{"color":"gray","fontSize":"20px","fontFamily":"Erica One"},"text":"Volume"},"top":"80%","height":"20%"}],"credits":{"enabled":false},"exporting":{"enabled":true,"filename":"BICC chart : from 2022-03-25 to 2023-03-24"},"boost":{"enabled":false},"plotOptions":{"series":{"label":{"enabled":false},"turboThreshold":0},"treemap":{"layoutAlgorithm":"squarified"}},"series":[{"data":[[1648166400000,5810,6000,5810,6000],[1648425600000,5815,6400,5700,6400],[1648512000000,6390,6390,6070,6070],[1648598400000,6395,6400,6390,6390],[1648684800000,6390,6395,6390,6395],[1648771200000,6300,6300,6000,6000],[1649030400000,5900,5900,5700,5900],[1649116800000,6000,6340,5850,6340],[1649203200000,6340,6340,6335,6335],[1649289600000,6330,6340,5880,6340],[1649376000000,6340,6340,6250,6250],[1649635200000,6000,6000,6000,6000],[1649721600000,6000,6000,5820,6000],[1649808000000,6000,6295,6000,6295],[1649894400000,6250,6295,6250,6295],[1649980800000,6285,6350,6000,6350],[1650326400000,6200,6200,6200,6200],[1650412800000,6200,6200,5955,5955],[1650499200000,6335,6335,6300,6300],[1650585600000,6250,6300,6000,6000],[1650844800000,6000,6300,6000,6300],[1650931200000,6300,6300,6300,6300],[1651190400000,6200,6200,6200,6200],[1651536000000,6000,6300,6000,6000],[1651622400000,6000,6280,6000,6280],[1651708800000,6145,6145,6145,6145],[1651795200000,6285,6285,6285,6285],[1652054400000,6010,6285,6010,6285],[1652140800000,6285,6285,6285,6285],[1652227200000,6245,6285,6245,6285],[1652313600000,6000,6000,6000,6000],[1652400000000,6245,6245,6240,6240],[1652659200000,6100,6100,6000,6000],[1652745600000,6000,6000,5550,5550],[1652832000000,5560,5560,5560,5560],[1652918400000,5975,5975,5975,5975],[1653004800000,6000,6000,6000,6000],[1653264000000,5600,6200,5600,6200],[1653436800000,6190,6195,6190,6195],[1653609600000,6000,6195,6000,6195],[1653868800000,6010,6010,6010,6010],[1653955200000,6010,6010,6010,6010],[1654041600000,6170,6170,6170,6170],[1654128000000,6170,6170,6170,6170],[1654214400000,6000,6000,6000,6000],[1654560000000,6000,6000,6000,6000],[1654646400000,6000,6000,6000,6000],[1654732800000,6000,6000,6000,6000],[1655078400000,5995,6195,5800,6150],[1655164800000,6150,6200,6145,6200],[1655251200000,6195,6200,6150,6200],[1655337600000,6190,6200,6190,6200],[1655424000000,6195,6200,6195,6200],[1655683200000,6200,6200,6200,6200],[1655769600000,5900,6250,5900,6250],[1656288000000,6250,6250,6250,6250],[1656374400000,6200,6250,6200,6250],[1656460800000,6200,6200,6200,6200],[1656547200000,6250,6295,6200,6295],[1656633600000,6295,6295,6295,6295],[1656892800000,6300,6300,6300,6300],[1656979200000,6300,6740,6300,6740],[1657065600000,6300,6735,6300,6735],[1657152000000,6735,6735,6735,6735],[1657238400000,6595,6720,6595,6595],[1657497600000,6600,6600,6560,6560],[1657584000000,6600,6600,6500,6500],[1657670400000,6300,6300,6300,6300],[1657756800000,6300,6300,6250,6250],[1657843200000,6250,6715,6250,6715],[1658102400000,6800,6800,6300,6305],[1658188800000,6300,6430,6300,6430],[1658361600000,6440,6440,6000,6000],[1658448000000,6000,6400,6000,6400],[1658880000000,6400,6400,6400,6400],[1658966400000,6200,6200,6100,6100],[1659312000000,6400,6430,6390,6430],[1659398400000,6430,6430,6430,6430],[1659484800000,6500,6600,6500,6600],[1659571200000,6550,6550,6550,6550],[1659657600000,6550,6900,6400,6900],[1660003200000,6900,6900,6400,6800],[1660089600000,6400,6800,6400,6400],[1660176000000,6800,6800,6405,6405],[1660262400000,6405,6405,6405,6405],[1660608000000,6405,6405,6405,6405],[1660694400000,6400,6400,6400,6400],[1660780800000,6700,6700,6700,6700],[1660867200000,6695,6695,6695,6695],[1661126400000,6695,6900,6695,6900],[1661212800000,6875,6875,6875,6875],[1661299200000,6800,6900,6800,6900],[1661472000000,6895,6895,6895,6895],[1661817600000,6800,6800,6800,6800],[1661904000000,6790,6890,6790,6890],[1661990400000,6790,6790,6790,6790],[1662076800000,6500,6500,6500,6500],[1662336000000,6790,6790,6790,6790],[1662422400000,6550,6750,6550,6550],[1662508800000,6550,6550,6500,6500],[1662595200000,6550,6600,6550,6580],[1662681600000,6750,6750,6750,6750],[1662940800000,6700,6700,6700,6700],[1663027200000,6690,6700,6690,6700],[1663200000000,6690,6690,6690,6690],[1663286400000,6690,6690,6690,6690],[1663545600000,6600,6600,6600,6600],[1663632000000,6605,6605,6590,6590],[1663718400000,6590,6590,6590,6590],[1663804800000,6590,6590,6500,6500],[1663891200000,6500,6500,6500,6500],[1664496000000,6695,6695,6505,6505],[1664755200000,6900,6900,6550,6550],[1664928000000,6550,6550,6550,6550],[1665014400000,6550,6600,6550,6600],[1665100800000,6700,6700,6600,6600],[1665360000000,6600,6600,6600,6600],[1665446400000,6600,6700,6600,6600],[1665532800000,6600,6600,6600,6600],[1665619200000,6600,6600,6500,6500],[1665705600000,6500,6600,6500,6600],[1665964800000,6500,6500,6500,6500],[1666051200000,6015,6370,6015,6370],[1666137600000,6400,6400,6400,6400],[1666224000000,6600,6600,6550,6550],[1666310400000,6550,6600,6500,6500],[1666656000000,6700,6700,6600,6600],[1666742400000,6600,6600,6600,6600],[1666828800000,6550,6550,6505,6505],[1666915200000,6500,6500,6500,6500],[1667174400000,6400,6400,6400,6400],[1667347200000,5925,6400,5925,6400],[1667433600000,6400,6400,6400,6400],[1667520000000,6400,6400,6400,6400],[1667779200000,6400,6400,6400,6400],[1667865600000,6500,6500,6500,6500],[1668038400000,6405,6405,6400,6400],[1668556800000,5920,6400,5920,6395],[1668643200000,6385,6390,6380,6390],[1668988800000,6390,6390,6390,6390],[1669075200000,6390,6390,6390,6390],[1669161600000,6200,6385,5915,6385],[1669248000000,6385,6390,6385,6390],[1669593600000,6380,6390,6380,6390],[1669680000000,6385,6385,6385,6385],[1670198400000,5910,6380,5910,6380],[1670544000000,5905,6600,5905,6600],[1670803200000,7000,7000,7000,7000],[1670889600000,6945,6950,6945,6950],[1670976000000,6430,6945,6430,6945],[1671148800000,6500,6995,6500,6995],[1671408000000,6950,6950,6950,6950],[1671494400000,6890,6990,6890,6990],[1671667200000,6975,6975,6975,6975],[1671753600000,6975,6975,6975,6975],[1672099200000,6550,6980,6550,6980],[1672185600000,6900,6980,6900,6980],[1672272000000,6900,6900,6900,6900],[1672358400000,6500,6850,6500,6850],[1672704000000,6840,6840,6840,6840],[1672790400000,6330,6330,6330,6330],[1672876800000,6330,6330,6330,6330],[1672963200000,6700,6700,6700,6700],[1673308800000,6330,6330,6330,6330],[1673395200000,6330,6330,6330,6330],[1673481600000,6330,6330,6330,6330],[1673568000000,6325,6325,6325,6325],[1673827200000,6325,6325,6295,6295],[1673913600000,6295,6300,6295,6300],[1674000000000,6200,6200,6200,6200],[1674086400000,6150,6150,6150,6150],[1674172800000,6100,6100,6100,6100],[1674432000000,6050,6050,6050,6050],[1674518400000,6000,6000,6000,6000],[1674604800000,6000,6000,6000,6000],[1674691200000,6000,6000,6000,6000],[1674777600000,5995,6000,5995,6000],[1675123200000,6000,6000,6000,6000],[1675209600000,6000,6000,6000,6000],[1675296000000,6000,6000,6000,6000],[1675382400000,6000,6000,6000,6000],[1675641600000,6000,6000,6000,6000],[1675728000000,6000,6000,5995,5995],[1675900800000,5895,5900,5895,5900],[1675987200000,5900,5900,5900,5900],[1676246400000,5785,5785,5785,5785],[1676332800000,5790,6150,5790,6150],[1676419200000,6150,6500,6150,6500],[1676592000000,6500,6500,6500,6500],[1676851200000,6400,6400,6400,6400],[1676937600000,6400,6400,6330,6330],[1677024000000,6330,6330,6330,6330],[1677110400000,6390,6390,6390,6390],[1677196800000,6330,6390,6330,6390],[1677456000000,6390,6390,6390,6390],[1677542400000,6390,6390,6390,6390],[1677628800000,6390,6495,6390,6495],[1677715200000,6350,6445,6350,6445],[1678060800000,6400,6440,6400,6440],[1678147200000,6400,6400,6400,6400],[1678233600000,6400,6400,6400,6400],[1678406400000,6200,6400,6200,6400],[1678665600000,6400,6400,6400,6400],[1678752000000,6440,6440,6440,6440],[1678838400000,6400,6435,6400,6435],[1678924800000,6440,6495,6440,6495],[1679011200000,6400,6495,6400,6495],[1679270400000,6440,6440,6440,6440],[1679356800000,6440,6440,6440,6440],[1679443200000,6410,6410,6410,6410],[1679529600000,6400,6400,6300,6300],[1679616000000,6410,6410,6300,6300]],"name":"Prices","type":"candlestick","name.1":"Prices","yAxis":0,"showInLegend":false,"upColor":"darkgreen","color":"red"},{"group":"down","data":[{"Date":"2022-03-29","Volume":59,"direction":"down","x":1648512000000,"y":59},{"Date":"2022-03-31","Volume":10,"direction":"down","x":1648684800000,"y":10},{"Date":"2022-04-05","Volume":40,"direction":"down","x":1649116800000,"y":40},{"Date":"2022-04-08","Volume":2105,"direction":"down","x":1649376000000,"y":2105},{"Date":"2022-04-12","Volume":365,"direction":"down","x":1649721600000,"y":365},{"Date":"2022-04-14","Volume":495,"direction":"down","x":1649894400000,"y":495},{"Date":"2022-04-19","Volume":20,"direction":"down","x":1650326400000,"y":20},{"Date":"2022-04-26","Volume":27,"direction":"down","x":1650931200000,"y":27},{"Date":"2022-05-05","Volume":5,"direction":"down","x":1651708800000,"y":5},{"Date":"2022-05-10","Volume":3,"direction":"down","x":1652140800000,"y":3},{"Date":"2022-05-13","Volume":42,"direction":"down","x":1652400000000,"y":42},{"Date":"2022-05-17","Volume":498,"direction":"down","x":1652745600000,"y":498},{"Date":"2022-05-18","Volume":10,"direction":"down","x":1652832000000,"y":10},{"Date":"2022-05-19","Volume":1,"direction":"down","x":1652918400000,"y":1},{"Date":"2022-05-23","Volume":213,"direction":"down","x":1653264000000,"y":213},{"Date":"2022-05-25","Volume":100,"direction":"down","x":1653436800000,"y":100},{"Date":"2022-05-30","Volume":50,"direction":"down","x":1653868800000,"y":50},{"Date":"2022-05-31","Volume":20,"direction":"down","x":1653955200000,"y":20},{"Date":"2022-06-03","Volume":11,"direction":"down","x":1654214400000,"y":11},{"Date":"2022-06-08","Volume":37,"direction":"down","x":1654646400000,"y":37},{"Date":"2022-06-16","Volume":501,"direction":"down","x":1655337600000,"y":501},{"Date":"2022-06-20","Volume":276,"direction":"down","x":1655683200000,"y":276},{"Date":"2022-06-21","Volume":152,"direction":"down","x":1655769600000,"y":152},{"Date":"2022-06-27","Volume":105,"direction":"down","x":1656288000000,"y":105},{"Date":"2022-06-29","Volume":100,"direction":"down","x":1656460800000,"y":100},{"Date":"2022-07-01","Volume":6,"direction":"down","x":1656633600000,"y":6},{"Date":"2022-07-06","Volume":31,"direction":"down","x":1657065600000,"y":31},{"Date":"2022-07-07","Volume":6,"direction":"down","x":1657152000000,"y":6},{"Date":"2022-07-11","Volume":266,"direction":"down","x":1657497600000,"y":266},{"Date":"2022-07-12","Volume":67,"direction":"down","x":1657584000000,"y":67},{"Date":"2022-07-14","Volume":38,"direction":"down","x":1657756800000,"y":38},{"Date":"2022-07-18","Volume":69,"direction":"down","x":1658102400000,"y":69},{"Date":"2022-07-21","Volume":90,"direction":"down","x":1658361600000,"y":90},{"Date":"2022-07-27","Volume":1,"direction":"down","x":1658880000000,"y":1},{"Date":"2022-08-02","Volume":868,"direction":"down","x":1659398400000,"y":868},{"Date":"2022-08-03","Volume":26,"direction":"down","x":1659484800000,"y":26},{"Date":"2022-08-04","Volume":14,"direction":"down","x":1659571200000,"y":14},{"Date":"2022-08-09","Volume":146,"direction":"down","x":1660003200000,"y":146},{"Date":"2022-08-10","Volume":65,"direction":"down","x":1660089600000,"y":65},{"Date":"2022-08-11","Volume":31,"direction":"down","x":1660176000000,"y":31},{"Date":"2022-08-12","Volume":2,"direction":"down","x":1660262400000,"y":2},{"Date":"2022-08-18","Volume":5,"direction":"down","x":1660780800000,"y":5},{"Date":"2022-08-23","Volume":18,"direction":"down","x":1661212800000,"y":18},{"Date":"2022-08-26","Volume":15,"direction":"down","x":1661472000000,"y":15},{"Date":"2022-08-30","Volume":5,"direction":"down","x":1661817600000,"y":5},{"Date":"2022-09-01","Volume":50,"direction":"down","x":1661990400000,"y":50},{"Date":"2022-09-06","Volume":168,"direction":"down","x":1662422400000,"y":168},{"Date":"2022-09-08","Volume":142,"direction":"down","x":1662595200000,"y":142},{"Date":"2022-09-09","Volume":12,"direction":"down","x":1662681600000,"y":12},{"Date":"2022-09-15","Volume":25,"direction":"down","x":1663200000000,"y":25},{"Date":"2022-09-16","Volume":15,"direction":"down","x":1663286400000,"y":15},{"Date":"2022-09-21","Volume":10,"direction":"down","x":1663718400000,"y":10},{"Date":"2022-09-23","Volume":8,"direction":"down","x":1663891200000,"y":8},{"Date":"2022-10-05","Volume":5,"direction":"down","x":1664928000000,"y":5},{"Date":"2022-10-07","Volume":15,"direction":"down","x":1665100800000,"y":15},{"Date":"2022-10-10","Volume":5,"direction":"down","x":1665360000000,"y":5},{"Date":"2022-10-12","Volume":100,"direction":"down","x":1665532800000,"y":100},{"Date":"2022-10-14","Volume":96,"direction":"down","x":1665705600000,"y":96},{"Date":"2022-10-17","Volume":7,"direction":"down","x":1665964800000,"y":7},{"Date":"2022-10-21","Volume":299,"direction":"down","x":1666310400000,"y":299},{"Date":"2022-10-25","Volume":4,"direction":"down","x":1666656000000,"y":4},{"Date":"2022-10-27","Volume":510,"direction":"down","x":1666828800000,"y":510},{"Date":"2022-10-28","Volume":15,"direction":"down","x":1666915200000,"y":15},{"Date":"2022-11-03","Volume":490,"direction":"down","x":1667433600000,"y":490},{"Date":"2022-11-04","Volume":27,"direction":"down","x":1667520000000,"y":27},{"Date":"2022-11-08","Volume":17,"direction":"down","x":1667865600000,"y":17},{"Date":"2022-11-17","Volume":1107,"direction":"down","x":1668643200000,"y":1107},{"Date":"2022-11-22","Volume":10,"direction":"down","x":1669075200000,"y":10},{"Date":"2022-11-28","Volume":26,"direction":"down","x":1669593600000,"y":26},{"Date":"2022-11-29","Volume":2,"direction":"down","x":1669680000000,"y":2},{"Date":"2022-12-13","Volume":103,"direction":"down","x":1670889600000,"y":103},{"Date":"2022-12-14","Volume":42,"direction":"down","x":1670976000000,"y":42},{"Date":"2022-12-19","Volume":15,"direction":"down","x":1671408000000,"y":15},{"Date":"2022-12-22","Volume":1,"direction":"down","x":1671667200000,"y":1},{"Date":"2022-12-28","Volume":2346,"direction":"down","x":1672185600000,"y":2346},{"Date":"2022-12-29","Volume":15,"direction":"down","x":1672272000000,"y":15},{"Date":"2023-01-03","Volume":5,"direction":"down","x":1672704000000,"y":5},{"Date":"2023-01-05","Volume":5,"direction":"down","x":1672876800000,"y":5},{"Date":"2023-01-13","Volume":4,"direction":"down","x":1673568000000,"y":4},{"Date":"2023-01-19","Volume":5,"direction":"down","x":1674086400000,"y":5},{"Date":"2023-01-23","Volume":59,"direction":"down","x":1674432000000,"y":59},{"Date":"2023-01-25","Volume":110,"direction":"down","x":1674604800000,"y":110},{"Date":"2023-01-27","Volume":516,"direction":"down","x":1674777600000,"y":516},{"Date":"2023-01-31","Volume":268,"direction":"down","x":1675123200000,"y":268},{"Date":"2023-02-01","Volume":116,"direction":"down","x":1675209600000,"y":116},{"Date":"2023-02-02","Volume":70,"direction":"down","x":1675296000000,"y":70},{"Date":"2023-02-03","Volume":27,"direction":"down","x":1675382400000,"y":27},{"Date":"2023-02-06","Volume":12,"direction":"down","x":1675641600000,"y":12},{"Date":"2023-02-10","Volume":10,"direction":"down","x":1675987200000,"y":10},{"Date":"2023-02-14","Volume":223,"direction":"down","x":1676332800000,"y":223},{"Date":"2023-02-20","Volume":12,"direction":"down","x":1676851200000,"y":12},{"Date":"2023-02-22","Volume":290,"direction":"down","x":1677024000000,"y":290},{"Date":"2023-02-23","Volume":3,"direction":"down","x":1677110400000,"y":3},{"Date":"2023-02-27","Volume":601,"direction":"down","x":1677456000000,"y":601},{"Date":"2023-02-28","Volume":115,"direction":"down","x":1677542400000,"y":115},{"Date":"2023-03-01","Volume":7,"direction":"down","x":1677628800000,"y":7},{"Date":"2023-03-07","Volume":2,"direction":"down","x":1678147200000,"y":2},{"Date":"2023-03-13","Volume":32,"direction":"down","x":1678665600000,"y":32},{"Date":"2023-03-16","Volume":77,"direction":"down","x":1678924800000,"y":77},{"Date":"2023-03-21","Volume":71,"direction":"down","x":1679356800000,"y":71},{"Date":"2023-03-23","Volume":275,"direction":"down","x":1679529600000,"y":275}],"type":"column","name":"Volume","yAxis":1,"showInLegend":false},{"group":"up","data":[{"Date":"2022-03-28","Volume":1006,"direction":"up","x":1648425600000,"y":1006},{"Date":"2022-03-30","Volume":630,"direction":"up","x":1648598400000,"y":630},{"Date":"2022-04-01","Volume":46,"direction":"up","x":1648771200000,"y":46},{"Date":"2022-04-04","Volume":2636,"direction":"up","x":1649030400000,"y":2636},{"Date":"2022-04-06","Volume":165,"direction":"up","x":1649203200000,"y":165},{"Date":"2022-04-07","Volume":15417,"direction":"up","x":1649289600000,"y":15417},{"Date":"2022-04-11","Volume":2401,"direction":"up","x":1649635200000,"y":2401},{"Date":"2022-04-13","Volume":990,"direction":"up","x":1649808000000,"y":990},{"Date":"2022-04-15","Volume":935,"direction":"up","x":1649980800000,"y":935},{"Date":"2022-04-20","Volume":144,"direction":"up","x":1650412800000,"y":144},{"Date":"2022-04-21","Volume":341,"direction":"up","x":1650499200000,"y":341},{"Date":"2022-04-22","Volume":3000,"direction":"up","x":1650585600000,"y":3000},{"Date":"2022-04-25","Volume":23294,"direction":"up","x":1650844800000,"y":23294},{"Date":"2022-04-29","Volume":112,"direction":"up","x":1651190400000,"y":112},{"Date":"2022-05-03","Volume":143,"direction":"up","x":1651536000000,"y":143},{"Date":"2022-05-04","Volume":821,"direction":"up","x":1651622400000,"y":821},{"Date":"2022-05-06","Volume":6,"direction":"up","x":1651795200000,"y":6},{"Date":"2022-05-09","Volume":56,"direction":"up","x":1652054400000,"y":56},{"Date":"2022-05-11","Volume":89,"direction":"up","x":1652227200000,"y":89},{"Date":"2022-05-12","Volume":592,"direction":"up","x":1652313600000,"y":592},{"Date":"2022-05-16","Volume":1106,"direction":"up","x":1652659200000,"y":1106},{"Date":"2022-05-20","Volume":500,"direction":"up","x":1653004800000,"y":500},{"Date":"2022-05-27","Volume":610,"direction":"up","x":1653609600000,"y":610},{"Date":"2022-06-01","Volume":30,"direction":"up","x":1654041600000,"y":30},{"Date":"2022-06-02","Volume":36,"direction":"up","x":1654128000000,"y":36},{"Date":"2022-06-07","Volume":108,"direction":"up","x":1654560000000,"y":108},{"Date":"2022-06-09","Volume":50,"direction":"up","x":1654732800000,"y":50},{"Date":"2022-06-13","Volume":444,"direction":"up","x":1655078400000,"y":444},{"Date":"2022-06-14","Volume":1503,"direction":"up","x":1655164800000,"y":1503},{"Date":"2022-06-15","Volume":2012,"direction":"up","x":1655251200000,"y":2012},{"Date":"2022-06-17","Volume":594,"direction":"up","x":1655424000000,"y":594},{"Date":"2022-06-28","Volume":506,"direction":"up","x":1656374400000,"y":506},{"Date":"2022-06-30","Volume":1187,"direction":"up","x":1656547200000,"y":1187},{"Date":"2022-07-04","Volume":110,"direction":"up","x":1656892800000,"y":110},{"Date":"2022-07-05","Volume":141,"direction":"up","x":1656979200000,"y":141},{"Date":"2022-07-08","Volume":384,"direction":"up","x":1657238400000,"y":384},{"Date":"2022-07-13","Volume":2033,"direction":"up","x":1657670400000,"y":2033},{"Date":"2022-07-15","Volume":1483,"direction":"up","x":1657843200000,"y":1483},{"Date":"2022-07-19","Volume":4860,"direction":"up","x":1658188800000,"y":4860},{"Date":"2022-07-22","Volume":401,"direction":"up","x":1658448000000,"y":401},{"Date":"2022-07-28","Volume":150,"direction":"up","x":1658966400000,"y":150},{"Date":"2022-08-01","Volume":1248,"direction":"up","x":1659312000000,"y":1248},{"Date":"2022-08-05","Volume":385,"direction":"up","x":1659657600000,"y":385},{"Date":"2022-08-16","Volume":40,"direction":"up","x":1660608000000,"y":40},{"Date":"2022-08-17","Volume":100,"direction":"up","x":1660694400000,"y":100},{"Date":"2022-08-19","Volume":50,"direction":"up","x":1660867200000,"y":50},{"Date":"2022-08-22","Volume":860,"direction":"up","x":1661126400000,"y":860},{"Date":"2022-08-24","Volume":115,"direction":"up","x":1661299200000,"y":115},{"Date":"2022-08-31","Volume":489,"direction":"up","x":1661904000000,"y":489},{"Date":"2022-09-02","Volume":117,"direction":"up","x":1662076800000,"y":117},{"Date":"2022-09-05","Volume":442,"direction":"up","x":1662336000000,"y":442},{"Date":"2022-09-07","Volume":319,"direction":"up","x":1662508800000,"y":319},{"Date":"2022-09-12","Volume":60,"direction":"up","x":1662940800000,"y":60},{"Date":"2022-09-13","Volume":100,"direction":"up","x":1663027200000,"y":100},{"Date":"2022-09-19","Volume":175,"direction":"up","x":1663545600000,"y":175},{"Date":"2022-09-20","Volume":681,"direction":"up","x":1663632000000,"y":681},{"Date":"2022-09-22","Volume":30,"direction":"up","x":1663804800000,"y":30},{"Date":"2022-09-30","Volume":450,"direction":"up","x":1664496000000,"y":450},{"Date":"2022-10-03","Volume":632,"direction":"up","x":1664755200000,"y":632},{"Date":"2022-10-06","Volume":45,"direction":"up","x":1665014400000,"y":45},{"Date":"2022-10-11","Volume":2925,"direction":"up","x":1665446400000,"y":2925},{"Date":"2022-10-13","Volume":962,"direction":"up","x":1665619200000,"y":962},{"Date":"2022-10-18","Volume":16,"direction":"up","x":1666051200000,"y":16},{"Date":"2022-10-19","Volume":45,"direction":"up","x":1666137600000,"y":45},{"Date":"2022-10-20","Volume":1092,"direction":"up","x":1666224000000,"y":1092},{"Date":"2022-10-26","Volume":3814,"direction":"up","x":1666742400000,"y":3814},{"Date":"2022-10-31","Volume":20,"direction":"up","x":1667174400000,"y":20},{"Date":"2022-11-02","Volume":3010,"direction":"up","x":1667347200000,"y":3010},{"Date":"2022-11-07","Volume":54,"direction":"up","x":1667779200000,"y":54},{"Date":"2022-11-10","Volume":70,"direction":"up","x":1668038400000,"y":70},{"Date":"2022-11-16","Volume":1425,"direction":"up","x":1668556800000,"y":1425},{"Date":"2022-11-21","Volume":1500,"direction":"up","x":1668988800000,"y":1500},{"Date":"2022-11-23","Volume":91,"direction":"up","x":1669161600000,"y":91},{"Date":"2022-11-24","Volume":150,"direction":"up","x":1669248000000,"y":150},{"Date":"2022-12-05","Volume":66,"direction":"up","x":1670198400000,"y":66},{"Date":"2022-12-09","Volume":1580,"direction":"up","x":1670544000000,"y":1580},{"Date":"2022-12-12","Volume":14620,"direction":"up","x":1670803200000,"y":14620},{"Date":"2022-12-16","Volume":4157,"direction":"up","x":1671148800000,"y":4157},{"Date":"2022-12-20","Volume":893,"direction":"up","x":1671494400000,"y":893},{"Date":"2022-12-23","Volume":1,"direction":"up","x":1671753600000,"y":1},{"Date":"2022-12-27","Volume":3910,"direction":"up","x":1672099200000,"y":3910},{"Date":"2022-12-30","Volume":40,"direction":"up","x":1672358400000,"y":40},{"Date":"2023-01-04","Volume":88,"direction":"up","x":1672790400000,"y":88},{"Date":"2023-01-06","Volume":65,"direction":"up","x":1672963200000,"y":65},{"Date":"2023-01-10","Volume":160,"direction":"up","x":1673308800000,"y":160},{"Date":"2023-01-11","Volume":160,"direction":"up","x":1673395200000,"y":160},{"Date":"2023-01-12","Volume":923,"direction":"up","x":1673481600000,"y":923},{"Date":"2023-01-16","Volume":28,"direction":"up","x":1673827200000,"y":28},{"Date":"2023-01-17","Volume":55,"direction":"up","x":1673913600000,"y":55},{"Date":"2023-01-18","Volume":1465,"direction":"up","x":1674000000000,"y":1465},{"Date":"2023-01-20","Volume":524,"direction":"up","x":1674172800000,"y":524},{"Date":"2023-01-24","Volume":1059,"direction":"up","x":1674518400000,"y":1059},{"Date":"2023-01-26","Volume":1650,"direction":"up","x":1674691200000,"y":1650},{"Date":"2023-02-07","Volume":220,"direction":"up","x":1675728000000,"y":220},{"Date":"2023-02-09","Volume":2061,"direction":"up","x":1675900800000,"y":2061},{"Date":"2023-02-13","Volume":1264,"direction":"up","x":1676246400000,"y":1264},{"Date":"2023-02-15","Volume":333,"direction":"up","x":1676419200000,"y":333},{"Date":"2023-02-17","Volume":498,"direction":"up","x":1676592000000,"y":498},{"Date":"2023-02-21","Volume":636,"direction":"up","x":1676937600000,"y":636},{"Date":"2023-02-24","Volume":1074,"direction":"up","x":1677196800000,"y":1074},{"Date":"2023-03-02","Volume":11,"direction":"up","x":1677715200000,"y":11},{"Date":"2023-03-06","Volume":6385,"direction":"up","x":1678060800000,"y":6385},{"Date":"2023-03-08","Volume":36,"direction":"up","x":1678233600000,"y":36},{"Date":"2023-03-10","Volume":709,"direction":"up","x":1678406400000,"y":709},{"Date":"2023-03-14","Volume":32,"direction":"up","x":1678752000000,"y":32},{"Date":"2023-03-15","Volume":448,"direction":"up","x":1678838400000,"y":448},{"Date":"2023-03-17","Volume":794,"direction":"up","x":1679011200000,"y":794},{"Date":"2023-03-20","Volume":868,"direction":"up","x":1679270400000,"y":868},{"Date":"2023-03-22","Volume":1943,"direction":"up","x":1679443200000,"y":1943},{"Date":"2023-03-24","Volume":550,"direction":"up","x":1679616000000,"y":550}],"type":"column","name":"Volume","yAxis":1,"showInLegend":false},{"group":null,"data":[{"Date":"2022-03-25","Volume":22,"direction":null,"x":1648166400000,"y":22}],"type":"column","name":"Volume","yAxis":1,"showInLegend":false}],"colors":["red","darkgreen"]},"theme":{"chart":{"backgroundColor":"transparent"},"colors":["#7cb5ec","#434348","#90ed7d","#f7a35c","#8085e9","#f15c80","#e4d354","#2b908f","#f45b5b","#91e8e1"]},"conf_opts":{"global":{"Date":null,"VMLRadialGradientURL":"http =//code.highcharts.com/list(version)/gfx/vml-radial-gradient.png","canvasToolsURL":"http =//code.highcharts.com/list(version)/modules/canvas-tools.js","getTimezoneOffset":null,"timezoneOffset":0,"useUTC":true},"lang":{"contextButtonTitle":"Chart context menu","decimalPoint":".","downloadCSV":"Download CSV","downloadJPEG":"Download JPEG image","downloadPDF":"Download PDF document","downloadPNG":"Download PNG image","downloadSVG":"Download SVG vector image","downloadXLS":"Download XLS","drillUpText":"◁ Back to {series.name}","exitFullscreen":"Exit from full screen","exportData":{"annotationHeader":"Annotations","categoryDatetimeHeader":"DateTime","categoryHeader":"Category"},"hideData":"Hide data table","invalidDate":null,"loading":"Loading...","months":["January","February","March","April","May","June","July","August","September","October","November","December"],"noData":"No data to display","numericSymbolMagnitude":1000,"numericSymbols":["k","M","G","T","P","E"],"printChart":"Print chart","resetZoom":"Reset zoom","resetZoomTitle":"Reset zoom level 1:1","shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"shortWeekdays":["Sat","Sun","Mon","Tue","Wed","Thu","Fri"],"thousandsSep":" ","viewData":"View data table","viewFullscreen":"View in full screen","weekdays":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]}},"type":"stock","fonts":"Erica+One","debug":false},"evals":[],"jsHooks":[]}</script>

#You can specify your color like `BRVM_plot("boas", up.col = "blue", down.col = "pink")` for example
```


## The **BRVM_company_info("ticker")** function

It receives the ticker of a company listed on the BRVM stock exchange, Turn to upper case the input by using toupper() and returns informations about the company's RSI, Beta, Closing price, etc. .


```r
# Get informations such us beta, RSI, Closing, Valorisation, etc. of Bank Of Africa Senegal

BRVM_company_info("BOAS")
#> # A tibble: 10 × 2
#>    Informations    Values     
#>    <chr>           <chr>      
#>  1 Volume (titres) 2 618      
#>  2 Volume (XOF )   5 694 150  
#>  3 Ouverture       2 175      
#>  4 Plus haut       2 175      
#>  5 Plus bas        2 175      
#>  6 Clôture veille  2 175      
#>  7 Beta 1 an       0,11       
#>  8 RSI             27,66      
#>  9 Capital échangé 0,01%      
#> 10 Valorisation    52 200 MXOF
```

> -**BRVM_cap()** : receives no argument and returns informations about BRVM capitalization


```r
BRVM_cap()
#> # A tibble: 47 × 7
#>    Symbol Name                           Numbe…¹ Daily…² Float…³ Globa…⁴ Globa…⁵
#>    <chr>  <chr>                          <chr>   <chr>   <chr>   <chr>   <chr>  
#>  1 ABJC   SERVAIR ABIDJAN  COTE D'IVOIRE 10 912… 1 295   2 837 … 14 131… 0.19   
#>  2 BICC   BICI COTE D'IVOIRE             16 666… 6 300   34 138… 105 00… 1.39   
#>  3 BNBC   BERNABE COTE D'IVOIRE          6 624 … 1 990   4 626 … 13 181… 0.17   
#>  4 BOAB   BANK OF AFRICA BENIN           20 280… 6 250   56 681… 126 75… 1.68   
#>  5 BOABF  BANK OF AFRICA BURKINA FASO    22 000… 5 700   36 496… 125 40… 1.66   
#>  6 BOAC   BANK OF AFRICA COTE D'IVOIRE   20 000… 5 200   28 732… 104 00… 1.37   
#>  7 BOAM   BANK OF AFRICA MALI            18 300… 1 295   4 290 … 23 698… 0.31   
#>  8 BOAN   BANK OF AFRICA NIGER           13 000… 6 195   32 397… 80 535… 1.06   
#>  9 BOAS   BANK OF AFRICA SENEGAL         24 000… 2 175   15 703… 52 200… 0.69   
#> 10 CABC   SICABLE COTE D'IVOIRE          5 920 … 1 015   2 926 … 6 008 … 0.08   
#> # … with 37 more rows, and abbreviated variable names ¹​`Number of shares`,
#> #   ²​`Daily price`, ³​`Floating Capitalization`, ⁴​`Global capitalization`,
#> #   ⁵​`Global capitalization (%)`
```

> - **BRVM_company_rank()** : returns companies rank from the BRVM Bourse exchange according to their daily change (variation).



```r
comp.rank<-BRVM_company_rank() #Get compnies rank
comp.rank%>%arrange(desc(percent_change)) #Describe in decreasing order
#> # A tibble: 47 × 4
#>    ticker company_name                    percent_change  rank
#>    <chr>  <chr>                                    <dbl> <dbl>
#>  1 SEMC   CROWN SIEM COTE D'IVOIRE                  7.14     1
#>  2 NEIC   NEI-CEDA COTE D'IVOIRE                    6.98     2
#>  3 PRSC   TRACTAFRIC MOTORS COTE D'IVOIRE           6.9      3
#>  4 BOAC   BANK OF AFRICA COTE D'IVOIRE              2.97     4
#>  5 NTLC   NESTLE COTE D'IVOIRE                      2.79     5
#>  6 BOAB   BANK OF AFRICA BENIN                      1.13     6
#>  7 NSBC   NSIA BANQUE COTE D'IVOIRE                 0.81     7
#>  8 BOAN   BANK OF AFRICA NIGER                      0.73     8
#>  9 PALC   PALM COTE D'IVOIRE                        0.41     9
#> 10 ORAC   ORANGE COTE D'IVOIRE                      0.21    10
#> # … with 37 more rows
```


> - **BRVM_direction(".up_or_down")** : will take in 'Up' or 'Down' and returns respectively n results for the top or flop ranking of the BRVM tickers.

* .up_or_down : This is a character string set to "Up" It can either be 'Up' or 'Down'.



```r
# Rank in descending order the price of shares listed on the BRVM according to daily variations.
BRVM_direction("Up")
#> # A tibble: 47 × 3
#>    Symbole Nom                             `Variation (%)`
#>    <chr>   <chr>                                     <dbl>
#>  1 SEMC    CROWN SIEM COTE D'IVOIRE                   7.14
#>  2 NEIC    NEI-CEDA COTE D'IVOIRE                     6.98
#>  3 PRSC    TRACTAFRIC MOTORS COTE D'IVOIRE            6.9 
#>  4 BOAC    BANK OF AFRICA COTE D'IVOIRE               2.97
#>  5 NTLC    NESTLE COTE D'IVOIRE                       2.79
#>  6 BOAB    BANK OF AFRICA BENIN                       1.13
#>  7 NSBC    NSIA BANQUE COTE D'IVOIRE                  0.81
#>  8 BOAN    BANK OF AFRICA NIGER                       0.73
#>  9 PALC    PALM COTE D'IVOIRE                         0.41
#> 10 ORAC    ORANGE COTE D'IVOIRE                       0.21
#> # … with 37 more rows
```

> - **BRVM_rank** : receives "top" or "flop" and a number 'n' and returns table of companies classification

* top_or_flop : Choose between "top" or "flop"

* n : is the number of companies in the classification


```r
BRVM_rank("top", 15) #To get top 15
#> # A tibble: 15 × 3
#>    Ticker Name                                  `Change (%)`
#>    <chr>  <chr>                                        <dbl>
#>  1 SEMC   CROWN SIEM COTE D'IVOIRE                      7.14
#>  2 NEIC   NEI-CEDA COTE D'IVOIRE                        6.98
#>  3 PRSC   TRACTAFRIC MOTORS COTE D'IVOIRE               6.9 
#>  4 BOAC   BANK OF AFRICA COTE D'IVOIRE                  2.97
#>  5 NTLC   NESTLE COTE D'IVOIRE                          2.79
#>  6 BOAB   BANK OF AFRICA BENIN                          1.13
#>  7 NSBC   NSIA BANQUE COTE D'IVOIRE                     0.81
#>  8 BOAN   BANK OF AFRICA NIGER                          0.73
#>  9 PALC   PALM COTE D'IVOIRE                            0.41
#> 10 ORAC   ORANGE COTE D'IVOIRE                          0.21
#> 11 BICC   BICI COTE D'IVOIRE                            0   
#> 12 BOABF  BANK OF AFRICA BURKINA FASO                   0   
#> 13 BOAS   BANK OF AFRICA SENEGAL                        0   
#> 14 CBIBF  CORIS BANK INTERNATIONAL BURKINA FASO         0   
#> 15 CFAC   CFAO MOTORS COTE D'IVOIRE                     0
BRVM_rank("flop", 5) #To get flop 5
#> # A tibble: 5 × 3
#>   Ticker Name                           `Change (%)`
#>   <chr>  <chr>                                 <dbl>
#> 1 SICC   SICOR COTE D'IVOIRE                   -7.47
#> 2 STAC   SETAO COTE D'IVOIRE                   -4.55
#> 3 TTLS   TOTAL SENEGAL                         -2.93
#> 4 CABC   SICABLE COTE D'IVOIRE                 -2.4 
#> 5 SGBC   SOCIETE GENERALE COTE D'IVOIRE        -1.07
```

> - **company_traded_val("company")** : receives one company listed on the BRVM stock exchange, Turn to upper case the input by using toupper() and returns informations about the company's traded value

* company : The name of company listed on the BRVM stock exchange


```r
company_traded_val("ontbf") # Traded value of ONATEL BURKINA FASO
#> [1] "1 133 865"
```

**License:**
- MIT 2023, BRVM authors. All rights reserved.
