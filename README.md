---
title: "Library BRVM"
date: "26 mars,2023"
output:
  html_document: 
    toc: yes
    fig_caption: yes
    keep_md: yes
    fig_width: 8
    fig_height: 6
  word_document: 
    toc: yes
  pdf_document: 
    toc: yes
    latex_engine: lualatex
always_allow_html: true
---


<!-- README.md is generated from README.Rmd. Please edit that file -->



<img src="man/figures/brvm-logo.png" width="147" height="170" align="right"/>

<!-- badges: start -->
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/BRVM)](https://cran.r-project.org/package=BRVM)
![](https://cranlogs.r-pkg.org/badges/BRVM)
![](https://cranlogs.r-pkg.org/badges/grand-total/BRVM)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html##experimental)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://makeapullrequest.com)
<!-- badges: end -->

## BRVM
### Description {.tabset}
#### English
This R package provides a user-friendly interface for accessing data from the BRVM, which is a regional stock exchange serving multiple West African countries. With this package, users can easily retrieve historical stock price data, trading volumes, and other financial indicators for a variety of stocks traded on the BRVM.

The package is designed to simplify the process of gathering and analyzing financial data, making it easier for researchers, investors, and other users to extract insights and make informed decisions based on the information available. Overall, `BRVM` library is a valuable tool for anyone looking to gain a better understanding of the BRVM and the financial markets in West Africa.

#### Français
Ce package R fournit une interface conviviale pour accéder aux données de la BRVM, qui est une bourse régionale desservant plusieurs pays d'Afrique de l'Ouest. Avec ce package, les utilisateurs peuvent facilement récupérer des données historiques sur les prix des actions, les volumes de transactions et d'autres indicateurs financiers pour une variété d'actions négociées sur la BRVM.

Le package est conçu pour simplifier le processus de collecte et d'analyse de données financières, ce qui facilite la tâche des chercheurs, des investisseurs et d'autres utilisateurs pour extraire des informations et prendre des décisions éclairées en se basant sur les informations disponibles. Dans l'ensemble, votre package R est un outil précieux pour quiconque cherche à mieux comprendre la BRVM et les marchés financiers en Afrique de l'Ouest.

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

## Html version of the Readme 
Since the size of the readme is huge due to the charts, you can visit the html version of the readme on [RPubs](https://rpubs.com/Fredysessie/Readme_BRVM_Stock)


<iframe> src=" https://github.com/Koffi-Fredysessie/BRVM/g/blob/main/man/figures/Bicc_ohcl.html" </iframe>

```r
library(BRVM)
```


## The **BRVM_ticker_desc()** function
 
It receives no argument and returns BRVM tickers information such as its full name, sector and country.


```r
# Display tickers of BRVM
tickers <- BRVM_ticker_desc()
tickers
```
<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Ticker </th>
   <th style="text-align:left;"> Company name </th>
   <th style="text-align:left;"> Sector </th>
   <th style="text-align:left;"> Country </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> ABJC </td>
   <td style="text-align:left;"> SERVAIR ABIDJAN  COTE D'IVOIRE </td>
   <td style="text-align:left;"> DISTRIBUTION </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BICC </td>
   <td style="text-align:left;"> BICI COTE D'IVOIRE </td>
   <td style="text-align:left;"> FINANCE </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNBC </td>
   <td style="text-align:left;"> BERNABE COTE D'IVOIRE </td>
   <td style="text-align:left;"> DISTRIBUTION </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAB </td>
   <td style="text-align:left;"> BANK OF AFRICA BENIN </td>
   <td style="text-align:left;"> FINANCE </td>
   <td style="text-align:left;"> BENIN </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOABF </td>
   <td style="text-align:left;"> BANK OF AFRICA BURKINA FASO </td>
   <td style="text-align:left;"> FINANCE </td>
   <td style="text-align:left;"> BURKINA FASO </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAC </td>
   <td style="text-align:left;"> BANK OF AFRICA COTE D'IVOIRE </td>
   <td style="text-align:left;"> FINANCE </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAM </td>
   <td style="text-align:left;"> BANK OF AFRICA MALI </td>
   <td style="text-align:left;"> FINANCE </td>
   <td style="text-align:left;"> MALI </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAN </td>
   <td style="text-align:left;"> BANK OF AFRICA NIGER </td>
   <td style="text-align:left;"> FINANCE </td>
   <td style="text-align:left;"> NIGER </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAS </td>
   <td style="text-align:left;"> BANK OF AFRICA SENEGAL </td>
   <td style="text-align:left;"> FINANCE </td>
   <td style="text-align:left;"> SENEGAL </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CABC </td>
   <td style="text-align:left;"> SICABLE COTE D'IVOIRE </td>
   <td style="text-align:left;"> INDUSTRY </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CBIBF </td>
   <td style="text-align:left;"> CORIS BANK INTERNATIONAL BURKINA FASO </td>
   <td style="text-align:left;"> FINANCE </td>
   <td style="text-align:left;"> BURKINA FASO </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CFAC </td>
   <td style="text-align:left;"> CFAO MOTORS COTE D'IVOIRE </td>
   <td style="text-align:left;"> DISTRIBUTION </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CIEC </td>
   <td style="text-align:left;"> CIE COTE D'IVOIRE </td>
   <td style="text-align:left;"> PUBLIC SERVICE </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ECOC </td>
   <td style="text-align:left;"> ECOBANK COTE D'IVOIRE </td>
   <td style="text-align:left;"> FINANCE </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ETIT </td>
   <td style="text-align:left;"> Ecobank Transnational Incorporated TOGO </td>
   <td style="text-align:left;"> FINANCE </td>
   <td style="text-align:left;"> TOGO </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FTSC </td>
   <td style="text-align:left;"> FILTISAC COTE D'IVOIRE </td>
   <td style="text-align:left;"> INDUSTRY </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NEIC </td>
   <td style="text-align:left;"> NEI-CEDA COTE D'IVOIRE </td>
   <td style="text-align:left;"> INDUSTRY </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NSBC </td>
   <td style="text-align:left;"> NSIA BANQUE COTE D'IVOIRE </td>
   <td style="text-align:left;"> FINANCE </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NTLC </td>
   <td style="text-align:left;"> NESTLE COTE D'IVOIRE </td>
   <td style="text-align:left;"> INDUSTRY </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ONTBF </td>
   <td style="text-align:left;"> ONATEL BURKINA FASO </td>
   <td style="text-align:left;"> PUBLIC SERVICE </td>
   <td style="text-align:left;"> BURKINA FASO </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ORAC </td>
   <td style="text-align:left;"> ORANGE COTE D'IVOIRE </td>
   <td style="text-align:left;"> PUBLIC SERVICE </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ORGT </td>
   <td style="text-align:left;"> ORAGROUP TOGO </td>
   <td style="text-align:left;"> FINANCE </td>
   <td style="text-align:left;"> TOGO </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PALC </td>
   <td style="text-align:left;"> PALM COTE D'IVOIRE </td>
   <td style="text-align:left;"> AGRICULTURE </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PRSC </td>
   <td style="text-align:left;"> TRACTAFRIC MOTORS COTE D'IVOIRE </td>
   <td style="text-align:left;"> DISTRIBUTION </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SAFC </td>
   <td style="text-align:left;"> SAFCA COTE D'IVOIRE </td>
   <td style="text-align:left;"> FINANCE </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SCRC </td>
   <td style="text-align:left;"> SUCRIVOIRE COTE D'IVOIRE </td>
   <td style="text-align:left;"> AGRICULTURE </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SDCC </td>
   <td style="text-align:left;"> SODE COTE D'IVOIRE </td>
   <td style="text-align:left;"> PUBLIC SERVICE </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SDSC </td>
   <td style="text-align:left;"> BOLLORE TRANSPORT &amp; LOGISTICS COTE D'IVOIRE </td>
   <td style="text-align:left;"> TRANSPORT </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEMC </td>
   <td style="text-align:left;"> CROWN SIEM COTE D'IVOIRE </td>
   <td style="text-align:left;"> INDUSTRY </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SGBC </td>
   <td style="text-align:left;"> SOCIETE GENERALE COTE D'IVOIRE </td>
   <td style="text-align:left;"> FINANCE </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SHEC </td>
   <td style="text-align:left;"> VIVO ENERGY COTE D'IVOIRE </td>
   <td style="text-align:left;"> DISTRIBUTION </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SIBC </td>
   <td style="text-align:left;"> SOCIETE IVOIRIENNE DE BANQUE COTE D'IVOIRE </td>
   <td style="text-align:left;"> FINANCE </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SICC </td>
   <td style="text-align:left;"> SICOR COTE D'IVOIRE </td>
   <td style="text-align:left;"> AGRICULTURE </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SIVC </td>
   <td style="text-align:left;"> AIR LIQUIDE COTE D'IVOIRE </td>
   <td style="text-align:left;"> INDUSTRY </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SLBC </td>
   <td style="text-align:left;"> SOLIBRA COTE D'IVOIRE </td>
   <td style="text-align:left;"> INDUSTRY </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SMBC </td>
   <td style="text-align:left;"> SMB COTE D'IVOIRE </td>
   <td style="text-align:left;"> INDUSTRY </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SNTS </td>
   <td style="text-align:left;"> SONATEL SENEGAL </td>
   <td style="text-align:left;"> PUBLIC SERVICE </td>
   <td style="text-align:left;"> SENEGAL </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SOGC </td>
   <td style="text-align:left;"> SOGB COTE D'IVOIRE </td>
   <td style="text-align:left;"> AGRICULTURE </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPHC </td>
   <td style="text-align:left;"> SAPH COTE D'IVOIRE </td>
   <td style="text-align:left;"> AGRICULTURE </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> STAC </td>
   <td style="text-align:left;"> SETAO COTE D'IVOIRE </td>
   <td style="text-align:left;"> OTHER </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> STBC </td>
   <td style="text-align:left;"> SITAB COTE D'IVOIRE </td>
   <td style="text-align:left;"> INDUSTRY </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SVOC </td>
   <td style="text-align:left;"> MOVIS COTE D'IVOIRE </td>
   <td style="text-align:left;"> TRANSPORT </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TTLC </td>
   <td style="text-align:left;"> TOTAL COTE D'IVOIRE </td>
   <td style="text-align:left;"> DISTRIBUTION </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TTLS </td>
   <td style="text-align:left;"> TOTAL SENEGAL </td>
   <td style="text-align:left;"> DISTRIBUTION </td>
   <td style="text-align:left;"> SENEGAL </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TTRC </td>
   <td style="text-align:left;"> TRITURAF Ste en Liquid </td>
   <td style="text-align:left;"> INDUSTRY </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UNLC </td>
   <td style="text-align:left;"> UNILEVER COTE D'IVOIRE </td>
   <td style="text-align:left;"> INDUSTRY </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UNXC </td>
   <td style="text-align:left;"> UNIWAX COTE D'IVOIRE </td>
   <td style="text-align:left;"> INDUSTRY </td>
   <td style="text-align:left;"> IVORY COAST </td>
  </tr>
</tbody>
</table>


## The **BRVM_index()** function :
It receives no argument and returns a table of updated data (with as table header: indexes, previous closing, closing, change (%), Year to Date Change) on all the indices available on the BRVM exchange.


```r
the_index <- BRVM_index() 
the_index
```
<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Indexes </th>
   <th style="text-align:right;"> Previous closing </th>
   <th style="text-align:right;"> Closing </th>
   <th style="text-align:right;"> Change (%) </th>
   <th style="text-align:right;"> Year to Date Change </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> BRVM-30 </td>
   <td style="text-align:right;"> 102.46 </td>
   <td style="text-align:right;"> 102.26 </td>
   <td style="text-align:right;"> -0.20 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BRVM - AGRICULTURE </td>
   <td style="text-align:right;"> 286.67 </td>
   <td style="text-align:right;"> 286.08 </td>
   <td style="text-align:right;"> -0.21 </td>
   <td style="text-align:right;"> -0.66 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BRVM - OTHER SECTOR </td>
   <td style="text-align:right;"> 1357.27 </td>
   <td style="text-align:right;"> 1295.58 </td>
   <td style="text-align:right;"> -4.55 </td>
   <td style="text-align:right;"> -7.32 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BRVM - COMPOSITE </td>
   <td style="text-align:right;"> 203.53 </td>
   <td style="text-align:right;"> 203.38 </td>
   <td style="text-align:right;"> -0.07 </td>
   <td style="text-align:right;"> 0.85 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BRVM - DISTRIBUTION </td>
   <td style="text-align:right;"> 367.26 </td>
   <td style="text-align:right;"> 366.75 </td>
   <td style="text-align:right;"> -0.14 </td>
   <td style="text-align:right;"> 0.69 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BRVM - FINANCE </td>
   <td style="text-align:right;"> 77.33 </td>
   <td style="text-align:right;"> 77.31 </td>
   <td style="text-align:right;"> -0.03 </td>
   <td style="text-align:right;"> -0.66 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BRVM - INDUSTRY </td>
   <td style="text-align:right;"> 97.06 </td>
   <td style="text-align:right;"> 98.00 </td>
   <td style="text-align:right;"> 0.97 </td>
   <td style="text-align:right;"> 0.92 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BRVM - PRESTIGE </td>
   <td style="text-align:right;"> 106.49 </td>
   <td style="text-align:right;"> 106.18 </td>
   <td style="text-align:right;"> -0.29 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BRVM - PRINCIPAL </td>
   <td style="text-align:right;"> 96.23 </td>
   <td style="text-align:right;"> 96.41 </td>
   <td style="text-align:right;"> 0.19 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BRVM - PUBLIC SERVICES </td>
   <td style="text-align:right;"> 485.48 </td>
   <td style="text-align:right;"> 484.25 </td>
   <td style="text-align:right;"> -0.25 </td>
   <td style="text-align:right;"> 2.23 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BRVM - TRANSPORT </td>
   <td style="text-align:right;"> 357.22 </td>
   <td style="text-align:right;"> 356.02 </td>
   <td style="text-align:right;"> -0.34 </td>
   <td style="text-align:right;"> 0.35 </td>
  </tr>
</tbody>
</table>


## The **BRVM_get(".symbol", ".from", ".to")** function
 
This function will get the data of the companies listed on the BVRM stock exchange in Rich Bourse website. The function takes a single parameter, `.symbol` (which represents the "Ticker").
The function will automatically format tickers you enter in uppercase using toupper() and then ensure that the passed ticker is in a Google spreadsheet of allowed tickers.

* .symbol : A vector of symbols, like: c("BICC","XOM","SlbC") ;
* .from : A quoted start date, ie. "2020-01-01" or "2020/01/01". The date must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD" ;
* .to : A quoted end date, ie. "2022-01-31" or "2022/01/31". The date must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD".


```r

#' Displaying data of SONATEL Senegal stock
BRVM_get(.symbol = "snts")
#> [1] "SNTS"
#> # A tibble: 250 × 6
#>    Date        Open  High   Low Close Volume
#>    <date>     <dbl> <dbl> <dbl> <dbl>  <dbl>
#>  1 2022-03-28 15895 15900 15505 15505   2107
#>  2 2022-03-29 15515 15800 15500 15600  33932
#>  3 2022-03-30 15600 15895 15600 15895    516
#>  4 2022-03-31 15700 15900 15600 15800  10671
#>  5 2022-04-01 15700 15800 15600 15650   5542
#>  6 2022-04-04 15655 15775 15655 15775    126
#>  7 2022-04-05 15775 15775 15660 15750  25792
#>  8 2022-04-06 15800 15895 15750 15800   7436
#>  9 2022-04-07 15800 15900 15750 15900   1265
#> 10 2022-04-08 15900 15995 15800 15900   1164
#> # … with 240 more rows

symbols <- c("BiCc","XOM","SlbC")   # We use here three tickers
data_tbl <- BRVM_get(.symbol = symbols, .from = "2020-01-01", .to = Sys.Date() - 1)
#> [1] "BICC" "SLBC"

# Display the first twenty observations of the table
head(data_tbl, 20)
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


# Display the last twenty elements of the table
tail(data_tbl, 20)
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

This function will get data of the companies listed on the BVRM stock exchange through the sikafinance site.
The function takes in a single parameter of ticker and will auto-format the tickers you input into all upper case by using `toupper()`

* ticker : A vector of ticker, like: c("BICC","XOM","SlbC", "BRvm10");
* Period : Numeric number indicating time period. Valid entries are 0, 1, 5, 30, 91, and 365 representing respectively 'daily', 'one year', 'weekly', 'monthly', 'quarterly' and 'yearly';
* from : A quoted start date, ie. "2020-01-01" or "2020/01/01". The date must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD";
* to : A quoted end date, ie. "2022-01-31" or "2022/01/31". The date must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD"

** NB : There is a small difference between the BRVM_get and BRVM_get1 functions.
* With BRVM_get it is only possible to download tickers' daily data.
* But with BRVM_get1, you can download daily, weekly, monthly, annual tickers’ data, indices and even market capitalization.


```r
#' Displaying data of SONATEL Senegal stock
BRVM_get1("snts")
#> [1] "We obtained SNTS data from 2022-12-27 to 2023-03-24"
#> # A tibble: 64 × 5
#>    Date        Open  High   Low Close
#>    <date>     <int> <int> <int> <int>
#>  1 2022-12-27 15400 15500 15400 15500
#>  2 2022-12-28 15400 15450 15400 15450
#>  3 2022-12-29 15395 15450 15395 15450
#>  4 2022-12-30 15435 15435 15200 15200
#>  5 2023-01-02 15195 15395 15195 15395
#>  6 2023-01-03 15390 15390 15375 15375
#>  7 2023-01-04 15295 15295 15280 15280
#>  8 2023-01-05 15265 15265 15160 15160
#>  9 2023-01-06 15100 15100 15000 15000
#> 10 2023-01-09 14990 15000 14990 15000
#> # … with 54 more rows

# Get daily data of all indexes
all_ind <- BRVM_get1("ALL INDEXES", Period = 0, from = "2020-01-04", to = "2023-03-24") 
#> [1] "We obtained BRVM10 data from 2019-12-26 to 2023-01-04"
#> [1] "We obtained BRVMAG data from 2019-12-26 to 2023-03-24"
#> [1] "We obtained BRVMC data from 2019-12-26 to 2023-03-24"
#> [1] "We obtained BRVMAS data from 2019-12-26 to 2023-03-24"
#> [1] "We obtained BRVMDI data from 2019-12-26 to 2023-03-24"
#> [1] "We obtained BRVMFI data from 2019-12-26 to 2023-03-24"
#> [1] "We obtained BRVMIN data from 2019-12-26 to 2023-03-24"
#> [1] "We obtained BRVMSP data from 2019-12-26 to 2023-03-24"
#> [1] "We obtained BRVMTR data from 2019-12-26 to 2023-03-24"
#> [1] "We obtained BRVMPR data from 2023-01-01 to 2023-03-24"
#> [1] "We obtained BRVMPA data from 2023-01-04 to 2023-03-24"
#> [1] "We obtained BRVM30 data from 2023-01-01 to 2023-03-24"
#> [1] "We obtained CAPIB data from 2020-01-02 to 2023-03-24"

# display the first two tens elements of the table
head(all_ind, 20)
#> # A tibble: 20 × 7
#>    Date        Open  High   Low Close Volume Ticker
#>    <date>     <dbl> <dbl> <dbl> <dbl>  <dbl> <chr> 
#>  1 2022-12-26  169.  169.  169.  169.      0 BRVM10
#>  2 2022-12-27  169.  169.  169.  169.      0 BRVM10
#>  3 2022-12-28  167.  167.  167.  167.      0 BRVM10
#>  4 2022-12-29  167.  167.  167.  167.      0 BRVM10
#>  5 2022-12-30  166.  166.  166.  166.      0 BRVM10
#>  6 2023-01-02  166.  166.  166.  166.      0 BRVM10
#>  7 2023-01-03  166.  166.  166.  166.      0 BRVM10
#>  8 2023-01-04  166.  166.  166.  166.      0 BRVM10
#>  9 2022-09-26  163.  163.  163.  163.      0 BRVM10
#> 10 2022-09-27  162.  162.  162.  162.      0 BRVM10
#> 11 2022-09-28  162.  162.  162.  162.      0 BRVM10
#> 12 2022-09-29  163.  163.  163.  163.      0 BRVM10
#> 13 2022-09-30  164.  164.  164.  164.      0 BRVM10
#> 14 2022-10-03  162.  162.  162.  162.      0 BRVM10
#> 15 2022-10-04  162.  162.  162.  162.      0 BRVM10
#> 16 2022-10-05  161.  161.  161.  161.      0 BRVM10
#> 17 2022-10-06  161.  161.  161.  161.      0 BRVM10
#> 18 2022-10-07  161.  161.  161.  161.      0 BRVM10
#> 19 2022-10-10  160.  160.  160.  160.      0 BRVM10
#> 20 2022-10-11  160.  160.  160.  160.      0 BRVM10

# display the two tens of the last elements of the table
tail(all_ind, 20)
#> # A tibble: 20 × 7
#>    Date          Open    High     Low   Close Volume Ticker
#>    <date>       <dbl>   <dbl>   <dbl>   <dbl>  <dbl> <chr> 
#>  1 2020-02-26 4281311 4281311 4281311 4281311      0 CAPIB 
#>  2 2020-02-27 4314933 4314933 4314933 4314933      0 CAPIB 
#>  3 2020-02-28 4346515 4346515 4346515 4346515      0 CAPIB 
#>  4 2020-03-02 4424073 4424073 4424073 4424073      0 CAPIB 
#>  5 2020-03-03 4379647 4379647 4379647 4379647      0 CAPIB 
#>  6 2020-03-04 4369550 4369550 4369550 4369550      0 CAPIB 
#>  7 2020-03-05 4342229 4342229 4342229 4342229      0 CAPIB 
#>  8 2020-03-06 4359879 4359879 4359879 4359879      0 CAPIB 
#>  9 2020-03-09 4338293 4338293 4338293 4338293      0 CAPIB 
#> 10 2020-03-10 4357221 4357221 4357221 4357221      0 CAPIB 
#> 11 2020-03-11 4332656 4332656 4332656 4332656      0 CAPIB 
#> 12 2020-03-12 4318096 4318096 4318096 4318096      0 CAPIB 
#> 13 2020-03-13 4318112 4318112 4318112 4318112      0 CAPIB 
#> 14 2020-03-16 4285184 4285184 4285184 4285184      0 CAPIB 
#> 15 2020-03-17 4301727 4301727 4301727 4301727      0 CAPIB 
#> 16 2020-03-18 4288582 4288582 4288582 4288582      0 CAPIB 
#> 17 2020-03-19 4207231 4207231 4207231 4207231      0 CAPIB 
#> 18 2020-03-20 4209788 4209788 4209788 4209788      0 CAPIB 
#> 19 2020-03-23 4154445 4154445 4154445 4154445      0 CAPIB 
#> 20 2020-03-24 4144325 4144325 4144325 4144325      0 CAPIB

# To get yearly data
yearly_data <- BRVM_get1(c("brvmtr", "BiCc", "BOAS"), Period = 365 ) 

# display the first two tens elements of the table
head(yearly_data, 20) 
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

# display the two tens of the last elements of the table
tail(yearly_data, 20) 
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

chart <- BRVM_plot("BICC") # The default colors for the up and down are green and 
#> [1] "BICC"
chart
```


<div class="highchart html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-cd4d98b8e54dc7d6f60a" style="width:100%;height:576px;"></div>
<script type="application/json" data-for="htmlwidget-cd4d98b8e54dc7d6f60a">{"x":{"hc_opts":{"chart":{"reflow":true},"title":{"text":"BICC chart : from 2022-03-26 to 2023-03-25","style":{"fontWeight":"bold","fontSize":"25px"},"align":"center"},"yAxis":[{"title":{"style":{"color":"#333333","fontSize":"20px","fontFamily":"Erica One"},"text":"Price"},"top":"-10%","height":"90%","opposite":false},{"title":{"style":{"color":"gray","fontSize":"20px","fontFamily":"Erica One"},"text":"Volume"},"top":"80%","height":"20%"}],"credits":{"enabled":false},"exporting":{"enabled":true,"filename":"BICC chart : from 2022-03-26 to 2023-03-25"},"boost":{"enabled":false},"plotOptions":{"series":{"label":{"enabled":false},"turboThreshold":0},"treemap":{"layoutAlgorithm":"squarified"}},"series":[{"data":[[1648425600000,5815,6400,5700,6400],[1648512000000,6390,6390,6070,6070],[1648598400000,6395,6400,6390,6390],[1648684800000,6390,6395,6390,6395],[1648771200000,6300,6300,6000,6000],[1649030400000,5900,5900,5700,5900],[1649116800000,6000,6340,5850,6340],[1649203200000,6340,6340,6335,6335],[1649289600000,6330,6340,5880,6340],[1649376000000,6340,6340,6250,6250],[1649635200000,6000,6000,6000,6000],[1649721600000,6000,6000,5820,6000],[1649808000000,6000,6295,6000,6295],[1649894400000,6250,6295,6250,6295],[1649980800000,6285,6350,6000,6350],[1650326400000,6200,6200,6200,6200],[1650412800000,6200,6200,5955,5955],[1650499200000,6335,6335,6300,6300],[1650585600000,6250,6300,6000,6000],[1650844800000,6000,6300,6000,6300],[1650931200000,6300,6300,6300,6300],[1651190400000,6200,6200,6200,6200],[1651536000000,6000,6300,6000,6000],[1651622400000,6000,6280,6000,6280],[1651708800000,6145,6145,6145,6145],[1651795200000,6285,6285,6285,6285],[1652054400000,6010,6285,6010,6285],[1652140800000,6285,6285,6285,6285],[1652227200000,6245,6285,6245,6285],[1652313600000,6000,6000,6000,6000],[1652400000000,6245,6245,6240,6240],[1652659200000,6100,6100,6000,6000],[1652745600000,6000,6000,5550,5550],[1652832000000,5560,5560,5560,5560],[1652918400000,5975,5975,5975,5975],[1653004800000,6000,6000,6000,6000],[1653264000000,5600,6200,5600,6200],[1653436800000,6190,6195,6190,6195],[1653609600000,6000,6195,6000,6195],[1653868800000,6010,6010,6010,6010],[1653955200000,6010,6010,6010,6010],[1654041600000,6170,6170,6170,6170],[1654128000000,6170,6170,6170,6170],[1654214400000,6000,6000,6000,6000],[1654560000000,6000,6000,6000,6000],[1654646400000,6000,6000,6000,6000],[1654732800000,6000,6000,6000,6000],[1655078400000,5995,6195,5800,6150],[1655164800000,6150,6200,6145,6200],[1655251200000,6195,6200,6150,6200],[1655337600000,6190,6200,6190,6200],[1655424000000,6195,6200,6195,6200],[1655683200000,6200,6200,6200,6200],[1655769600000,5900,6250,5900,6250],[1656288000000,6250,6250,6250,6250],[1656374400000,6200,6250,6200,6250],[1656460800000,6200,6200,6200,6200],[1656547200000,6250,6295,6200,6295],[1656633600000,6295,6295,6295,6295],[1656892800000,6300,6300,6300,6300],[1656979200000,6300,6740,6300,6740],[1657065600000,6300,6735,6300,6735],[1657152000000,6735,6735,6735,6735],[1657238400000,6595,6720,6595,6595],[1657497600000,6600,6600,6560,6560],[1657584000000,6600,6600,6500,6500],[1657670400000,6300,6300,6300,6300],[1657756800000,6300,6300,6250,6250],[1657843200000,6250,6715,6250,6715],[1658102400000,6800,6800,6300,6305],[1658188800000,6300,6430,6300,6430],[1658361600000,6440,6440,6000,6000],[1658448000000,6000,6400,6000,6400],[1658880000000,6400,6400,6400,6400],[1658966400000,6200,6200,6100,6100],[1659312000000,6400,6430,6390,6430],[1659398400000,6430,6430,6430,6430],[1659484800000,6500,6600,6500,6600],[1659571200000,6550,6550,6550,6550],[1659657600000,6550,6900,6400,6900],[1660003200000,6900,6900,6400,6800],[1660089600000,6400,6800,6400,6400],[1660176000000,6800,6800,6405,6405],[1660262400000,6405,6405,6405,6405],[1660608000000,6405,6405,6405,6405],[1660694400000,6400,6400,6400,6400],[1660780800000,6700,6700,6700,6700],[1660867200000,6695,6695,6695,6695],[1661126400000,6695,6900,6695,6900],[1661212800000,6875,6875,6875,6875],[1661299200000,6800,6900,6800,6900],[1661472000000,6895,6895,6895,6895],[1661817600000,6800,6800,6800,6800],[1661904000000,6790,6890,6790,6890],[1661990400000,6790,6790,6790,6790],[1662076800000,6500,6500,6500,6500],[1662336000000,6790,6790,6790,6790],[1662422400000,6550,6750,6550,6550],[1662508800000,6550,6550,6500,6500],[1662595200000,6550,6600,6550,6580],[1662681600000,6750,6750,6750,6750],[1662940800000,6700,6700,6700,6700],[1663027200000,6690,6700,6690,6700],[1663200000000,6690,6690,6690,6690],[1663286400000,6690,6690,6690,6690],[1663545600000,6600,6600,6600,6600],[1663632000000,6605,6605,6590,6590],[1663718400000,6590,6590,6590,6590],[1663804800000,6590,6590,6500,6500],[1663891200000,6500,6500,6500,6500],[1664496000000,6695,6695,6505,6505],[1664755200000,6900,6900,6550,6550],[1664928000000,6550,6550,6550,6550],[1665014400000,6550,6600,6550,6600],[1665100800000,6700,6700,6600,6600],[1665360000000,6600,6600,6600,6600],[1665446400000,6600,6700,6600,6600],[1665532800000,6600,6600,6600,6600],[1665619200000,6600,6600,6500,6500],[1665705600000,6500,6600,6500,6600],[1665964800000,6500,6500,6500,6500],[1666051200000,6015,6370,6015,6370],[1666137600000,6400,6400,6400,6400],[1666224000000,6600,6600,6550,6550],[1666310400000,6550,6600,6500,6500],[1666656000000,6700,6700,6600,6600],[1666742400000,6600,6600,6600,6600],[1666828800000,6550,6550,6505,6505],[1666915200000,6500,6500,6500,6500],[1667174400000,6400,6400,6400,6400],[1667347200000,5925,6400,5925,6400],[1667433600000,6400,6400,6400,6400],[1667520000000,6400,6400,6400,6400],[1667779200000,6400,6400,6400,6400],[1667865600000,6500,6500,6500,6500],[1668038400000,6405,6405,6400,6400],[1668556800000,5920,6400,5920,6395],[1668643200000,6385,6390,6380,6390],[1668988800000,6390,6390,6390,6390],[1669075200000,6390,6390,6390,6390],[1669161600000,6200,6385,5915,6385],[1669248000000,6385,6390,6385,6390],[1669593600000,6380,6390,6380,6390],[1669680000000,6385,6385,6385,6385],[1670198400000,5910,6380,5910,6380],[1670544000000,5905,6600,5905,6600],[1670803200000,7000,7000,7000,7000],[1670889600000,6945,6950,6945,6950],[1670976000000,6430,6945,6430,6945],[1671148800000,6500,6995,6500,6995],[1671408000000,6950,6950,6950,6950],[1671494400000,6890,6990,6890,6990],[1671667200000,6975,6975,6975,6975],[1671753600000,6975,6975,6975,6975],[1672099200000,6550,6980,6550,6980],[1672185600000,6900,6980,6900,6980],[1672272000000,6900,6900,6900,6900],[1672358400000,6500,6850,6500,6850],[1672704000000,6840,6840,6840,6840],[1672790400000,6330,6330,6330,6330],[1672876800000,6330,6330,6330,6330],[1672963200000,6700,6700,6700,6700],[1673308800000,6330,6330,6330,6330],[1673395200000,6330,6330,6330,6330],[1673481600000,6330,6330,6330,6330],[1673568000000,6325,6325,6325,6325],[1673827200000,6325,6325,6295,6295],[1673913600000,6295,6300,6295,6300],[1674000000000,6200,6200,6200,6200],[1674086400000,6150,6150,6150,6150],[1674172800000,6100,6100,6100,6100],[1674432000000,6050,6050,6050,6050],[1674518400000,6000,6000,6000,6000],[1674604800000,6000,6000,6000,6000],[1674691200000,6000,6000,6000,6000],[1674777600000,5995,6000,5995,6000],[1675123200000,6000,6000,6000,6000],[1675209600000,6000,6000,6000,6000],[1675296000000,6000,6000,6000,6000],[1675382400000,6000,6000,6000,6000],[1675641600000,6000,6000,6000,6000],[1675728000000,6000,6000,5995,5995],[1675900800000,5895,5900,5895,5900],[1675987200000,5900,5900,5900,5900],[1676246400000,5785,5785,5785,5785],[1676332800000,5790,6150,5790,6150],[1676419200000,6150,6500,6150,6500],[1676592000000,6500,6500,6500,6500],[1676851200000,6400,6400,6400,6400],[1676937600000,6400,6400,6330,6330],[1677024000000,6330,6330,6330,6330],[1677110400000,6390,6390,6390,6390],[1677196800000,6330,6390,6330,6390],[1677456000000,6390,6390,6390,6390],[1677542400000,6390,6390,6390,6390],[1677628800000,6390,6495,6390,6495],[1677715200000,6350,6445,6350,6445],[1678060800000,6400,6440,6400,6440],[1678147200000,6400,6400,6400,6400],[1678233600000,6400,6400,6400,6400],[1678406400000,6200,6400,6200,6400],[1678665600000,6400,6400,6400,6400],[1678752000000,6440,6440,6440,6440],[1678838400000,6400,6435,6400,6435],[1678924800000,6440,6495,6440,6495],[1679011200000,6400,6495,6400,6495],[1679270400000,6440,6440,6440,6440],[1679356800000,6440,6440,6440,6440],[1679443200000,6410,6410,6410,6410],[1679529600000,6400,6400,6300,6300],[1679616000000,6410,6410,6300,6300]],"name":"Prices","type":"candlestick","name.1":"Prices","yAxis":0,"showInLegend":false,"upColor":"darkgreen","color":"red"},{"group":"down","data":[{"Date":"2022-03-29","Volume":59,"direction":"down","x":1648512000000,"y":59},{"Date":"2022-03-31","Volume":10,"direction":"down","x":1648684800000,"y":10},{"Date":"2022-04-05","Volume":40,"direction":"down","x":1649116800000,"y":40},{"Date":"2022-04-08","Volume":2105,"direction":"down","x":1649376000000,"y":2105},{"Date":"2022-04-12","Volume":365,"direction":"down","x":1649721600000,"y":365},{"Date":"2022-04-14","Volume":495,"direction":"down","x":1649894400000,"y":495},{"Date":"2022-04-19","Volume":20,"direction":"down","x":1650326400000,"y":20},{"Date":"2022-04-26","Volume":27,"direction":"down","x":1650931200000,"y":27},{"Date":"2022-05-05","Volume":5,"direction":"down","x":1651708800000,"y":5},{"Date":"2022-05-10","Volume":3,"direction":"down","x":1652140800000,"y":3},{"Date":"2022-05-13","Volume":42,"direction":"down","x":1652400000000,"y":42},{"Date":"2022-05-17","Volume":498,"direction":"down","x":1652745600000,"y":498},{"Date":"2022-05-18","Volume":10,"direction":"down","x":1652832000000,"y":10},{"Date":"2022-05-19","Volume":1,"direction":"down","x":1652918400000,"y":1},{"Date":"2022-05-23","Volume":213,"direction":"down","x":1653264000000,"y":213},{"Date":"2022-05-25","Volume":100,"direction":"down","x":1653436800000,"y":100},{"Date":"2022-05-30","Volume":50,"direction":"down","x":1653868800000,"y":50},{"Date":"2022-05-31","Volume":20,"direction":"down","x":1653955200000,"y":20},{"Date":"2022-06-03","Volume":11,"direction":"down","x":1654214400000,"y":11},{"Date":"2022-06-08","Volume":37,"direction":"down","x":1654646400000,"y":37},{"Date":"2022-06-16","Volume":501,"direction":"down","x":1655337600000,"y":501},{"Date":"2022-06-20","Volume":276,"direction":"down","x":1655683200000,"y":276},{"Date":"2022-06-21","Volume":152,"direction":"down","x":1655769600000,"y":152},{"Date":"2022-06-27","Volume":105,"direction":"down","x":1656288000000,"y":105},{"Date":"2022-06-29","Volume":100,"direction":"down","x":1656460800000,"y":100},{"Date":"2022-07-01","Volume":6,"direction":"down","x":1656633600000,"y":6},{"Date":"2022-07-06","Volume":31,"direction":"down","x":1657065600000,"y":31},{"Date":"2022-07-07","Volume":6,"direction":"down","x":1657152000000,"y":6},{"Date":"2022-07-11","Volume":266,"direction":"down","x":1657497600000,"y":266},{"Date":"2022-07-12","Volume":67,"direction":"down","x":1657584000000,"y":67},{"Date":"2022-07-14","Volume":38,"direction":"down","x":1657756800000,"y":38},{"Date":"2022-07-18","Volume":69,"direction":"down","x":1658102400000,"y":69},{"Date":"2022-07-21","Volume":90,"direction":"down","x":1658361600000,"y":90},{"Date":"2022-07-27","Volume":1,"direction":"down","x":1658880000000,"y":1},{"Date":"2022-08-02","Volume":868,"direction":"down","x":1659398400000,"y":868},{"Date":"2022-08-03","Volume":26,"direction":"down","x":1659484800000,"y":26},{"Date":"2022-08-04","Volume":14,"direction":"down","x":1659571200000,"y":14},{"Date":"2022-08-09","Volume":146,"direction":"down","x":1660003200000,"y":146},{"Date":"2022-08-10","Volume":65,"direction":"down","x":1660089600000,"y":65},{"Date":"2022-08-11","Volume":31,"direction":"down","x":1660176000000,"y":31},{"Date":"2022-08-12","Volume":2,"direction":"down","x":1660262400000,"y":2},{"Date":"2022-08-18","Volume":5,"direction":"down","x":1660780800000,"y":5},{"Date":"2022-08-23","Volume":18,"direction":"down","x":1661212800000,"y":18},{"Date":"2022-08-26","Volume":15,"direction":"down","x":1661472000000,"y":15},{"Date":"2022-08-30","Volume":5,"direction":"down","x":1661817600000,"y":5},{"Date":"2022-09-01","Volume":50,"direction":"down","x":1661990400000,"y":50},{"Date":"2022-09-06","Volume":168,"direction":"down","x":1662422400000,"y":168},{"Date":"2022-09-08","Volume":142,"direction":"down","x":1662595200000,"y":142},{"Date":"2022-09-09","Volume":12,"direction":"down","x":1662681600000,"y":12},{"Date":"2022-09-15","Volume":25,"direction":"down","x":1663200000000,"y":25},{"Date":"2022-09-16","Volume":15,"direction":"down","x":1663286400000,"y":15},{"Date":"2022-09-21","Volume":10,"direction":"down","x":1663718400000,"y":10},{"Date":"2022-09-23","Volume":8,"direction":"down","x":1663891200000,"y":8},{"Date":"2022-10-05","Volume":5,"direction":"down","x":1664928000000,"y":5},{"Date":"2022-10-07","Volume":15,"direction":"down","x":1665100800000,"y":15},{"Date":"2022-10-10","Volume":5,"direction":"down","x":1665360000000,"y":5},{"Date":"2022-10-12","Volume":100,"direction":"down","x":1665532800000,"y":100},{"Date":"2022-10-14","Volume":96,"direction":"down","x":1665705600000,"y":96},{"Date":"2022-10-17","Volume":7,"direction":"down","x":1665964800000,"y":7},{"Date":"2022-10-21","Volume":299,"direction":"down","x":1666310400000,"y":299},{"Date":"2022-10-25","Volume":4,"direction":"down","x":1666656000000,"y":4},{"Date":"2022-10-27","Volume":510,"direction":"down","x":1666828800000,"y":510},{"Date":"2022-10-28","Volume":15,"direction":"down","x":1666915200000,"y":15},{"Date":"2022-11-03","Volume":490,"direction":"down","x":1667433600000,"y":490},{"Date":"2022-11-04","Volume":27,"direction":"down","x":1667520000000,"y":27},{"Date":"2022-11-08","Volume":17,"direction":"down","x":1667865600000,"y":17},{"Date":"2022-11-17","Volume":1107,"direction":"down","x":1668643200000,"y":1107},{"Date":"2022-11-22","Volume":10,"direction":"down","x":1669075200000,"y":10},{"Date":"2022-11-28","Volume":26,"direction":"down","x":1669593600000,"y":26},{"Date":"2022-11-29","Volume":2,"direction":"down","x":1669680000000,"y":2},{"Date":"2022-12-13","Volume":103,"direction":"down","x":1670889600000,"y":103},{"Date":"2022-12-14","Volume":42,"direction":"down","x":1670976000000,"y":42},{"Date":"2022-12-19","Volume":15,"direction":"down","x":1671408000000,"y":15},{"Date":"2022-12-22","Volume":1,"direction":"down","x":1671667200000,"y":1},{"Date":"2022-12-28","Volume":2346,"direction":"down","x":1672185600000,"y":2346},{"Date":"2022-12-29","Volume":15,"direction":"down","x":1672272000000,"y":15},{"Date":"2023-01-03","Volume":5,"direction":"down","x":1672704000000,"y":5},{"Date":"2023-01-05","Volume":5,"direction":"down","x":1672876800000,"y":5},{"Date":"2023-01-13","Volume":4,"direction":"down","x":1673568000000,"y":4},{"Date":"2023-01-19","Volume":5,"direction":"down","x":1674086400000,"y":5},{"Date":"2023-01-23","Volume":59,"direction":"down","x":1674432000000,"y":59},{"Date":"2023-01-25","Volume":110,"direction":"down","x":1674604800000,"y":110},{"Date":"2023-01-27","Volume":516,"direction":"down","x":1674777600000,"y":516},{"Date":"2023-01-31","Volume":268,"direction":"down","x":1675123200000,"y":268},{"Date":"2023-02-01","Volume":116,"direction":"down","x":1675209600000,"y":116},{"Date":"2023-02-02","Volume":70,"direction":"down","x":1675296000000,"y":70},{"Date":"2023-02-03","Volume":27,"direction":"down","x":1675382400000,"y":27},{"Date":"2023-02-06","Volume":12,"direction":"down","x":1675641600000,"y":12},{"Date":"2023-02-10","Volume":10,"direction":"down","x":1675987200000,"y":10},{"Date":"2023-02-14","Volume":223,"direction":"down","x":1676332800000,"y":223},{"Date":"2023-02-20","Volume":12,"direction":"down","x":1676851200000,"y":12},{"Date":"2023-02-22","Volume":290,"direction":"down","x":1677024000000,"y":290},{"Date":"2023-02-23","Volume":3,"direction":"down","x":1677110400000,"y":3},{"Date":"2023-02-27","Volume":601,"direction":"down","x":1677456000000,"y":601},{"Date":"2023-02-28","Volume":115,"direction":"down","x":1677542400000,"y":115},{"Date":"2023-03-01","Volume":7,"direction":"down","x":1677628800000,"y":7},{"Date":"2023-03-07","Volume":2,"direction":"down","x":1678147200000,"y":2},{"Date":"2023-03-13","Volume":32,"direction":"down","x":1678665600000,"y":32},{"Date":"2023-03-16","Volume":77,"direction":"down","x":1678924800000,"y":77},{"Date":"2023-03-21","Volume":71,"direction":"down","x":1679356800000,"y":71},{"Date":"2023-03-23","Volume":275,"direction":"down","x":1679529600000,"y":275}],"type":"column","name":"Volume","yAxis":1,"showInLegend":false},{"group":"up","data":[{"Date":"2022-03-30","Volume":630,"direction":"up","x":1648598400000,"y":630},{"Date":"2022-04-01","Volume":46,"direction":"up","x":1648771200000,"y":46},{"Date":"2022-04-04","Volume":2636,"direction":"up","x":1649030400000,"y":2636},{"Date":"2022-04-06","Volume":165,"direction":"up","x":1649203200000,"y":165},{"Date":"2022-04-07","Volume":15417,"direction":"up","x":1649289600000,"y":15417},{"Date":"2022-04-11","Volume":2401,"direction":"up","x":1649635200000,"y":2401},{"Date":"2022-04-13","Volume":990,"direction":"up","x":1649808000000,"y":990},{"Date":"2022-04-15","Volume":935,"direction":"up","x":1649980800000,"y":935},{"Date":"2022-04-20","Volume":144,"direction":"up","x":1650412800000,"y":144},{"Date":"2022-04-21","Volume":341,"direction":"up","x":1650499200000,"y":341},{"Date":"2022-04-22","Volume":3000,"direction":"up","x":1650585600000,"y":3000},{"Date":"2022-04-25","Volume":23294,"direction":"up","x":1650844800000,"y":23294},{"Date":"2022-04-29","Volume":112,"direction":"up","x":1651190400000,"y":112},{"Date":"2022-05-03","Volume":143,"direction":"up","x":1651536000000,"y":143},{"Date":"2022-05-04","Volume":821,"direction":"up","x":1651622400000,"y":821},{"Date":"2022-05-06","Volume":6,"direction":"up","x":1651795200000,"y":6},{"Date":"2022-05-09","Volume":56,"direction":"up","x":1652054400000,"y":56},{"Date":"2022-05-11","Volume":89,"direction":"up","x":1652227200000,"y":89},{"Date":"2022-05-12","Volume":592,"direction":"up","x":1652313600000,"y":592},{"Date":"2022-05-16","Volume":1106,"direction":"up","x":1652659200000,"y":1106},{"Date":"2022-05-20","Volume":500,"direction":"up","x":1653004800000,"y":500},{"Date":"2022-05-27","Volume":610,"direction":"up","x":1653609600000,"y":610},{"Date":"2022-06-01","Volume":30,"direction":"up","x":1654041600000,"y":30},{"Date":"2022-06-02","Volume":36,"direction":"up","x":1654128000000,"y":36},{"Date":"2022-06-07","Volume":108,"direction":"up","x":1654560000000,"y":108},{"Date":"2022-06-09","Volume":50,"direction":"up","x":1654732800000,"y":50},{"Date":"2022-06-13","Volume":444,"direction":"up","x":1655078400000,"y":444},{"Date":"2022-06-14","Volume":1503,"direction":"up","x":1655164800000,"y":1503},{"Date":"2022-06-15","Volume":2012,"direction":"up","x":1655251200000,"y":2012},{"Date":"2022-06-17","Volume":594,"direction":"up","x":1655424000000,"y":594},{"Date":"2022-06-28","Volume":506,"direction":"up","x":1656374400000,"y":506},{"Date":"2022-06-30","Volume":1187,"direction":"up","x":1656547200000,"y":1187},{"Date":"2022-07-04","Volume":110,"direction":"up","x":1656892800000,"y":110},{"Date":"2022-07-05","Volume":141,"direction":"up","x":1656979200000,"y":141},{"Date":"2022-07-08","Volume":384,"direction":"up","x":1657238400000,"y":384},{"Date":"2022-07-13","Volume":2033,"direction":"up","x":1657670400000,"y":2033},{"Date":"2022-07-15","Volume":1483,"direction":"up","x":1657843200000,"y":1483},{"Date":"2022-07-19","Volume":4860,"direction":"up","x":1658188800000,"y":4860},{"Date":"2022-07-22","Volume":401,"direction":"up","x":1658448000000,"y":401},{"Date":"2022-07-28","Volume":150,"direction":"up","x":1658966400000,"y":150},{"Date":"2022-08-01","Volume":1248,"direction":"up","x":1659312000000,"y":1248},{"Date":"2022-08-05","Volume":385,"direction":"up","x":1659657600000,"y":385},{"Date":"2022-08-16","Volume":40,"direction":"up","x":1660608000000,"y":40},{"Date":"2022-08-17","Volume":100,"direction":"up","x":1660694400000,"y":100},{"Date":"2022-08-19","Volume":50,"direction":"up","x":1660867200000,"y":50},{"Date":"2022-08-22","Volume":860,"direction":"up","x":1661126400000,"y":860},{"Date":"2022-08-24","Volume":115,"direction":"up","x":1661299200000,"y":115},{"Date":"2022-08-31","Volume":489,"direction":"up","x":1661904000000,"y":489},{"Date":"2022-09-02","Volume":117,"direction":"up","x":1662076800000,"y":117},{"Date":"2022-09-05","Volume":442,"direction":"up","x":1662336000000,"y":442},{"Date":"2022-09-07","Volume":319,"direction":"up","x":1662508800000,"y":319},{"Date":"2022-09-12","Volume":60,"direction":"up","x":1662940800000,"y":60},{"Date":"2022-09-13","Volume":100,"direction":"up","x":1663027200000,"y":100},{"Date":"2022-09-19","Volume":175,"direction":"up","x":1663545600000,"y":175},{"Date":"2022-09-20","Volume":681,"direction":"up","x":1663632000000,"y":681},{"Date":"2022-09-22","Volume":30,"direction":"up","x":1663804800000,"y":30},{"Date":"2022-09-30","Volume":450,"direction":"up","x":1664496000000,"y":450},{"Date":"2022-10-03","Volume":632,"direction":"up","x":1664755200000,"y":632},{"Date":"2022-10-06","Volume":45,"direction":"up","x":1665014400000,"y":45},{"Date":"2022-10-11","Volume":2925,"direction":"up","x":1665446400000,"y":2925},{"Date":"2022-10-13","Volume":962,"direction":"up","x":1665619200000,"y":962},{"Date":"2022-10-18","Volume":16,"direction":"up","x":1666051200000,"y":16},{"Date":"2022-10-19","Volume":45,"direction":"up","x":1666137600000,"y":45},{"Date":"2022-10-20","Volume":1092,"direction":"up","x":1666224000000,"y":1092},{"Date":"2022-10-26","Volume":3814,"direction":"up","x":1666742400000,"y":3814},{"Date":"2022-10-31","Volume":20,"direction":"up","x":1667174400000,"y":20},{"Date":"2022-11-02","Volume":3010,"direction":"up","x":1667347200000,"y":3010},{"Date":"2022-11-07","Volume":54,"direction":"up","x":1667779200000,"y":54},{"Date":"2022-11-10","Volume":70,"direction":"up","x":1668038400000,"y":70},{"Date":"2022-11-16","Volume":1425,"direction":"up","x":1668556800000,"y":1425},{"Date":"2022-11-21","Volume":1500,"direction":"up","x":1668988800000,"y":1500},{"Date":"2022-11-23","Volume":91,"direction":"up","x":1669161600000,"y":91},{"Date":"2022-11-24","Volume":150,"direction":"up","x":1669248000000,"y":150},{"Date":"2022-12-05","Volume":66,"direction":"up","x":1670198400000,"y":66},{"Date":"2022-12-09","Volume":1580,"direction":"up","x":1670544000000,"y":1580},{"Date":"2022-12-12","Volume":14620,"direction":"up","x":1670803200000,"y":14620},{"Date":"2022-12-16","Volume":4157,"direction":"up","x":1671148800000,"y":4157},{"Date":"2022-12-20","Volume":893,"direction":"up","x":1671494400000,"y":893},{"Date":"2022-12-23","Volume":1,"direction":"up","x":1671753600000,"y":1},{"Date":"2022-12-27","Volume":3910,"direction":"up","x":1672099200000,"y":3910},{"Date":"2022-12-30","Volume":40,"direction":"up","x":1672358400000,"y":40},{"Date":"2023-01-04","Volume":88,"direction":"up","x":1672790400000,"y":88},{"Date":"2023-01-06","Volume":65,"direction":"up","x":1672963200000,"y":65},{"Date":"2023-01-10","Volume":160,"direction":"up","x":1673308800000,"y":160},{"Date":"2023-01-11","Volume":160,"direction":"up","x":1673395200000,"y":160},{"Date":"2023-01-12","Volume":923,"direction":"up","x":1673481600000,"y":923},{"Date":"2023-01-16","Volume":28,"direction":"up","x":1673827200000,"y":28},{"Date":"2023-01-17","Volume":55,"direction":"up","x":1673913600000,"y":55},{"Date":"2023-01-18","Volume":1465,"direction":"up","x":1674000000000,"y":1465},{"Date":"2023-01-20","Volume":524,"direction":"up","x":1674172800000,"y":524},{"Date":"2023-01-24","Volume":1059,"direction":"up","x":1674518400000,"y":1059},{"Date":"2023-01-26","Volume":1650,"direction":"up","x":1674691200000,"y":1650},{"Date":"2023-02-07","Volume":220,"direction":"up","x":1675728000000,"y":220},{"Date":"2023-02-09","Volume":2061,"direction":"up","x":1675900800000,"y":2061},{"Date":"2023-02-13","Volume":1264,"direction":"up","x":1676246400000,"y":1264},{"Date":"2023-02-15","Volume":333,"direction":"up","x":1676419200000,"y":333},{"Date":"2023-02-17","Volume":498,"direction":"up","x":1676592000000,"y":498},{"Date":"2023-02-21","Volume":636,"direction":"up","x":1676937600000,"y":636},{"Date":"2023-02-24","Volume":1074,"direction":"up","x":1677196800000,"y":1074},{"Date":"2023-03-02","Volume":11,"direction":"up","x":1677715200000,"y":11},{"Date":"2023-03-06","Volume":6385,"direction":"up","x":1678060800000,"y":6385},{"Date":"2023-03-08","Volume":36,"direction":"up","x":1678233600000,"y":36},{"Date":"2023-03-10","Volume":709,"direction":"up","x":1678406400000,"y":709},{"Date":"2023-03-14","Volume":32,"direction":"up","x":1678752000000,"y":32},{"Date":"2023-03-15","Volume":448,"direction":"up","x":1678838400000,"y":448},{"Date":"2023-03-17","Volume":794,"direction":"up","x":1679011200000,"y":794},{"Date":"2023-03-20","Volume":868,"direction":"up","x":1679270400000,"y":868},{"Date":"2023-03-22","Volume":1943,"direction":"up","x":1679443200000,"y":1943},{"Date":"2023-03-24","Volume":550,"direction":"up","x":1679616000000,"y":550}],"type":"column","name":"Volume","yAxis":1,"showInLegend":false},{"group":null,"data":[{"Date":"2022-03-28","Volume":1006,"direction":null,"x":1648425600000,"y":1006}],"type":"column","name":"Volume","yAxis":1,"showInLegend":false}],"colors":["red","darkgreen"]},"theme":{"chart":{"backgroundColor":"transparent"},"colors":["#7cb5ec","#434348","#90ed7d","#f7a35c","#8085e9","#f15c80","#e4d354","#2b908f","#f45b5b","#91e8e1"]},"conf_opts":{"global":{"Date":null,"VMLRadialGradientURL":"http =//code.highcharts.com/list(version)/gfx/vml-radial-gradient.png","canvasToolsURL":"http =//code.highcharts.com/list(version)/modules/canvas-tools.js","getTimezoneOffset":null,"timezoneOffset":0,"useUTC":true},"lang":{"contextButtonTitle":"Chart context menu","decimalPoint":".","downloadCSV":"Download CSV","downloadJPEG":"Download JPEG image","downloadPDF":"Download PDF document","downloadPNG":"Download PNG image","downloadSVG":"Download SVG vector image","downloadXLS":"Download XLS","drillUpText":"◁ Back to {series.name}","exitFullscreen":"Exit from full screen","exportData":{"annotationHeader":"Annotations","categoryDatetimeHeader":"DateTime","categoryHeader":"Category"},"hideData":"Hide data table","invalidDate":null,"loading":"Loading...","months":["January","February","March","April","May","June","July","August","September","October","November","December"],"noData":"No data to display","numericSymbolMagnitude":1000,"numericSymbols":["k","M","G","T","P","E"],"printChart":"Print chart","resetZoom":"Reset zoom","resetZoomTitle":"Reset zoom level 1:1","shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"shortWeekdays":["Sat","Sun","Mon","Tue","Wed","Thu","Fri"],"thousandsSep":" ","viewData":"View data table","viewFullscreen":"View in full screen","weekdays":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]}},"type":"stock","fonts":"Erica+One","debug":false},"evals":[],"jsHooks":[]}</script>

# You can specify your color like 
# `BRVM_plot("boas", up.col = "blue", down.col = "pink")` for example




#It is also possible to plot stock data chart for more than one ticker
#Let's plot BICC, ETIT and BOAM stock data

chart1 <- BRVM_plot(c("BICC","ETIT", "BOAM"))
#> [1] "BICC" "ETIT" "BOAM"

chart1
```


<div class="highchart html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-94638f67b463f19abf54" style="width:100%;height:576px;"></div>
<script type="application/json" data-for="htmlwidget-94638f67b463f19abf54">{"x":{"hc_opts":{"chart":{"reflow":true},"title":{"text":"Tickers line chart from 2022-03-26 to 2023-03-25"},"yAxis":{"title":{"text":null}},"credits":{"enabled":false},"exporting":{"enabled":true,"filename":"Tickers line chart from 2022-03-26 to 2023-03-25"},"boost":{"enabled":false},"plotOptions":{"series":{"label":{"enabled":false},"turboThreshold":0},"treemap":{"layoutAlgorithm":"squarified"}},"series":[{"name":"BICC","data":[{"Date":"2022-03-28","Open":5815,"High":6400,"Low":5700,"Close":6400,"Volume":1006,"Ticker":"BICC","x":1648425600000,"y":6400},{"Date":"2022-03-29","Open":6390,"High":6390,"Low":6070,"Close":6070,"Volume":59,"Ticker":"BICC","x":1648512000000,"y":6070},{"Date":"2022-03-30","Open":6395,"High":6400,"Low":6390,"Close":6390,"Volume":630,"Ticker":"BICC","x":1648598400000,"y":6390},{"Date":"2022-03-31","Open":6390,"High":6395,"Low":6390,"Close":6395,"Volume":10,"Ticker":"BICC","x":1648684800000,"y":6395},{"Date":"2022-04-01","Open":6300,"High":6300,"Low":6000,"Close":6000,"Volume":46,"Ticker":"BICC","x":1648771200000,"y":6000},{"Date":"2022-04-04","Open":5900,"High":5900,"Low":5700,"Close":5900,"Volume":2636,"Ticker":"BICC","x":1649030400000,"y":5900},{"Date":"2022-04-05","Open":6000,"High":6340,"Low":5850,"Close":6340,"Volume":40,"Ticker":"BICC","x":1649116800000,"y":6340},{"Date":"2022-04-06","Open":6340,"High":6340,"Low":6335,"Close":6335,"Volume":165,"Ticker":"BICC","x":1649203200000,"y":6335},{"Date":"2022-04-07","Open":6330,"High":6340,"Low":5880,"Close":6340,"Volume":15417,"Ticker":"BICC","x":1649289600000,"y":6340},{"Date":"2022-04-08","Open":6340,"High":6340,"Low":6250,"Close":6250,"Volume":2105,"Ticker":"BICC","x":1649376000000,"y":6250},{"Date":"2022-04-11","Open":6000,"High":6000,"Low":6000,"Close":6000,"Volume":2401,"Ticker":"BICC","x":1649635200000,"y":6000},{"Date":"2022-04-12","Open":6000,"High":6000,"Low":5820,"Close":6000,"Volume":365,"Ticker":"BICC","x":1649721600000,"y":6000},{"Date":"2022-04-13","Open":6000,"High":6295,"Low":6000,"Close":6295,"Volume":990,"Ticker":"BICC","x":1649808000000,"y":6295},{"Date":"2022-04-14","Open":6250,"High":6295,"Low":6250,"Close":6295,"Volume":495,"Ticker":"BICC","x":1649894400000,"y":6295},{"Date":"2022-04-15","Open":6285,"High":6350,"Low":6000,"Close":6350,"Volume":935,"Ticker":"BICC","x":1649980800000,"y":6350},{"Date":"2022-04-19","Open":6200,"High":6200,"Low":6200,"Close":6200,"Volume":20,"Ticker":"BICC","x":1650326400000,"y":6200},{"Date":"2022-04-20","Open":6200,"High":6200,"Low":5955,"Close":5955,"Volume":144,"Ticker":"BICC","x":1650412800000,"y":5955},{"Date":"2022-04-21","Open":6335,"High":6335,"Low":6300,"Close":6300,"Volume":341,"Ticker":"BICC","x":1650499200000,"y":6300},{"Date":"2022-04-22","Open":6250,"High":6300,"Low":6000,"Close":6000,"Volume":3000,"Ticker":"BICC","x":1650585600000,"y":6000},{"Date":"2022-04-25","Open":6000,"High":6300,"Low":6000,"Close":6300,"Volume":23294,"Ticker":"BICC","x":1650844800000,"y":6300},{"Date":"2022-04-26","Open":6300,"High":6300,"Low":6300,"Close":6300,"Volume":27,"Ticker":"BICC","x":1650931200000,"y":6300},{"Date":"2022-04-29","Open":6200,"High":6200,"Low":6200,"Close":6200,"Volume":112,"Ticker":"BICC","x":1651190400000,"y":6200},{"Date":"2022-05-03","Open":6000,"High":6300,"Low":6000,"Close":6000,"Volume":143,"Ticker":"BICC","x":1651536000000,"y":6000},{"Date":"2022-05-04","Open":6000,"High":6280,"Low":6000,"Close":6280,"Volume":821,"Ticker":"BICC","x":1651622400000,"y":6280},{"Date":"2022-05-05","Open":6145,"High":6145,"Low":6145,"Close":6145,"Volume":5,"Ticker":"BICC","x":1651708800000,"y":6145},{"Date":"2022-05-06","Open":6285,"High":6285,"Low":6285,"Close":6285,"Volume":6,"Ticker":"BICC","x":1651795200000,"y":6285},{"Date":"2022-05-09","Open":6010,"High":6285,"Low":6010,"Close":6285,"Volume":56,"Ticker":"BICC","x":1652054400000,"y":6285},{"Date":"2022-05-10","Open":6285,"High":6285,"Low":6285,"Close":6285,"Volume":3,"Ticker":"BICC","x":1652140800000,"y":6285},{"Date":"2022-05-11","Open":6245,"High":6285,"Low":6245,"Close":6285,"Volume":89,"Ticker":"BICC","x":1652227200000,"y":6285},{"Date":"2022-05-12","Open":6000,"High":6000,"Low":6000,"Close":6000,"Volume":592,"Ticker":"BICC","x":1652313600000,"y":6000},{"Date":"2022-05-13","Open":6245,"High":6245,"Low":6240,"Close":6240,"Volume":42,"Ticker":"BICC","x":1652400000000,"y":6240},{"Date":"2022-05-16","Open":6100,"High":6100,"Low":6000,"Close":6000,"Volume":1106,"Ticker":"BICC","x":1652659200000,"y":6000},{"Date":"2022-05-17","Open":6000,"High":6000,"Low":5550,"Close":5550,"Volume":498,"Ticker":"BICC","x":1652745600000,"y":5550},{"Date":"2022-05-18","Open":5560,"High":5560,"Low":5560,"Close":5560,"Volume":10,"Ticker":"BICC","x":1652832000000,"y":5560},{"Date":"2022-05-19","Open":5975,"High":5975,"Low":5975,"Close":5975,"Volume":1,"Ticker":"BICC","x":1652918400000,"y":5975},{"Date":"2022-05-20","Open":6000,"High":6000,"Low":6000,"Close":6000,"Volume":500,"Ticker":"BICC","x":1653004800000,"y":6000},{"Date":"2022-05-23","Open":5600,"High":6200,"Low":5600,"Close":6200,"Volume":213,"Ticker":"BICC","x":1653264000000,"y":6200},{"Date":"2022-05-25","Open":6190,"High":6195,"Low":6190,"Close":6195,"Volume":100,"Ticker":"BICC","x":1653436800000,"y":6195},{"Date":"2022-05-27","Open":6000,"High":6195,"Low":6000,"Close":6195,"Volume":610,"Ticker":"BICC","x":1653609600000,"y":6195},{"Date":"2022-05-30","Open":6010,"High":6010,"Low":6010,"Close":6010,"Volume":50,"Ticker":"BICC","x":1653868800000,"y":6010},{"Date":"2022-05-31","Open":6010,"High":6010,"Low":6010,"Close":6010,"Volume":20,"Ticker":"BICC","x":1653955200000,"y":6010},{"Date":"2022-06-01","Open":6170,"High":6170,"Low":6170,"Close":6170,"Volume":30,"Ticker":"BICC","x":1654041600000,"y":6170},{"Date":"2022-06-02","Open":6170,"High":6170,"Low":6170,"Close":6170,"Volume":36,"Ticker":"BICC","x":1654128000000,"y":6170},{"Date":"2022-06-03","Open":6000,"High":6000,"Low":6000,"Close":6000,"Volume":11,"Ticker":"BICC","x":1654214400000,"y":6000},{"Date":"2022-06-07","Open":6000,"High":6000,"Low":6000,"Close":6000,"Volume":108,"Ticker":"BICC","x":1654560000000,"y":6000},{"Date":"2022-06-08","Open":6000,"High":6000,"Low":6000,"Close":6000,"Volume":37,"Ticker":"BICC","x":1654646400000,"y":6000},{"Date":"2022-06-09","Open":6000,"High":6000,"Low":6000,"Close":6000,"Volume":50,"Ticker":"BICC","x":1654732800000,"y":6000},{"Date":"2022-06-13","Open":5995,"High":6195,"Low":5800,"Close":6150,"Volume":444,"Ticker":"BICC","x":1655078400000,"y":6150},{"Date":"2022-06-14","Open":6150,"High":6200,"Low":6145,"Close":6200,"Volume":1503,"Ticker":"BICC","x":1655164800000,"y":6200},{"Date":"2022-06-15","Open":6195,"High":6200,"Low":6150,"Close":6200,"Volume":2012,"Ticker":"BICC","x":1655251200000,"y":6200},{"Date":"2022-06-16","Open":6190,"High":6200,"Low":6190,"Close":6200,"Volume":501,"Ticker":"BICC","x":1655337600000,"y":6200},{"Date":"2022-06-17","Open":6195,"High":6200,"Low":6195,"Close":6200,"Volume":594,"Ticker":"BICC","x":1655424000000,"y":6200},{"Date":"2022-06-20","Open":6200,"High":6200,"Low":6200,"Close":6200,"Volume":276,"Ticker":"BICC","x":1655683200000,"y":6200},{"Date":"2022-06-21","Open":5900,"High":6250,"Low":5900,"Close":6250,"Volume":152,"Ticker":"BICC","x":1655769600000,"y":6250},{"Date":"2022-06-27","Open":6250,"High":6250,"Low":6250,"Close":6250,"Volume":105,"Ticker":"BICC","x":1656288000000,"y":6250},{"Date":"2022-06-28","Open":6200,"High":6250,"Low":6200,"Close":6250,"Volume":506,"Ticker":"BICC","x":1656374400000,"y":6250},{"Date":"2022-06-29","Open":6200,"High":6200,"Low":6200,"Close":6200,"Volume":100,"Ticker":"BICC","x":1656460800000,"y":6200},{"Date":"2022-06-30","Open":6250,"High":6295,"Low":6200,"Close":6295,"Volume":1187,"Ticker":"BICC","x":1656547200000,"y":6295},{"Date":"2022-07-01","Open":6295,"High":6295,"Low":6295,"Close":6295,"Volume":6,"Ticker":"BICC","x":1656633600000,"y":6295},{"Date":"2022-07-04","Open":6300,"High":6300,"Low":6300,"Close":6300,"Volume":110,"Ticker":"BICC","x":1656892800000,"y":6300},{"Date":"2022-07-05","Open":6300,"High":6740,"Low":6300,"Close":6740,"Volume":141,"Ticker":"BICC","x":1656979200000,"y":6740},{"Date":"2022-07-06","Open":6300,"High":6735,"Low":6300,"Close":6735,"Volume":31,"Ticker":"BICC","x":1657065600000,"y":6735},{"Date":"2022-07-07","Open":6735,"High":6735,"Low":6735,"Close":6735,"Volume":6,"Ticker":"BICC","x":1657152000000,"y":6735},{"Date":"2022-07-08","Open":6595,"High":6720,"Low":6595,"Close":6595,"Volume":384,"Ticker":"BICC","x":1657238400000,"y":6595},{"Date":"2022-07-11","Open":6600,"High":6600,"Low":6560,"Close":6560,"Volume":266,"Ticker":"BICC","x":1657497600000,"y":6560},{"Date":"2022-07-12","Open":6600,"High":6600,"Low":6500,"Close":6500,"Volume":67,"Ticker":"BICC","x":1657584000000,"y":6500},{"Date":"2022-07-13","Open":6300,"High":6300,"Low":6300,"Close":6300,"Volume":2033,"Ticker":"BICC","x":1657670400000,"y":6300},{"Date":"2022-07-14","Open":6300,"High":6300,"Low":6250,"Close":6250,"Volume":38,"Ticker":"BICC","x":1657756800000,"y":6250},{"Date":"2022-07-15","Open":6250,"High":6715,"Low":6250,"Close":6715,"Volume":1483,"Ticker":"BICC","x":1657843200000,"y":6715},{"Date":"2022-07-18","Open":6800,"High":6800,"Low":6300,"Close":6305,"Volume":69,"Ticker":"BICC","x":1658102400000,"y":6305},{"Date":"2022-07-19","Open":6300,"High":6430,"Low":6300,"Close":6430,"Volume":4860,"Ticker":"BICC","x":1658188800000,"y":6430},{"Date":"2022-07-21","Open":6440,"High":6440,"Low":6000,"Close":6000,"Volume":90,"Ticker":"BICC","x":1658361600000,"y":6000},{"Date":"2022-07-22","Open":6000,"High":6400,"Low":6000,"Close":6400,"Volume":401,"Ticker":"BICC","x":1658448000000,"y":6400},{"Date":"2022-07-27","Open":6400,"High":6400,"Low":6400,"Close":6400,"Volume":1,"Ticker":"BICC","x":1658880000000,"y":6400},{"Date":"2022-07-28","Open":6200,"High":6200,"Low":6100,"Close":6100,"Volume":150,"Ticker":"BICC","x":1658966400000,"y":6100},{"Date":"2022-08-01","Open":6400,"High":6430,"Low":6390,"Close":6430,"Volume":1248,"Ticker":"BICC","x":1659312000000,"y":6430},{"Date":"2022-08-02","Open":6430,"High":6430,"Low":6430,"Close":6430,"Volume":868,"Ticker":"BICC","x":1659398400000,"y":6430},{"Date":"2022-08-03","Open":6500,"High":6600,"Low":6500,"Close":6600,"Volume":26,"Ticker":"BICC","x":1659484800000,"y":6600},{"Date":"2022-08-04","Open":6550,"High":6550,"Low":6550,"Close":6550,"Volume":14,"Ticker":"BICC","x":1659571200000,"y":6550},{"Date":"2022-08-05","Open":6550,"High":6900,"Low":6400,"Close":6900,"Volume":385,"Ticker":"BICC","x":1659657600000,"y":6900},{"Date":"2022-08-09","Open":6900,"High":6900,"Low":6400,"Close":6800,"Volume":146,"Ticker":"BICC","x":1660003200000,"y":6800},{"Date":"2022-08-10","Open":6400,"High":6800,"Low":6400,"Close":6400,"Volume":65,"Ticker":"BICC","x":1660089600000,"y":6400},{"Date":"2022-08-11","Open":6800,"High":6800,"Low":6405,"Close":6405,"Volume":31,"Ticker":"BICC","x":1660176000000,"y":6405},{"Date":"2022-08-12","Open":6405,"High":6405,"Low":6405,"Close":6405,"Volume":2,"Ticker":"BICC","x":1660262400000,"y":6405},{"Date":"2022-08-16","Open":6405,"High":6405,"Low":6405,"Close":6405,"Volume":40,"Ticker":"BICC","x":1660608000000,"y":6405},{"Date":"2022-08-17","Open":6400,"High":6400,"Low":6400,"Close":6400,"Volume":100,"Ticker":"BICC","x":1660694400000,"y":6400},{"Date":"2022-08-18","Open":6700,"High":6700,"Low":6700,"Close":6700,"Volume":5,"Ticker":"BICC","x":1660780800000,"y":6700},{"Date":"2022-08-19","Open":6695,"High":6695,"Low":6695,"Close":6695,"Volume":50,"Ticker":"BICC","x":1660867200000,"y":6695},{"Date":"2022-08-22","Open":6695,"High":6900,"Low":6695,"Close":6900,"Volume":860,"Ticker":"BICC","x":1661126400000,"y":6900},{"Date":"2022-08-23","Open":6875,"High":6875,"Low":6875,"Close":6875,"Volume":18,"Ticker":"BICC","x":1661212800000,"y":6875},{"Date":"2022-08-24","Open":6800,"High":6900,"Low":6800,"Close":6900,"Volume":115,"Ticker":"BICC","x":1661299200000,"y":6900},{"Date":"2022-08-26","Open":6895,"High":6895,"Low":6895,"Close":6895,"Volume":15,"Ticker":"BICC","x":1661472000000,"y":6895},{"Date":"2022-08-30","Open":6800,"High":6800,"Low":6800,"Close":6800,"Volume":5,"Ticker":"BICC","x":1661817600000,"y":6800},{"Date":"2022-08-31","Open":6790,"High":6890,"Low":6790,"Close":6890,"Volume":489,"Ticker":"BICC","x":1661904000000,"y":6890},{"Date":"2022-09-01","Open":6790,"High":6790,"Low":6790,"Close":6790,"Volume":50,"Ticker":"BICC","x":1661990400000,"y":6790},{"Date":"2022-09-02","Open":6500,"High":6500,"Low":6500,"Close":6500,"Volume":117,"Ticker":"BICC","x":1662076800000,"y":6500},{"Date":"2022-09-05","Open":6790,"High":6790,"Low":6790,"Close":6790,"Volume":442,"Ticker":"BICC","x":1662336000000,"y":6790},{"Date":"2022-09-06","Open":6550,"High":6750,"Low":6550,"Close":6550,"Volume":168,"Ticker":"BICC","x":1662422400000,"y":6550},{"Date":"2022-09-07","Open":6550,"High":6550,"Low":6500,"Close":6500,"Volume":319,"Ticker":"BICC","x":1662508800000,"y":6500},{"Date":"2022-09-08","Open":6550,"High":6600,"Low":6550,"Close":6580,"Volume":142,"Ticker":"BICC","x":1662595200000,"y":6580},{"Date":"2022-09-09","Open":6750,"High":6750,"Low":6750,"Close":6750,"Volume":12,"Ticker":"BICC","x":1662681600000,"y":6750},{"Date":"2022-09-12","Open":6700,"High":6700,"Low":6700,"Close":6700,"Volume":60,"Ticker":"BICC","x":1662940800000,"y":6700},{"Date":"2022-09-13","Open":6690,"High":6700,"Low":6690,"Close":6700,"Volume":100,"Ticker":"BICC","x":1663027200000,"y":6700},{"Date":"2022-09-15","Open":6690,"High":6690,"Low":6690,"Close":6690,"Volume":25,"Ticker":"BICC","x":1663200000000,"y":6690},{"Date":"2022-09-16","Open":6690,"High":6690,"Low":6690,"Close":6690,"Volume":15,"Ticker":"BICC","x":1663286400000,"y":6690},{"Date":"2022-09-19","Open":6600,"High":6600,"Low":6600,"Close":6600,"Volume":175,"Ticker":"BICC","x":1663545600000,"y":6600},{"Date":"2022-09-20","Open":6605,"High":6605,"Low":6590,"Close":6590,"Volume":681,"Ticker":"BICC","x":1663632000000,"y":6590},{"Date":"2022-09-21","Open":6590,"High":6590,"Low":6590,"Close":6590,"Volume":10,"Ticker":"BICC","x":1663718400000,"y":6590},{"Date":"2022-09-22","Open":6590,"High":6590,"Low":6500,"Close":6500,"Volume":30,"Ticker":"BICC","x":1663804800000,"y":6500},{"Date":"2022-09-23","Open":6500,"High":6500,"Low":6500,"Close":6500,"Volume":8,"Ticker":"BICC","x":1663891200000,"y":6500},{"Date":"2022-09-30","Open":6695,"High":6695,"Low":6505,"Close":6505,"Volume":450,"Ticker":"BICC","x":1664496000000,"y":6505},{"Date":"2022-10-03","Open":6900,"High":6900,"Low":6550,"Close":6550,"Volume":632,"Ticker":"BICC","x":1664755200000,"y":6550},{"Date":"2022-10-05","Open":6550,"High":6550,"Low":6550,"Close":6550,"Volume":5,"Ticker":"BICC","x":1664928000000,"y":6550},{"Date":"2022-10-06","Open":6550,"High":6600,"Low":6550,"Close":6600,"Volume":45,"Ticker":"BICC","x":1665014400000,"y":6600},{"Date":"2022-10-07","Open":6700,"High":6700,"Low":6600,"Close":6600,"Volume":15,"Ticker":"BICC","x":1665100800000,"y":6600},{"Date":"2022-10-10","Open":6600,"High":6600,"Low":6600,"Close":6600,"Volume":5,"Ticker":"BICC","x":1665360000000,"y":6600},{"Date":"2022-10-11","Open":6600,"High":6700,"Low":6600,"Close":6600,"Volume":2925,"Ticker":"BICC","x":1665446400000,"y":6600},{"Date":"2022-10-12","Open":6600,"High":6600,"Low":6600,"Close":6600,"Volume":100,"Ticker":"BICC","x":1665532800000,"y":6600},{"Date":"2022-10-13","Open":6600,"High":6600,"Low":6500,"Close":6500,"Volume":962,"Ticker":"BICC","x":1665619200000,"y":6500},{"Date":"2022-10-14","Open":6500,"High":6600,"Low":6500,"Close":6600,"Volume":96,"Ticker":"BICC","x":1665705600000,"y":6600},{"Date":"2022-10-17","Open":6500,"High":6500,"Low":6500,"Close":6500,"Volume":7,"Ticker":"BICC","x":1665964800000,"y":6500},{"Date":"2022-10-18","Open":6015,"High":6370,"Low":6015,"Close":6370,"Volume":16,"Ticker":"BICC","x":1666051200000,"y":6370},{"Date":"2022-10-19","Open":6400,"High":6400,"Low":6400,"Close":6400,"Volume":45,"Ticker":"BICC","x":1666137600000,"y":6400},{"Date":"2022-10-20","Open":6600,"High":6600,"Low":6550,"Close":6550,"Volume":1092,"Ticker":"BICC","x":1666224000000,"y":6550},{"Date":"2022-10-21","Open":6550,"High":6600,"Low":6500,"Close":6500,"Volume":299,"Ticker":"BICC","x":1666310400000,"y":6500},{"Date":"2022-10-25","Open":6700,"High":6700,"Low":6600,"Close":6600,"Volume":4,"Ticker":"BICC","x":1666656000000,"y":6600},{"Date":"2022-10-26","Open":6600,"High":6600,"Low":6600,"Close":6600,"Volume":3814,"Ticker":"BICC","x":1666742400000,"y":6600},{"Date":"2022-10-27","Open":6550,"High":6550,"Low":6505,"Close":6505,"Volume":510,"Ticker":"BICC","x":1666828800000,"y":6505},{"Date":"2022-10-28","Open":6500,"High":6500,"Low":6500,"Close":6500,"Volume":15,"Ticker":"BICC","x":1666915200000,"y":6500},{"Date":"2022-10-31","Open":6400,"High":6400,"Low":6400,"Close":6400,"Volume":20,"Ticker":"BICC","x":1667174400000,"y":6400},{"Date":"2022-11-02","Open":5925,"High":6400,"Low":5925,"Close":6400,"Volume":3010,"Ticker":"BICC","x":1667347200000,"y":6400},{"Date":"2022-11-03","Open":6400,"High":6400,"Low":6400,"Close":6400,"Volume":490,"Ticker":"BICC","x":1667433600000,"y":6400},{"Date":"2022-11-04","Open":6400,"High":6400,"Low":6400,"Close":6400,"Volume":27,"Ticker":"BICC","x":1667520000000,"y":6400},{"Date":"2022-11-07","Open":6400,"High":6400,"Low":6400,"Close":6400,"Volume":54,"Ticker":"BICC","x":1667779200000,"y":6400},{"Date":"2022-11-08","Open":6500,"High":6500,"Low":6500,"Close":6500,"Volume":17,"Ticker":"BICC","x":1667865600000,"y":6500},{"Date":"2022-11-10","Open":6405,"High":6405,"Low":6400,"Close":6400,"Volume":70,"Ticker":"BICC","x":1668038400000,"y":6400},{"Date":"2022-11-16","Open":5920,"High":6400,"Low":5920,"Close":6395,"Volume":1425,"Ticker":"BICC","x":1668556800000,"y":6395},{"Date":"2022-11-17","Open":6385,"High":6390,"Low":6380,"Close":6390,"Volume":1107,"Ticker":"BICC","x":1668643200000,"y":6390},{"Date":"2022-11-21","Open":6390,"High":6390,"Low":6390,"Close":6390,"Volume":1500,"Ticker":"BICC","x":1668988800000,"y":6390},{"Date":"2022-11-22","Open":6390,"High":6390,"Low":6390,"Close":6390,"Volume":10,"Ticker":"BICC","x":1669075200000,"y":6390},{"Date":"2022-11-23","Open":6200,"High":6385,"Low":5915,"Close":6385,"Volume":91,"Ticker":"BICC","x":1669161600000,"y":6385},{"Date":"2022-11-24","Open":6385,"High":6390,"Low":6385,"Close":6390,"Volume":150,"Ticker":"BICC","x":1669248000000,"y":6390},{"Date":"2022-11-28","Open":6380,"High":6390,"Low":6380,"Close":6390,"Volume":26,"Ticker":"BICC","x":1669593600000,"y":6390},{"Date":"2022-11-29","Open":6385,"High":6385,"Low":6385,"Close":6385,"Volume":2,"Ticker":"BICC","x":1669680000000,"y":6385},{"Date":"2022-12-05","Open":5910,"High":6380,"Low":5910,"Close":6380,"Volume":66,"Ticker":"BICC","x":1670198400000,"y":6380},{"Date":"2022-12-09","Open":5905,"High":6600,"Low":5905,"Close":6600,"Volume":1580,"Ticker":"BICC","x":1670544000000,"y":6600},{"Date":"2022-12-12","Open":7000,"High":7000,"Low":7000,"Close":7000,"Volume":14620,"Ticker":"BICC","x":1670803200000,"y":7000},{"Date":"2022-12-13","Open":6945,"High":6950,"Low":6945,"Close":6950,"Volume":103,"Ticker":"BICC","x":1670889600000,"y":6950},{"Date":"2022-12-14","Open":6430,"High":6945,"Low":6430,"Close":6945,"Volume":42,"Ticker":"BICC","x":1670976000000,"y":6945},{"Date":"2022-12-16","Open":6500,"High":6995,"Low":6500,"Close":6995,"Volume":4157,"Ticker":"BICC","x":1671148800000,"y":6995},{"Date":"2022-12-19","Open":6950,"High":6950,"Low":6950,"Close":6950,"Volume":15,"Ticker":"BICC","x":1671408000000,"y":6950},{"Date":"2022-12-20","Open":6890,"High":6990,"Low":6890,"Close":6990,"Volume":893,"Ticker":"BICC","x":1671494400000,"y":6990},{"Date":"2022-12-22","Open":6975,"High":6975,"Low":6975,"Close":6975,"Volume":1,"Ticker":"BICC","x":1671667200000,"y":6975},{"Date":"2022-12-23","Open":6975,"High":6975,"Low":6975,"Close":6975,"Volume":1,"Ticker":"BICC","x":1671753600000,"y":6975},{"Date":"2022-12-27","Open":6550,"High":6980,"Low":6550,"Close":6980,"Volume":3910,"Ticker":"BICC","x":1672099200000,"y":6980},{"Date":"2022-12-28","Open":6900,"High":6980,"Low":6900,"Close":6980,"Volume":2346,"Ticker":"BICC","x":1672185600000,"y":6980},{"Date":"2022-12-29","Open":6900,"High":6900,"Low":6900,"Close":6900,"Volume":15,"Ticker":"BICC","x":1672272000000,"y":6900},{"Date":"2022-12-30","Open":6500,"High":6850,"Low":6500,"Close":6850,"Volume":40,"Ticker":"BICC","x":1672358400000,"y":6850},{"Date":"2023-01-03","Open":6840,"High":6840,"Low":6840,"Close":6840,"Volume":5,"Ticker":"BICC","x":1672704000000,"y":6840},{"Date":"2023-01-04","Open":6330,"High":6330,"Low":6330,"Close":6330,"Volume":88,"Ticker":"BICC","x":1672790400000,"y":6330},{"Date":"2023-01-05","Open":6330,"High":6330,"Low":6330,"Close":6330,"Volume":5,"Ticker":"BICC","x":1672876800000,"y":6330},{"Date":"2023-01-06","Open":6700,"High":6700,"Low":6700,"Close":6700,"Volume":65,"Ticker":"BICC","x":1672963200000,"y":6700},{"Date":"2023-01-10","Open":6330,"High":6330,"Low":6330,"Close":6330,"Volume":160,"Ticker":"BICC","x":1673308800000,"y":6330},{"Date":"2023-01-11","Open":6330,"High":6330,"Low":6330,"Close":6330,"Volume":160,"Ticker":"BICC","x":1673395200000,"y":6330},{"Date":"2023-01-12","Open":6330,"High":6330,"Low":6330,"Close":6330,"Volume":923,"Ticker":"BICC","x":1673481600000,"y":6330},{"Date":"2023-01-13","Open":6325,"High":6325,"Low":6325,"Close":6325,"Volume":4,"Ticker":"BICC","x":1673568000000,"y":6325},{"Date":"2023-01-16","Open":6325,"High":6325,"Low":6295,"Close":6295,"Volume":28,"Ticker":"BICC","x":1673827200000,"y":6295},{"Date":"2023-01-17","Open":6295,"High":6300,"Low":6295,"Close":6300,"Volume":55,"Ticker":"BICC","x":1673913600000,"y":6300},{"Date":"2023-01-18","Open":6200,"High":6200,"Low":6200,"Close":6200,"Volume":1465,"Ticker":"BICC","x":1674000000000,"y":6200},{"Date":"2023-01-19","Open":6150,"High":6150,"Low":6150,"Close":6150,"Volume":5,"Ticker":"BICC","x":1674086400000,"y":6150},{"Date":"2023-01-20","Open":6100,"High":6100,"Low":6100,"Close":6100,"Volume":524,"Ticker":"BICC","x":1674172800000,"y":6100},{"Date":"2023-01-23","Open":6050,"High":6050,"Low":6050,"Close":6050,"Volume":59,"Ticker":"BICC","x":1674432000000,"y":6050},{"Date":"2023-01-24","Open":6000,"High":6000,"Low":6000,"Close":6000,"Volume":1059,"Ticker":"BICC","x":1674518400000,"y":6000},{"Date":"2023-01-25","Open":6000,"High":6000,"Low":6000,"Close":6000,"Volume":110,"Ticker":"BICC","x":1674604800000,"y":6000},{"Date":"2023-01-26","Open":6000,"High":6000,"Low":6000,"Close":6000,"Volume":1650,"Ticker":"BICC","x":1674691200000,"y":6000},{"Date":"2023-01-27","Open":5995,"High":6000,"Low":5995,"Close":6000,"Volume":516,"Ticker":"BICC","x":1674777600000,"y":6000},{"Date":"2023-01-31","Open":6000,"High":6000,"Low":6000,"Close":6000,"Volume":268,"Ticker":"BICC","x":1675123200000,"y":6000},{"Date":"2023-02-01","Open":6000,"High":6000,"Low":6000,"Close":6000,"Volume":116,"Ticker":"BICC","x":1675209600000,"y":6000},{"Date":"2023-02-02","Open":6000,"High":6000,"Low":6000,"Close":6000,"Volume":70,"Ticker":"BICC","x":1675296000000,"y":6000},{"Date":"2023-02-03","Open":6000,"High":6000,"Low":6000,"Close":6000,"Volume":27,"Ticker":"BICC","x":1675382400000,"y":6000},{"Date":"2023-02-06","Open":6000,"High":6000,"Low":6000,"Close":6000,"Volume":12,"Ticker":"BICC","x":1675641600000,"y":6000},{"Date":"2023-02-07","Open":6000,"High":6000,"Low":5995,"Close":5995,"Volume":220,"Ticker":"BICC","x":1675728000000,"y":5995},{"Date":"2023-02-09","Open":5895,"High":5900,"Low":5895,"Close":5900,"Volume":2061,"Ticker":"BICC","x":1675900800000,"y":5900},{"Date":"2023-02-10","Open":5900,"High":5900,"Low":5900,"Close":5900,"Volume":10,"Ticker":"BICC","x":1675987200000,"y":5900},{"Date":"2023-02-13","Open":5785,"High":5785,"Low":5785,"Close":5785,"Volume":1264,"Ticker":"BICC","x":1676246400000,"y":5785},{"Date":"2023-02-14","Open":5790,"High":6150,"Low":5790,"Close":6150,"Volume":223,"Ticker":"BICC","x":1676332800000,"y":6150},{"Date":"2023-02-15","Open":6150,"High":6500,"Low":6150,"Close":6500,"Volume":333,"Ticker":"BICC","x":1676419200000,"y":6500},{"Date":"2023-02-17","Open":6500,"High":6500,"Low":6500,"Close":6500,"Volume":498,"Ticker":"BICC","x":1676592000000,"y":6500},{"Date":"2023-02-20","Open":6400,"High":6400,"Low":6400,"Close":6400,"Volume":12,"Ticker":"BICC","x":1676851200000,"y":6400},{"Date":"2023-02-21","Open":6400,"High":6400,"Low":6330,"Close":6330,"Volume":636,"Ticker":"BICC","x":1676937600000,"y":6330},{"Date":"2023-02-22","Open":6330,"High":6330,"Low":6330,"Close":6330,"Volume":290,"Ticker":"BICC","x":1677024000000,"y":6330},{"Date":"2023-02-23","Open":6390,"High":6390,"Low":6390,"Close":6390,"Volume":3,"Ticker":"BICC","x":1677110400000,"y":6390},{"Date":"2023-02-24","Open":6330,"High":6390,"Low":6330,"Close":6390,"Volume":1074,"Ticker":"BICC","x":1677196800000,"y":6390},{"Date":"2023-02-27","Open":6390,"High":6390,"Low":6390,"Close":6390,"Volume":601,"Ticker":"BICC","x":1677456000000,"y":6390},{"Date":"2023-02-28","Open":6390,"High":6390,"Low":6390,"Close":6390,"Volume":115,"Ticker":"BICC","x":1677542400000,"y":6390},{"Date":"2023-03-01","Open":6390,"High":6495,"Low":6390,"Close":6495,"Volume":7,"Ticker":"BICC","x":1677628800000,"y":6495},{"Date":"2023-03-02","Open":6350,"High":6445,"Low":6350,"Close":6445,"Volume":11,"Ticker":"BICC","x":1677715200000,"y":6445},{"Date":"2023-03-06","Open":6400,"High":6440,"Low":6400,"Close":6440,"Volume":6385,"Ticker":"BICC","x":1678060800000,"y":6440},{"Date":"2023-03-07","Open":6400,"High":6400,"Low":6400,"Close":6400,"Volume":2,"Ticker":"BICC","x":1678147200000,"y":6400},{"Date":"2023-03-08","Open":6400,"High":6400,"Low":6400,"Close":6400,"Volume":36,"Ticker":"BICC","x":1678233600000,"y":6400},{"Date":"2023-03-10","Open":6200,"High":6400,"Low":6200,"Close":6400,"Volume":709,"Ticker":"BICC","x":1678406400000,"y":6400},{"Date":"2023-03-13","Open":6400,"High":6400,"Low":6400,"Close":6400,"Volume":32,"Ticker":"BICC","x":1678665600000,"y":6400},{"Date":"2023-03-14","Open":6440,"High":6440,"Low":6440,"Close":6440,"Volume":32,"Ticker":"BICC","x":1678752000000,"y":6440},{"Date":"2023-03-15","Open":6400,"High":6435,"Low":6400,"Close":6435,"Volume":448,"Ticker":"BICC","x":1678838400000,"y":6435},{"Date":"2023-03-16","Open":6440,"High":6495,"Low":6440,"Close":6495,"Volume":77,"Ticker":"BICC","x":1678924800000,"y":6495},{"Date":"2023-03-17","Open":6400,"High":6495,"Low":6400,"Close":6495,"Volume":794,"Ticker":"BICC","x":1679011200000,"y":6495},{"Date":"2023-03-20","Open":6440,"High":6440,"Low":6440,"Close":6440,"Volume":868,"Ticker":"BICC","x":1679270400000,"y":6440},{"Date":"2023-03-21","Open":6440,"High":6440,"Low":6440,"Close":6440,"Volume":71,"Ticker":"BICC","x":1679356800000,"y":6440},{"Date":"2023-03-22","Open":6410,"High":6410,"Low":6410,"Close":6410,"Volume":1943,"Ticker":"BICC","x":1679443200000,"y":6410},{"Date":"2023-03-23","Open":6400,"High":6400,"Low":6300,"Close":6300,"Volume":275,"Ticker":"BICC","x":1679529600000,"y":6300},{"Date":"2023-03-24","Open":6410,"High":6410,"Low":6300,"Close":6300,"Volume":550,"Ticker":"BICC","x":1679616000000,"y":6300}],"type":"line"},{"name":"BOAM","data":[{"Date":"2022-03-28","Open":1400,"High":1500,"Low":1400,"Close":1420,"Volume":6178,"Ticker":"BOAM","x":1648425600000,"y":1420},{"Date":"2022-03-29","Open":1415,"High":1450,"Low":1415,"Close":1420,"Volume":837,"Ticker":"BOAM","x":1648512000000,"y":1420},{"Date":"2022-03-30","Open":1450,"High":1450,"Low":1400,"Close":1400,"Volume":1402,"Ticker":"BOAM","x":1648598400000,"y":1400},{"Date":"2022-03-31","Open":1410,"High":1410,"Low":1400,"Close":1400,"Volume":4655,"Ticker":"BOAM","x":1648684800000,"y":1400},{"Date":"2022-04-01","Open":1400,"High":1440,"Low":1400,"Close":1400,"Volume":3785,"Ticker":"BOAM","x":1648771200000,"y":1400},{"Date":"2022-04-04","Open":1440,"High":1495,"Low":1415,"Close":1415,"Volume":1741,"Ticker":"BOAM","x":1649030400000,"y":1415},{"Date":"2022-04-05","Open":1405,"High":1415,"Low":1405,"Close":1415,"Volume":50,"Ticker":"BOAM","x":1649116800000,"y":1415},{"Date":"2022-04-06","Open":1425,"High":1425,"Low":1425,"Close":1425,"Volume":540,"Ticker":"BOAM","x":1649203200000,"y":1425},{"Date":"2022-04-07","Open":1425,"High":1445,"Low":1415,"Close":1415,"Volume":319,"Ticker":"BOAM","x":1649289600000,"y":1415},{"Date":"2022-04-08","Open":1415,"High":1415,"Low":1400,"Close":1400,"Volume":50,"Ticker":"BOAM","x":1649376000000,"y":1400},{"Date":"2022-04-11","Open":1400,"High":1400,"Low":1350,"Close":1350,"Volume":703,"Ticker":"BOAM","x":1649635200000,"y":1350},{"Date":"2022-04-12","Open":1350,"High":1350,"Low":1305,"Close":1350,"Volume":2014,"Ticker":"BOAM","x":1649721600000,"y":1350},{"Date":"2022-04-13","Open":1350,"High":1350,"Low":1350,"Close":1350,"Volume":398,"Ticker":"BOAM","x":1649808000000,"y":1350},{"Date":"2022-04-14","Open":1350,"High":1400,"Low":1350,"Close":1350,"Volume":5206,"Ticker":"BOAM","x":1649894400000,"y":1350},{"Date":"2022-04-15","Open":1395,"High":1400,"Low":1395,"Close":1400,"Volume":2233,"Ticker":"BOAM","x":1649980800000,"y":1400},{"Date":"2022-04-19","Open":1380,"High":1380,"Low":1350,"Close":1350,"Volume":2551,"Ticker":"BOAM","x":1650326400000,"y":1350},{"Date":"2022-04-20","Open":1350,"High":1370,"Low":1330,"Close":1370,"Volume":190,"Ticker":"BOAM","x":1650412800000,"y":1370},{"Date":"2022-04-21","Open":1365,"High":1370,"Low":1365,"Close":1370,"Volume":48,"Ticker":"BOAM","x":1650499200000,"y":1370},{"Date":"2022-04-22","Open":1370,"High":1370,"Low":1360,"Close":1360,"Volume":205,"Ticker":"BOAM","x":1650585600000,"y":1360},{"Date":"2022-04-25","Open":1350,"High":1350,"Low":1350,"Close":1350,"Volume":920,"Ticker":"BOAM","x":1650844800000,"y":1350},{"Date":"2022-04-26","Open":1350,"High":1350,"Low":1300,"Close":1340,"Volume":6125,"Ticker":"BOAM","x":1650931200000,"y":1340},{"Date":"2022-04-27","Open":1350,"High":1350,"Low":1340,"Close":1340,"Volume":180,"Ticker":"BOAM","x":1651017600000,"y":1340},{"Date":"2022-04-29","Open":1340,"High":1340,"Low":1300,"Close":1300,"Volume":345,"Ticker":"BOAM","x":1651190400000,"y":1300},{"Date":"2022-05-03","Open":1205,"High":1250,"Low":1205,"Close":1210,"Volume":654,"Ticker":"BOAM","x":1651536000000,"y":1210},{"Date":"2022-05-04","Open":1210,"High":1250,"Low":1210,"Close":1250,"Volume":3541,"Ticker":"BOAM","x":1651622400000,"y":1250},{"Date":"2022-05-05","Open":1335,"High":1335,"Low":1250,"Close":1250,"Volume":890,"Ticker":"BOAM","x":1651708800000,"y":1250},{"Date":"2022-05-06","Open":1260,"High":1300,"Low":1260,"Close":1300,"Volume":121,"Ticker":"BOAM","x":1651795200000,"y":1300},{"Date":"2022-05-09","Open":1300,"High":1300,"Low":1275,"Close":1300,"Volume":1715,"Ticker":"BOAM","x":1652054400000,"y":1300},{"Date":"2022-05-10","Open":1350,"High":1370,"Low":1275,"Close":1275,"Volume":1252,"Ticker":"BOAM","x":1652140800000,"y":1275},{"Date":"2022-05-11","Open":1300,"High":1350,"Low":1300,"Close":1345,"Volume":136,"Ticker":"BOAM","x":1652227200000,"y":1345},{"Date":"2022-05-12","Open":1345,"High":1345,"Low":1300,"Close":1345,"Volume":2005,"Ticker":"BOAM","x":1652313600000,"y":1345},{"Date":"2022-05-13","Open":1350,"High":1395,"Low":1345,"Close":1350,"Volume":549,"Ticker":"BOAM","x":1652400000000,"y":1350},{"Date":"2022-05-16","Open":1335,"High":1345,"Low":1285,"Close":1290,"Volume":380,"Ticker":"BOAM","x":1652659200000,"y":1290},{"Date":"2022-05-17","Open":1300,"High":1320,"Low":1300,"Close":1300,"Volume":620,"Ticker":"BOAM","x":1652745600000,"y":1300},{"Date":"2022-05-18","Open":1300,"High":1340,"Low":1300,"Close":1340,"Volume":999,"Ticker":"BOAM","x":1652832000000,"y":1340},{"Date":"2022-05-19","Open":1350,"High":1350,"Low":1250,"Close":1250,"Volume":2058,"Ticker":"BOAM","x":1652918400000,"y":1250},{"Date":"2022-05-20","Open":1335,"High":1335,"Low":1300,"Close":1300,"Volume":215,"Ticker":"BOAM","x":1653004800000,"y":1300},{"Date":"2022-05-23","Open":1250,"High":1250,"Low":1215,"Close":1250,"Volume":3689,"Ticker":"BOAM","x":1653264000000,"y":1250},{"Date":"2022-05-24","Open":1230,"High":1250,"Low":1230,"Close":1250,"Volume":1425,"Ticker":"BOAM","x":1653350400000,"y":1250},{"Date":"2022-05-25","Open":1340,"High":1340,"Low":1340,"Close":1340,"Volume":201,"Ticker":"BOAM","x":1653436800000,"y":1340},{"Date":"2022-05-27","Open":1300,"High":1340,"Low":1250,"Close":1335,"Volume":1148,"Ticker":"BOAM","x":1653609600000,"y":1335},{"Date":"2022-05-30","Open":1340,"High":1350,"Low":1280,"Close":1300,"Volume":1742,"Ticker":"BOAM","x":1653868800000,"y":1300},{"Date":"2022-05-31","Open":1260,"High":1340,"Low":1260,"Close":1340,"Volume":349,"Ticker":"BOAM","x":1653955200000,"y":1340},{"Date":"2022-06-01","Open":1265,"High":1340,"Low":1265,"Close":1270,"Volume":317,"Ticker":"BOAM","x":1654041600000,"y":1270},{"Date":"2022-06-02","Open":1330,"High":1335,"Low":1330,"Close":1330,"Volume":165,"Ticker":"BOAM","x":1654128000000,"y":1330},{"Date":"2022-06-03","Open":1330,"High":1345,"Low":1330,"Close":1345,"Volume":2600,"Ticker":"BOAM","x":1654214400000,"y":1345},{"Date":"2022-06-07","Open":1300,"High":1350,"Low":1300,"Close":1350,"Volume":4446,"Ticker":"BOAM","x":1654560000000,"y":1350},{"Date":"2022-06-08","Open":1345,"High":1345,"Low":1300,"Close":1345,"Volume":337,"Ticker":"BOAM","x":1654646400000,"y":1345},{"Date":"2022-06-09","Open":1340,"High":1340,"Low":1330,"Close":1330,"Volume":375,"Ticker":"BOAM","x":1654732800000,"y":1330},{"Date":"2022-06-10","Open":1325,"High":1340,"Low":1305,"Close":1340,"Volume":273,"Ticker":"BOAM","x":1654819200000,"y":1340},{"Date":"2022-06-13","Open":1300,"High":1345,"Low":1300,"Close":1325,"Volume":2730,"Ticker":"BOAM","x":1655078400000,"y":1325},{"Date":"2022-06-14","Open":1325,"High":1350,"Low":1325,"Close":1345,"Volume":2659,"Ticker":"BOAM","x":1655164800000,"y":1345},{"Date":"2022-06-15","Open":1345,"High":1350,"Low":1345,"Close":1345,"Volume":2008,"Ticker":"BOAM","x":1655251200000,"y":1345},{"Date":"2022-06-16","Open":1340,"High":1340,"Low":1310,"Close":1310,"Volume":2197,"Ticker":"BOAM","x":1655337600000,"y":1310},{"Date":"2022-06-17","Open":1305,"High":1350,"Low":1300,"Close":1310,"Volume":2675,"Ticker":"BOAM","x":1655424000000,"y":1310},{"Date":"2022-06-20","Open":1370,"High":1375,"Low":1300,"Close":1370,"Volume":1164,"Ticker":"BOAM","x":1655683200000,"y":1370},{"Date":"2022-06-21","Open":1315,"High":1370,"Low":1315,"Close":1315,"Volume":254,"Ticker":"BOAM","x":1655769600000,"y":1315},{"Date":"2022-06-22","Open":1315,"High":1400,"Low":1300,"Close":1400,"Volume":1028,"Ticker":"BOAM","x":1655856000000,"y":1400},{"Date":"2022-06-23","Open":1400,"High":1400,"Low":1390,"Close":1400,"Volume":313,"Ticker":"BOAM","x":1655942400000,"y":1400},{"Date":"2022-06-24","Open":1400,"High":1400,"Low":1315,"Close":1315,"Volume":1140,"Ticker":"BOAM","x":1656028800000,"y":1315},{"Date":"2022-06-27","Open":1400,"High":1400,"Low":1350,"Close":1400,"Volume":1309,"Ticker":"BOAM","x":1656288000000,"y":1400},{"Date":"2022-06-28","Open":1400,"High":1400,"Low":1400,"Close":1400,"Volume":652,"Ticker":"BOAM","x":1656374400000,"y":1400},{"Date":"2022-06-29","Open":1400,"High":1400,"Low":1350,"Close":1350,"Volume":1845,"Ticker":"BOAM","x":1656460800000,"y":1350},{"Date":"2022-06-30","Open":1350,"High":1350,"Low":1345,"Close":1350,"Volume":1389,"Ticker":"BOAM","x":1656547200000,"y":1350},{"Date":"2022-07-01","Open":1400,"High":1400,"Low":1400,"Close":1400,"Volume":407,"Ticker":"BOAM","x":1656633600000,"y":1400},{"Date":"2022-07-04","Open":1420,"High":1505,"Low":1420,"Close":1505,"Volume":813,"Ticker":"BOAM","x":1656892800000,"y":1505},{"Date":"2022-07-05","Open":1590,"High":1615,"Low":1505,"Close":1615,"Volume":3788,"Ticker":"BOAM","x":1656979200000,"y":1615},{"Date":"2022-07-06","Open":1700,"High":1735,"Low":1700,"Close":1735,"Volume":7755,"Ticker":"BOAM","x":1657065600000,"y":1735},{"Date":"2022-07-07","Open":1790,"High":1850,"Low":1790,"Close":1800,"Volume":5204,"Ticker":"BOAM","x":1657152000000,"y":1800},{"Date":"2022-07-08","Open":1935,"High":1935,"Low":1830,"Close":1900,"Volume":3598,"Ticker":"BOAM","x":1657238400000,"y":1900},{"Date":"2022-07-11","Open":1900,"High":1900,"Low":1850,"Close":1850,"Volume":1835,"Ticker":"BOAM","x":1657497600000,"y":1850},{"Date":"2022-07-12","Open":1850,"High":1890,"Low":1850,"Close":1890,"Volume":360,"Ticker":"BOAM","x":1657584000000,"y":1890},{"Date":"2022-07-13","Open":1895,"High":1895,"Low":1840,"Close":1840,"Volume":3017,"Ticker":"BOAM","x":1657670400000,"y":1840},{"Date":"2022-07-14","Open":1835,"High":1840,"Low":1800,"Close":1835,"Volume":17069,"Ticker":"BOAM","x":1657756800000,"y":1835},{"Date":"2022-07-15","Open":1815,"High":1815,"Low":1700,"Close":1785,"Volume":781,"Ticker":"BOAM","x":1657843200000,"y":1785},{"Date":"2022-07-18","Open":1700,"High":1750,"Low":1700,"Close":1700,"Volume":1390,"Ticker":"BOAM","x":1658102400000,"y":1700},{"Date":"2022-07-19","Open":1650,"High":1650,"Low":1620,"Close":1620,"Volume":668,"Ticker":"BOAM","x":1658188800000,"y":1620},{"Date":"2022-07-20","Open":1615,"High":1615,"Low":1500,"Close":1580,"Volume":438,"Ticker":"BOAM","x":1658275200000,"y":1580},{"Date":"2022-07-21","Open":1620,"High":1620,"Low":1590,"Close":1590,"Volume":176,"Ticker":"BOAM","x":1658361600000,"y":1590},{"Date":"2022-07-22","Open":1590,"High":1590,"Low":1475,"Close":1475,"Volume":577,"Ticker":"BOAM","x":1658448000000,"y":1475},{"Date":"2022-07-25","Open":1475,"High":1585,"Low":1475,"Close":1575,"Volume":450,"Ticker":"BOAM","x":1658707200000,"y":1575},{"Date":"2022-07-26","Open":1575,"High":1590,"Low":1575,"Close":1575,"Volume":1358,"Ticker":"BOAM","x":1658793600000,"y":1575},{"Date":"2022-07-27","Open":1580,"High":1650,"Low":1580,"Close":1600,"Volume":1156,"Ticker":"BOAM","x":1658880000000,"y":1600},{"Date":"2022-07-28","Open":1605,"High":1700,"Low":1605,"Close":1605,"Volume":757,"Ticker":"BOAM","x":1658966400000,"y":1605},{"Date":"2022-07-29","Open":1610,"High":1695,"Low":1605,"Close":1650,"Volume":1192,"Ticker":"BOAM","x":1659052800000,"y":1650},{"Date":"2022-08-01","Open":1640,"High":1650,"Low":1600,"Close":1600,"Volume":173,"Ticker":"BOAM","x":1659312000000,"y":1600},{"Date":"2022-08-02","Open":1580,"High":1580,"Low":1500,"Close":1575,"Volume":355,"Ticker":"BOAM","x":1659398400000,"y":1575},{"Date":"2022-08-03","Open":1575,"High":1575,"Low":1575,"Close":1575,"Volume":1137,"Ticker":"BOAM","x":1659484800000,"y":1575},{"Date":"2022-08-04","Open":1575,"High":1580,"Low":1570,"Close":1575,"Volume":1288,"Ticker":"BOAM","x":1659571200000,"y":1575},{"Date":"2022-08-05","Open":1575,"High":1575,"Low":1550,"Close":1560,"Volume":442,"Ticker":"BOAM","x":1659657600000,"y":1560},{"Date":"2022-08-09","Open":1560,"High":1560,"Low":1475,"Close":1480,"Volume":881,"Ticker":"BOAM","x":1660003200000,"y":1480},{"Date":"2022-08-10","Open":1560,"High":1560,"Low":1485,"Close":1560,"Volume":407,"Ticker":"BOAM","x":1660089600000,"y":1560},{"Date":"2022-08-11","Open":1560,"High":1560,"Low":1480,"Close":1480,"Volume":1409,"Ticker":"BOAM","x":1660176000000,"y":1480},{"Date":"2022-08-12","Open":1485,"High":1490,"Low":1475,"Close":1480,"Volume":1391,"Ticker":"BOAM","x":1660262400000,"y":1480},{"Date":"2022-08-16","Open":1480,"High":1555,"Low":1455,"Close":1555,"Volume":1590,"Ticker":"BOAM","x":1660608000000,"y":1555},{"Date":"2022-08-17","Open":1550,"High":1555,"Low":1550,"Close":1555,"Volume":995,"Ticker":"BOAM","x":1660694400000,"y":1555},{"Date":"2022-08-18","Open":1440,"High":1450,"Low":1440,"Close":1440,"Volume":1653,"Ticker":"BOAM","x":1660780800000,"y":1440},{"Date":"2022-08-19","Open":1450,"High":1450,"Low":1450,"Close":1450,"Volume":51,"Ticker":"BOAM","x":1660867200000,"y":1450},{"Date":"2022-08-22","Open":1405,"High":1450,"Low":1405,"Close":1450,"Volume":428,"Ticker":"BOAM","x":1661126400000,"y":1450},{"Date":"2022-08-23","Open":1450,"High":1500,"Low":1350,"Close":1500,"Volume":1882,"Ticker":"BOAM","x":1661212800000,"y":1500},{"Date":"2022-08-24","Open":1550,"High":1550,"Low":1390,"Close":1390,"Volume":694,"Ticker":"BOAM","x":1661299200000,"y":1390},{"Date":"2022-08-25","Open":1390,"High":1425,"Low":1320,"Close":1425,"Volume":1373,"Ticker":"BOAM","x":1661385600000,"y":1425},{"Date":"2022-08-26","Open":1480,"High":1480,"Low":1425,"Close":1480,"Volume":503,"Ticker":"BOAM","x":1661472000000,"y":1480},{"Date":"2022-08-29","Open":1500,"High":1525,"Low":1500,"Close":1525,"Volume":1067,"Ticker":"BOAM","x":1661731200000,"y":1525},{"Date":"2022-08-30","Open":1525,"High":1525,"Low":1525,"Close":1525,"Volume":130,"Ticker":"BOAM","x":1661817600000,"y":1525},{"Date":"2022-08-31","Open":1500,"High":1550,"Low":1500,"Close":1500,"Volume":975,"Ticker":"BOAM","x":1661904000000,"y":1500},{"Date":"2022-09-01","Open":1500,"High":1555,"Low":1500,"Close":1500,"Volume":4250,"Ticker":"BOAM","x":1661990400000,"y":1500},{"Date":"2022-09-02","Open":1505,"High":1550,"Low":1500,"Close":1550,"Volume":1187,"Ticker":"BOAM","x":1662076800000,"y":1550},{"Date":"2022-09-05","Open":1575,"High":1575,"Low":1505,"Close":1550,"Volume":683,"Ticker":"BOAM","x":1662336000000,"y":1550},{"Date":"2022-09-06","Open":1500,"High":1550,"Low":1500,"Close":1500,"Volume":1787,"Ticker":"BOAM","x":1662422400000,"y":1500},{"Date":"2022-09-07","Open":1500,"High":1550,"Low":1500,"Close":1550,"Volume":1081,"Ticker":"BOAM","x":1662508800000,"y":1550},{"Date":"2022-09-08","Open":1550,"High":1550,"Low":1520,"Close":1520,"Volume":67,"Ticker":"BOAM","x":1662595200000,"y":1520},{"Date":"2022-09-09","Open":1505,"High":1530,"Low":1505,"Close":1515,"Volume":59,"Ticker":"BOAM","x":1662681600000,"y":1515},{"Date":"2022-09-12","Open":1510,"High":1530,"Low":1510,"Close":1530,"Volume":907,"Ticker":"BOAM","x":1662940800000,"y":1530},{"Date":"2022-09-13","Open":1530,"High":1565,"Low":1520,"Close":1565,"Volume":590,"Ticker":"BOAM","x":1663027200000,"y":1565},{"Date":"2022-09-14","Open":1520,"High":1520,"Low":1505,"Close":1520,"Volume":328,"Ticker":"BOAM","x":1663113600000,"y":1520},{"Date":"2022-09-15","Open":1520,"High":1520,"Low":1505,"Close":1520,"Volume":190,"Ticker":"BOAM","x":1663200000000,"y":1520},{"Date":"2022-09-16","Open":1555,"High":1600,"Low":1550,"Close":1550,"Volume":443,"Ticker":"BOAM","x":1663286400000,"y":1550},{"Date":"2022-09-19","Open":1600,"High":1600,"Low":1550,"Close":1600,"Volume":149,"Ticker":"BOAM","x":1663545600000,"y":1600},{"Date":"2022-09-20","Open":1600,"High":1615,"Low":1570,"Close":1615,"Volume":678,"Ticker":"BOAM","x":1663632000000,"y":1615},{"Date":"2022-09-21","Open":1600,"High":1615,"Low":1550,"Close":1615,"Volume":65,"Ticker":"BOAM","x":1663718400000,"y":1615},{"Date":"2022-09-22","Open":1530,"High":1535,"Low":1525,"Close":1525,"Volume":1238,"Ticker":"BOAM","x":1663804800000,"y":1525},{"Date":"2022-09-23","Open":1595,"High":1595,"Low":1525,"Close":1525,"Volume":352,"Ticker":"BOAM","x":1663891200000,"y":1525},{"Date":"2022-09-26","Open":1525,"High":1525,"Low":1525,"Close":1525,"Volume":107,"Ticker":"BOAM","x":1664150400000,"y":1525},{"Date":"2022-09-27","Open":1525,"High":1525,"Low":1525,"Close":1525,"Volume":469,"Ticker":"BOAM","x":1664236800000,"y":1525},{"Date":"2022-09-28","Open":1535,"High":1535,"Low":1500,"Close":1500,"Volume":687,"Ticker":"BOAM","x":1664323200000,"y":1500},{"Date":"2022-09-29","Open":1500,"High":1505,"Low":1455,"Close":1500,"Volume":208,"Ticker":"BOAM","x":1664409600000,"y":1500},{"Date":"2022-09-30","Open":1535,"High":1550,"Low":1500,"Close":1550,"Volume":69,"Ticker":"BOAM","x":1664496000000,"y":1550},{"Date":"2022-10-03","Open":1550,"High":1600,"Low":1550,"Close":1600,"Volume":1048,"Ticker":"BOAM","x":1664755200000,"y":1600},{"Date":"2022-10-04","Open":1595,"High":1595,"Low":1555,"Close":1595,"Volume":1091,"Ticker":"BOAM","x":1664841600000,"y":1595},{"Date":"2022-10-05","Open":1550,"High":1585,"Low":1550,"Close":1585,"Volume":78,"Ticker":"BOAM","x":1664928000000,"y":1585},{"Date":"2022-10-06","Open":1595,"High":1595,"Low":1470,"Close":1470,"Volume":27,"Ticker":"BOAM","x":1665014400000,"y":1470},{"Date":"2022-10-07","Open":1480,"High":1550,"Low":1480,"Close":1480,"Volume":187,"Ticker":"BOAM","x":1665100800000,"y":1480},{"Date":"2022-10-10","Open":1480,"High":1550,"Low":1480,"Close":1480,"Volume":261,"Ticker":"BOAM","x":1665360000000,"y":1480},{"Date":"2022-10-11","Open":1390,"High":1480,"Low":1390,"Close":1480,"Volume":153,"Ticker":"BOAM","x":1665446400000,"y":1480},{"Date":"2022-10-12","Open":1450,"High":1480,"Low":1450,"Close":1480,"Volume":166,"Ticker":"BOAM","x":1665532800000,"y":1480},{"Date":"2022-10-13","Open":1480,"High":1480,"Low":1475,"Close":1475,"Volume":115,"Ticker":"BOAM","x":1665619200000,"y":1475},{"Date":"2022-10-14","Open":1475,"High":1480,"Low":1475,"Close":1475,"Volume":345,"Ticker":"BOAM","x":1665705600000,"y":1475},{"Date":"2022-10-17","Open":1500,"High":1500,"Low":1450,"Close":1470,"Volume":123,"Ticker":"BOAM","x":1665964800000,"y":1470},{"Date":"2022-10-18","Open":1500,"High":1500,"Low":1500,"Close":1500,"Volume":2800,"Ticker":"BOAM","x":1666051200000,"y":1500},{"Date":"2022-10-19","Open":1535,"High":1535,"Low":1470,"Close":1500,"Volume":352,"Ticker":"BOAM","x":1666137600000,"y":1500},{"Date":"2022-10-20","Open":1450,"High":1500,"Low":1400,"Close":1450,"Volume":628,"Ticker":"BOAM","x":1666224000000,"y":1450},{"Date":"2022-10-21","Open":1450,"High":1535,"Low":1450,"Close":1535,"Volume":321,"Ticker":"BOAM","x":1666310400000,"y":1535},{"Date":"2022-10-24","Open":1535,"High":1535,"Low":1530,"Close":1530,"Volume":55,"Ticker":"BOAM","x":1666569600000,"y":1530},{"Date":"2022-10-25","Open":1420,"High":1430,"Low":1420,"Close":1420,"Volume":1215,"Ticker":"BOAM","x":1666656000000,"y":1420},{"Date":"2022-10-26","Open":1420,"High":1420,"Low":1400,"Close":1400,"Volume":401,"Ticker":"BOAM","x":1666742400000,"y":1400},{"Date":"2022-10-27","Open":1410,"High":1420,"Low":1400,"Close":1420,"Volume":1147,"Ticker":"BOAM","x":1666828800000,"y":1420},{"Date":"2022-10-28","Open":1420,"High":1505,"Low":1420,"Close":1505,"Volume":636,"Ticker":"BOAM","x":1666915200000,"y":1505},{"Date":"2022-10-31","Open":1490,"High":1490,"Low":1405,"Close":1405,"Volume":3174,"Ticker":"BOAM","x":1667174400000,"y":1405},{"Date":"2022-11-02","Open":1500,"High":1500,"Low":1480,"Close":1480,"Volume":575,"Ticker":"BOAM","x":1667347200000,"y":1480},{"Date":"2022-11-03","Open":1500,"High":1535,"Low":1480,"Close":1535,"Volume":428,"Ticker":"BOAM","x":1667433600000,"y":1535},{"Date":"2022-11-04","Open":1500,"High":1500,"Low":1490,"Close":1490,"Volume":420,"Ticker":"BOAM","x":1667520000000,"y":1490},{"Date":"2022-11-07","Open":1420,"High":1470,"Low":1420,"Close":1470,"Volume":522,"Ticker":"BOAM","x":1667779200000,"y":1470},{"Date":"2022-11-08","Open":1470,"High":1490,"Low":1410,"Close":1490,"Volume":551,"Ticker":"BOAM","x":1667865600000,"y":1490},{"Date":"2022-11-09","Open":1410,"High":1490,"Low":1410,"Close":1485,"Volume":73,"Ticker":"BOAM","x":1667952000000,"y":1485},{"Date":"2022-11-10","Open":1480,"High":1490,"Low":1480,"Close":1490,"Volume":6875,"Ticker":"BOAM","x":1668038400000,"y":1490},{"Date":"2022-11-11","Open":1470,"High":1470,"Low":1465,"Close":1465,"Volume":760,"Ticker":"BOAM","x":1668124800000,"y":1465},{"Date":"2022-11-14","Open":1500,"High":1500,"Low":1500,"Close":1500,"Volume":129,"Ticker":"BOAM","x":1668384000000,"y":1500},{"Date":"2022-11-16","Open":1500,"High":1505,"Low":1500,"Close":1505,"Volume":178,"Ticker":"BOAM","x":1668556800000,"y":1505},{"Date":"2022-11-17","Open":1505,"High":1505,"Low":1500,"Close":1500,"Volume":221,"Ticker":"BOAM","x":1668643200000,"y":1500},{"Date":"2022-11-18","Open":1500,"High":1500,"Low":1500,"Close":1500,"Volume":80,"Ticker":"BOAM","x":1668729600000,"y":1500},{"Date":"2022-11-21","Open":1500,"High":1500,"Low":1480,"Close":1480,"Volume":455,"Ticker":"BOAM","x":1668988800000,"y":1480},{"Date":"2022-11-22","Open":1470,"High":1475,"Low":1470,"Close":1470,"Volume":203,"Ticker":"BOAM","x":1669075200000,"y":1470},{"Date":"2022-11-23","Open":1450,"High":1450,"Low":1450,"Close":1450,"Volume":145,"Ticker":"BOAM","x":1669161600000,"y":1450},{"Date":"2022-11-24","Open":1410,"High":1410,"Low":1410,"Close":1410,"Volume":739,"Ticker":"BOAM","x":1669248000000,"y":1410},{"Date":"2022-11-25","Open":1410,"High":1420,"Low":1400,"Close":1400,"Volume":2921,"Ticker":"BOAM","x":1669334400000,"y":1400},{"Date":"2022-11-28","Open":1400,"High":1400,"Low":1395,"Close":1395,"Volume":83,"Ticker":"BOAM","x":1669593600000,"y":1395},{"Date":"2022-11-29","Open":1375,"High":1375,"Low":1355,"Close":1355,"Volume":153,"Ticker":"BOAM","x":1669680000000,"y":1355},{"Date":"2022-11-30","Open":1400,"High":1400,"Low":1355,"Close":1355,"Volume":592,"Ticker":"BOAM","x":1669766400000,"y":1355},{"Date":"2022-12-01","Open":1355,"High":1355,"Low":1355,"Close":1355,"Volume":969,"Ticker":"BOAM","x":1669852800000,"y":1355},{"Date":"2022-12-02","Open":1355,"High":1355,"Low":1355,"Close":1355,"Volume":195,"Ticker":"BOAM","x":1669939200000,"y":1355},{"Date":"2022-12-05","Open":1360,"High":1360,"Low":1355,"Close":1355,"Volume":956,"Ticker":"BOAM","x":1670198400000,"y":1355},{"Date":"2022-12-06","Open":1355,"High":1355,"Low":1355,"Close":1355,"Volume":272,"Ticker":"BOAM","x":1670284800000,"y":1355},{"Date":"2022-12-07","Open":1355,"High":1400,"Low":1355,"Close":1400,"Volume":51,"Ticker":"BOAM","x":1670371200000,"y":1400},{"Date":"2022-12-08","Open":1350,"High":1350,"Low":1350,"Close":1350,"Volume":205,"Ticker":"BOAM","x":1670457600000,"y":1350},{"Date":"2022-12-09","Open":1350,"High":1350,"Low":1350,"Close":1350,"Volume":108,"Ticker":"BOAM","x":1670544000000,"y":1350},{"Date":"2022-12-12","Open":1370,"High":1370,"Low":1350,"Close":1350,"Volume":422,"Ticker":"BOAM","x":1670803200000,"y":1350},{"Date":"2022-12-13","Open":1400,"High":1400,"Low":1375,"Close":1375,"Volume":35,"Ticker":"BOAM","x":1670889600000,"y":1375},{"Date":"2022-12-14","Open":1360,"High":1375,"Low":1360,"Close":1375,"Volume":164,"Ticker":"BOAM","x":1670976000000,"y":1375},{"Date":"2022-12-15","Open":1400,"High":1400,"Low":1375,"Close":1375,"Volume":749,"Ticker":"BOAM","x":1671062400000,"y":1375},{"Date":"2022-12-19","Open":1375,"High":1375,"Low":1350,"Close":1350,"Volume":878,"Ticker":"BOAM","x":1671408000000,"y":1350},{"Date":"2022-12-20","Open":1350,"High":1350,"Low":1350,"Close":1350,"Volume":50,"Ticker":"BOAM","x":1671494400000,"y":1350},{"Date":"2022-12-21","Open":1355,"High":1450,"Low":1355,"Close":1450,"Volume":131,"Ticker":"BOAM","x":1671580800000,"y":1450},{"Date":"2022-12-22","Open":1445,"High":1475,"Low":1445,"Close":1475,"Volume":268,"Ticker":"BOAM","x":1671667200000,"y":1475},{"Date":"2022-12-23","Open":1395,"High":1450,"Low":1395,"Close":1450,"Volume":236,"Ticker":"BOAM","x":1671753600000,"y":1450},{"Date":"2022-12-27","Open":1445,"High":1445,"Low":1425,"Close":1425,"Volume":590,"Ticker":"BOAM","x":1672099200000,"y":1425},{"Date":"2022-12-28","Open":1425,"High":1475,"Low":1425,"Close":1475,"Volume":27,"Ticker":"BOAM","x":1672185600000,"y":1475},{"Date":"2022-12-29","Open":1470,"High":1470,"Low":1450,"Close":1450,"Volume":146,"Ticker":"BOAM","x":1672272000000,"y":1450},{"Date":"2022-12-30","Open":1445,"High":1445,"Low":1400,"Close":1400,"Volume":56,"Ticker":"BOAM","x":1672358400000,"y":1400},{"Date":"2023-01-03","Open":1350,"High":1350,"Low":1350,"Close":1350,"Volume":710,"Ticker":"BOAM","x":1672704000000,"y":1350},{"Date":"2023-01-04","Open":1350,"High":1350,"Low":1310,"Close":1310,"Volume":707,"Ticker":"BOAM","x":1672790400000,"y":1310},{"Date":"2023-01-05","Open":1310,"High":1345,"Low":1310,"Close":1345,"Volume":427,"Ticker":"BOAM","x":1672876800000,"y":1345},{"Date":"2023-01-06","Open":1310,"High":1310,"Low":1310,"Close":1310,"Volume":1160,"Ticker":"BOAM","x":1672963200000,"y":1310},{"Date":"2023-01-09","Open":1350,"High":1350,"Low":1325,"Close":1325,"Volume":848,"Ticker":"BOAM","x":1673222400000,"y":1325},{"Date":"2023-01-10","Open":1325,"High":1350,"Low":1325,"Close":1350,"Volume":797,"Ticker":"BOAM","x":1673308800000,"y":1350},{"Date":"2023-01-11","Open":1400,"High":1400,"Low":1370,"Close":1370,"Volume":220,"Ticker":"BOAM","x":1673395200000,"y":1370},{"Date":"2023-01-12","Open":1370,"High":1370,"Low":1360,"Close":1360,"Volume":571,"Ticker":"BOAM","x":1673481600000,"y":1360},{"Date":"2023-01-13","Open":1355,"High":1355,"Low":1350,"Close":1350,"Volume":235,"Ticker":"BOAM","x":1673568000000,"y":1350},{"Date":"2023-01-16","Open":1355,"High":1355,"Low":1310,"Close":1310,"Volume":865,"Ticker":"BOAM","x":1673827200000,"y":1310},{"Date":"2023-01-17","Open":1335,"High":1335,"Low":1330,"Close":1330,"Volume":975,"Ticker":"BOAM","x":1673913600000,"y":1330},{"Date":"2023-01-18","Open":1330,"High":1330,"Low":1330,"Close":1330,"Volume":279,"Ticker":"BOAM","x":1674000000000,"y":1330},{"Date":"2023-01-19","Open":1330,"High":1330,"Low":1330,"Close":1330,"Volume":2143,"Ticker":"BOAM","x":1674086400000,"y":1330},{"Date":"2023-01-20","Open":1250,"High":1330,"Low":1250,"Close":1330,"Volume":130,"Ticker":"BOAM","x":1674172800000,"y":1330},{"Date":"2023-01-23","Open":1315,"High":1360,"Low":1315,"Close":1360,"Volume":1150,"Ticker":"BOAM","x":1674432000000,"y":1360},{"Date":"2023-01-24","Open":1360,"High":1360,"Low":1360,"Close":1360,"Volume":95,"Ticker":"BOAM","x":1674518400000,"y":1360},{"Date":"2023-01-25","Open":1360,"High":1360,"Low":1320,"Close":1320,"Volume":697,"Ticker":"BOAM","x":1674604800000,"y":1320},{"Date":"2023-01-26","Open":1330,"High":1330,"Low":1325,"Close":1325,"Volume":147,"Ticker":"BOAM","x":1674691200000,"y":1325},{"Date":"2023-01-27","Open":1330,"High":1330,"Low":1330,"Close":1330,"Volume":117,"Ticker":"BOAM","x":1674777600000,"y":1330},{"Date":"2023-01-30","Open":1315,"High":1320,"Low":1315,"Close":1320,"Volume":331,"Ticker":"BOAM","x":1675036800000,"y":1320},{"Date":"2023-01-31","Open":1330,"High":1330,"Low":1315,"Close":1315,"Volume":665,"Ticker":"BOAM","x":1675123200000,"y":1315},{"Date":"2023-02-01","Open":1315,"High":1315,"Low":1300,"Close":1300,"Volume":1423,"Ticker":"BOAM","x":1675209600000,"y":1300},{"Date":"2023-02-02","Open":1295,"High":1315,"Low":1295,"Close":1315,"Volume":432,"Ticker":"BOAM","x":1675296000000,"y":1315},{"Date":"2023-02-03","Open":1300,"High":1330,"Low":1300,"Close":1330,"Volume":195,"Ticker":"BOAM","x":1675382400000,"y":1330},{"Date":"2023-02-06","Open":1250,"High":1300,"Low":1250,"Close":1300,"Volume":673,"Ticker":"BOAM","x":1675641600000,"y":1300},{"Date":"2023-02-07","Open":1300,"High":1300,"Low":1255,"Close":1255,"Volume":197,"Ticker":"BOAM","x":1675728000000,"y":1255},{"Date":"2023-02-08","Open":1275,"High":1330,"Low":1275,"Close":1330,"Volume":437,"Ticker":"BOAM","x":1675814400000,"y":1330},{"Date":"2023-02-09","Open":1330,"High":1330,"Low":1305,"Close":1305,"Volume":271,"Ticker":"BOAM","x":1675900800000,"y":1305},{"Date":"2023-02-10","Open":1305,"High":1305,"Low":1300,"Close":1300,"Volume":502,"Ticker":"BOAM","x":1675987200000,"y":1300},{"Date":"2023-02-13","Open":1300,"High":1300,"Low":1280,"Close":1280,"Volume":2230,"Ticker":"BOAM","x":1676246400000,"y":1280},{"Date":"2023-02-14","Open":1280,"High":1330,"Low":1280,"Close":1330,"Volume":449,"Ticker":"BOAM","x":1676332800000,"y":1330},{"Date":"2023-02-15","Open":1300,"High":1345,"Low":1300,"Close":1345,"Volume":5503,"Ticker":"BOAM","x":1676419200000,"y":1345},{"Date":"2023-02-16","Open":1300,"High":1305,"Low":1300,"Close":1305,"Volume":117,"Ticker":"BOAM","x":1676505600000,"y":1305},{"Date":"2023-02-17","Open":1305,"High":1345,"Low":1305,"Close":1345,"Volume":1094,"Ticker":"BOAM","x":1676592000000,"y":1345},{"Date":"2023-02-20","Open":1260,"High":1260,"Low":1260,"Close":1260,"Volume":1182,"Ticker":"BOAM","x":1676851200000,"y":1260},{"Date":"2023-02-21","Open":1265,"High":1350,"Low":1265,"Close":1350,"Volume":240,"Ticker":"BOAM","x":1676937600000,"y":1350},{"Date":"2023-02-22","Open":1350,"High":1350,"Low":1350,"Close":1350,"Volume":375,"Ticker":"BOAM","x":1677024000000,"y":1350},{"Date":"2023-02-23","Open":1280,"High":1285,"Low":1280,"Close":1285,"Volume":461,"Ticker":"BOAM","x":1677110400000,"y":1285},{"Date":"2023-02-24","Open":1280,"High":1330,"Low":1280,"Close":1330,"Volume":1840,"Ticker":"BOAM","x":1677196800000,"y":1330},{"Date":"2023-02-27","Open":1330,"High":1330,"Low":1280,"Close":1280,"Volume":235,"Ticker":"BOAM","x":1677456000000,"y":1280},{"Date":"2023-02-28","Open":1290,"High":1330,"Low":1290,"Close":1330,"Volume":460,"Ticker":"BOAM","x":1677542400000,"y":1330},{"Date":"2023-03-01","Open":1330,"High":1330,"Low":1290,"Close":1290,"Volume":577,"Ticker":"BOAM","x":1677628800000,"y":1290},{"Date":"2023-03-02","Open":1235,"High":1350,"Low":1235,"Close":1350,"Volume":1093,"Ticker":"BOAM","x":1677715200000,"y":1350},{"Date":"2023-03-03","Open":1350,"High":1350,"Low":1290,"Close":1290,"Volume":496,"Ticker":"BOAM","x":1677801600000,"y":1290},{"Date":"2023-03-06","Open":1290,"High":1300,"Low":1290,"Close":1300,"Volume":550,"Ticker":"BOAM","x":1678060800000,"y":1300},{"Date":"2023-03-07","Open":1305,"High":1305,"Low":1305,"Close":1305,"Volume":5,"Ticker":"BOAM","x":1678147200000,"y":1305},{"Date":"2023-03-08","Open":1350,"High":1350,"Low":1330,"Close":1330,"Volume":111,"Ticker":"BOAM","x":1678233600000,"y":1330},{"Date":"2023-03-10","Open":1330,"High":1330,"Low":1330,"Close":1330,"Volume":263,"Ticker":"BOAM","x":1678406400000,"y":1330},{"Date":"2023-03-13","Open":1300,"High":1330,"Low":1300,"Close":1330,"Volume":2163,"Ticker":"BOAM","x":1678665600000,"y":1330},{"Date":"2023-03-14","Open":1240,"High":1340,"Low":1240,"Close":1340,"Volume":504,"Ticker":"BOAM","x":1678752000000,"y":1340},{"Date":"2023-03-15","Open":1335,"High":1400,"Low":1335,"Close":1400,"Volume":1655,"Ticker":"BOAM","x":1678838400000,"y":1400},{"Date":"2023-03-16","Open":1300,"High":1300,"Low":1295,"Close":1295,"Volume":2531,"Ticker":"BOAM","x":1678924800000,"y":1295},{"Date":"2023-03-17","Open":1245,"High":1245,"Low":1200,"Close":1200,"Volume":2293,"Ticker":"BOAM","x":1679011200000,"y":1200},{"Date":"2023-03-20","Open":1200,"High":1205,"Low":1200,"Close":1205,"Volume":4245,"Ticker":"BOAM","x":1679270400000,"y":1205},{"Date":"2023-03-21","Open":1200,"High":1255,"Low":1200,"Close":1255,"Volume":6081,"Ticker":"BOAM","x":1679356800000,"y":1255},{"Date":"2023-03-22","Open":1270,"High":1270,"Low":1215,"Close":1215,"Volume":527,"Ticker":"BOAM","x":1679443200000,"y":1215},{"Date":"2023-03-23","Open":1220,"High":1300,"Low":1220,"Close":1300,"Volume":10362,"Ticker":"BOAM","x":1679529600000,"y":1300},{"Date":"2023-03-24","Open":1335,"High":1335,"Low":1295,"Close":1295,"Volume":323,"Ticker":"BOAM","x":1679616000000,"y":1295}],"type":"line"},{"name":"ETIT","data":[{"Date":"2022-03-28","Open":18,"High":18,"Low":17,"Close":18,"Volume":385755,"Ticker":"ETIT","x":1648425600000,"y":18},{"Date":"2022-03-29","Open":17,"High":18,"Low":17,"Close":17,"Volume":686587,"Ticker":"ETIT","x":1648512000000,"y":17},{"Date":"2022-03-30","Open":17,"High":18,"Low":17,"Close":18,"Volume":76660,"Ticker":"ETIT","x":1648598400000,"y":18},{"Date":"2022-03-31","Open":17,"High":17,"Low":17,"Close":17,"Volume":83737,"Ticker":"ETIT","x":1648684800000,"y":17},{"Date":"2022-04-01","Open":17,"High":17,"Low":16,"Close":17,"Volume":2254316,"Ticker":"ETIT","x":1648771200000,"y":17},{"Date":"2022-04-04","Open":17,"High":18,"Low":16,"Close":17,"Volume":263094,"Ticker":"ETIT","x":1649030400000,"y":17},{"Date":"2022-04-05","Open":16,"High":17,"Low":16,"Close":17,"Volume":43577,"Ticker":"ETIT","x":1649116800000,"y":17},{"Date":"2022-04-06","Open":17,"High":17,"Low":17,"Close":17,"Volume":63096,"Ticker":"ETIT","x":1649203200000,"y":17},{"Date":"2022-04-07","Open":17,"High":17,"Low":16,"Close":17,"Volume":68327,"Ticker":"ETIT","x":1649289600000,"y":17},{"Date":"2022-04-08","Open":17,"High":17,"Low":17,"Close":17,"Volume":221460,"Ticker":"ETIT","x":1649376000000,"y":17},{"Date":"2022-04-11","Open":17,"High":17,"Low":16,"Close":17,"Volume":929571,"Ticker":"ETIT","x":1649635200000,"y":17},{"Date":"2022-04-12","Open":17,"High":17,"Low":17,"Close":17,"Volume":706327,"Ticker":"ETIT","x":1649721600000,"y":17},{"Date":"2022-04-13","Open":17,"High":17,"Low":17,"Close":17,"Volume":573031,"Ticker":"ETIT","x":1649808000000,"y":17},{"Date":"2022-04-14","Open":16,"High":17,"Low":16,"Close":17,"Volume":25300,"Ticker":"ETIT","x":1649894400000,"y":17},{"Date":"2022-04-15","Open":17,"High":17,"Low":16,"Close":17,"Volume":654804,"Ticker":"ETIT","x":1649980800000,"y":17},{"Date":"2022-04-19","Open":17,"High":17,"Low":16,"Close":17,"Volume":137892,"Ticker":"ETIT","x":1650326400000,"y":17},{"Date":"2022-04-20","Open":17,"High":17,"Low":16,"Close":17,"Volume":29460,"Ticker":"ETIT","x":1650412800000,"y":17},{"Date":"2022-04-21","Open":17,"High":17,"Low":16,"Close":17,"Volume":268377,"Ticker":"ETIT","x":1650499200000,"y":17},{"Date":"2022-04-22","Open":17,"High":17,"Low":16,"Close":17,"Volume":24134,"Ticker":"ETIT","x":1650585600000,"y":17},{"Date":"2022-04-25","Open":17,"High":17,"Low":16,"Close":17,"Volume":828305,"Ticker":"ETIT","x":1650844800000,"y":17},{"Date":"2022-04-26","Open":17,"High":18,"Low":17,"Close":17,"Volume":2757307,"Ticker":"ETIT","x":1650931200000,"y":17},{"Date":"2022-04-27","Open":17,"High":17,"Low":16,"Close":17,"Volume":296998,"Ticker":"ETIT","x":1651017600000,"y":17},{"Date":"2022-04-29","Open":17,"High":17,"Low":16,"Close":17,"Volume":94343,"Ticker":"ETIT","x":1651190400000,"y":17},{"Date":"2022-05-03","Open":17,"High":17,"Low":16,"Close":16,"Volume":517358,"Ticker":"ETIT","x":1651536000000,"y":16},{"Date":"2022-05-04","Open":16,"High":17,"Low":16,"Close":17,"Volume":1696982,"Ticker":"ETIT","x":1651622400000,"y":17},{"Date":"2022-05-05","Open":17,"High":17,"Low":16,"Close":17,"Volume":401464,"Ticker":"ETIT","x":1651708800000,"y":17},{"Date":"2022-05-06","Open":16,"High":17,"Low":16,"Close":17,"Volume":182196,"Ticker":"ETIT","x":1651795200000,"y":17},{"Date":"2022-05-09","Open":17,"High":17,"Low":16,"Close":17,"Volume":813022,"Ticker":"ETIT","x":1652054400000,"y":17},{"Date":"2022-05-10","Open":17,"High":17,"Low":16,"Close":16,"Volume":487019,"Ticker":"ETIT","x":1652140800000,"y":16},{"Date":"2022-05-11","Open":17,"High":17,"Low":16,"Close":17,"Volume":85577,"Ticker":"ETIT","x":1652227200000,"y":17},{"Date":"2022-05-12","Open":17,"High":17,"Low":17,"Close":17,"Volume":353319,"Ticker":"ETIT","x":1652313600000,"y":17},{"Date":"2022-05-13","Open":17,"High":17,"Low":16,"Close":17,"Volume":113294,"Ticker":"ETIT","x":1652400000000,"y":17},{"Date":"2022-05-16","Open":17,"High":17,"Low":16,"Close":17,"Volume":89355,"Ticker":"ETIT","x":1652659200000,"y":17},{"Date":"2022-05-17","Open":16,"High":17,"Low":16,"Close":16,"Volume":1584431,"Ticker":"ETIT","x":1652745600000,"y":16},{"Date":"2022-05-18","Open":16,"High":16,"Low":15,"Close":16,"Volume":2670049,"Ticker":"ETIT","x":1652832000000,"y":16},{"Date":"2022-05-19","Open":15,"High":16,"Low":15,"Close":16,"Volume":184346,"Ticker":"ETIT","x":1652918400000,"y":16},{"Date":"2022-05-20","Open":16,"High":16,"Low":15,"Close":16,"Volume":144559,"Ticker":"ETIT","x":1653004800000,"y":16},{"Date":"2022-05-23","Open":16,"High":16,"Low":15,"Close":15,"Volume":263302,"Ticker":"ETIT","x":1653264000000,"y":15},{"Date":"2022-05-24","Open":15,"High":16,"Low":15,"Close":16,"Volume":52114,"Ticker":"ETIT","x":1653350400000,"y":16},{"Date":"2022-05-25","Open":16,"High":16,"Low":16,"Close":16,"Volume":604812,"Ticker":"ETIT","x":1653436800000,"y":16},{"Date":"2022-05-27","Open":16,"High":16,"Low":15,"Close":16,"Volume":388853,"Ticker":"ETIT","x":1653609600000,"y":16},{"Date":"2022-05-30","Open":16,"High":16,"Low":16,"Close":16,"Volume":326110,"Ticker":"ETIT","x":1653868800000,"y":16},{"Date":"2022-05-31","Open":16,"High":16,"Low":15,"Close":16,"Volume":1901271,"Ticker":"ETIT","x":1653955200000,"y":16},{"Date":"2022-06-01","Open":16,"High":16,"Low":15,"Close":16,"Volume":2202023,"Ticker":"ETIT","x":1654041600000,"y":16},{"Date":"2022-06-02","Open":16,"High":16,"Low":15,"Close":16,"Volume":55385,"Ticker":"ETIT","x":1654128000000,"y":16},{"Date":"2022-06-03","Open":16,"High":16,"Low":16,"Close":16,"Volume":22077,"Ticker":"ETIT","x":1654214400000,"y":16},{"Date":"2022-06-07","Open":16,"High":16,"Low":15,"Close":16,"Volume":137525,"Ticker":"ETIT","x":1654560000000,"y":16},{"Date":"2022-06-08","Open":16,"High":16,"Low":15,"Close":16,"Volume":34359,"Ticker":"ETIT","x":1654646400000,"y":16},{"Date":"2022-06-09","Open":16,"High":16,"Low":15,"Close":15,"Volume":205204,"Ticker":"ETIT","x":1654732800000,"y":15},{"Date":"2022-06-10","Open":16,"High":16,"Low":15,"Close":16,"Volume":90679,"Ticker":"ETIT","x":1654819200000,"y":16},{"Date":"2022-06-13","Open":16,"High":16,"Low":15,"Close":16,"Volume":69073,"Ticker":"ETIT","x":1655078400000,"y":16},{"Date":"2022-06-14","Open":16,"High":16,"Low":15,"Close":16,"Volume":496997,"Ticker":"ETIT","x":1655164800000,"y":16},{"Date":"2022-06-15","Open":16,"High":16,"Low":15,"Close":15,"Volume":943385,"Ticker":"ETIT","x":1655251200000,"y":15},{"Date":"2022-06-16","Open":15,"High":15,"Low":15,"Close":15,"Volume":67748,"Ticker":"ETIT","x":1655337600000,"y":15},{"Date":"2022-06-17","Open":16,"High":16,"Low":15,"Close":16,"Volume":154144,"Ticker":"ETIT","x":1655424000000,"y":16},{"Date":"2022-06-20","Open":16,"High":16,"Low":15,"Close":16,"Volume":294396,"Ticker":"ETIT","x":1655683200000,"y":16},{"Date":"2022-06-21","Open":16,"High":16,"Low":15,"Close":16,"Volume":978618,"Ticker":"ETIT","x":1655769600000,"y":16},{"Date":"2022-06-22","Open":16,"High":16,"Low":15,"Close":16,"Volume":17285,"Ticker":"ETIT","x":1655856000000,"y":16},{"Date":"2022-06-23","Open":16,"High":16,"Low":16,"Close":16,"Volume":332521,"Ticker":"ETIT","x":1655942400000,"y":16},{"Date":"2022-06-24","Open":15,"High":15,"Low":15,"Close":15,"Volume":2260824,"Ticker":"ETIT","x":1656028800000,"y":15},{"Date":"2022-06-27","Open":15,"High":16,"Low":14,"Close":15,"Volume":644457,"Ticker":"ETIT","x":1656288000000,"y":15},{"Date":"2022-06-28","Open":15,"High":16,"Low":15,"Close":15,"Volume":360774,"Ticker":"ETIT","x":1656374400000,"y":15},{"Date":"2022-06-29","Open":16,"High":16,"Low":15,"Close":15,"Volume":1359421,"Ticker":"ETIT","x":1656460800000,"y":15},{"Date":"2022-06-30","Open":15,"High":16,"Low":15,"Close":16,"Volume":1478876,"Ticker":"ETIT","x":1656547200000,"y":16},{"Date":"2022-07-01","Open":15,"High":16,"Low":15,"Close":16,"Volume":23461,"Ticker":"ETIT","x":1656633600000,"y":16},{"Date":"2022-07-04","Open":15,"High":16,"Low":15,"Close":16,"Volume":63219,"Ticker":"ETIT","x":1656892800000,"y":16},{"Date":"2022-07-05","Open":16,"High":16,"Low":15,"Close":16,"Volume":36734,"Ticker":"ETIT","x":1656979200000,"y":16},{"Date":"2022-07-06","Open":16,"High":16,"Low":15,"Close":16,"Volume":165562,"Ticker":"ETIT","x":1657065600000,"y":16},{"Date":"2022-07-07","Open":15,"High":16,"Low":15,"Close":16,"Volume":190152,"Ticker":"ETIT","x":1657152000000,"y":16},{"Date":"2022-07-08","Open":16,"High":16,"Low":15,"Close":16,"Volume":50984,"Ticker":"ETIT","x":1657238400000,"y":16},{"Date":"2022-07-11","Open":16,"High":16,"Low":15,"Close":16,"Volume":41604,"Ticker":"ETIT","x":1657497600000,"y":16},{"Date":"2022-07-12","Open":16,"High":16,"Low":16,"Close":16,"Volume":20129,"Ticker":"ETIT","x":1657584000000,"y":16},{"Date":"2022-07-13","Open":16,"High":17,"Low":15,"Close":16,"Volume":3428562,"Ticker":"ETIT","x":1657670400000,"y":16},{"Date":"2022-07-14","Open":17,"High":17,"Low":16,"Close":17,"Volume":156740,"Ticker":"ETIT","x":1657756800000,"y":17},{"Date":"2022-07-15","Open":17,"High":17,"Low":17,"Close":17,"Volume":78579,"Ticker":"ETIT","x":1657843200000,"y":17},{"Date":"2022-07-18","Open":17,"High":18,"Low":17,"Close":18,"Volume":1660324,"Ticker":"ETIT","x":1658102400000,"y":18},{"Date":"2022-07-19","Open":18,"High":18,"Low":17,"Close":18,"Volume":69185,"Ticker":"ETIT","x":1658188800000,"y":18},{"Date":"2022-07-20","Open":18,"High":18,"Low":17,"Close":18,"Volume":30845,"Ticker":"ETIT","x":1658275200000,"y":18},{"Date":"2022-07-21","Open":18,"High":18,"Low":17,"Close":18,"Volume":59225,"Ticker":"ETIT","x":1658361600000,"y":18},{"Date":"2022-07-22","Open":18,"High":18,"Low":17,"Close":18,"Volume":430216,"Ticker":"ETIT","x":1658448000000,"y":18},{"Date":"2022-07-25","Open":18,"High":18,"Low":17,"Close":18,"Volume":271810,"Ticker":"ETIT","x":1658707200000,"y":18},{"Date":"2022-07-26","Open":18,"High":19,"Low":18,"Close":18,"Volume":1065670,"Ticker":"ETIT","x":1658793600000,"y":18},{"Date":"2022-07-27","Open":18,"High":19,"Low":18,"Close":19,"Volume":397845,"Ticker":"ETIT","x":1658880000000,"y":19},{"Date":"2022-07-28","Open":19,"High":19,"Low":18,"Close":19,"Volume":137027,"Ticker":"ETIT","x":1658966400000,"y":19},{"Date":"2022-07-29","Open":19,"High":19,"Low":18,"Close":19,"Volume":88782,"Ticker":"ETIT","x":1659052800000,"y":19},{"Date":"2022-08-01","Open":18,"High":19,"Low":18,"Close":19,"Volume":2830342,"Ticker":"ETIT","x":1659312000000,"y":19},{"Date":"2022-08-02","Open":19,"High":19,"Low":18,"Close":19,"Volume":91229,"Ticker":"ETIT","x":1659398400000,"y":19},{"Date":"2022-08-03","Open":19,"High":19,"Low":19,"Close":19,"Volume":170,"Ticker":"ETIT","x":1659484800000,"y":19},{"Date":"2022-08-04","Open":18,"High":19,"Low":18,"Close":18,"Volume":242372,"Ticker":"ETIT","x":1659571200000,"y":18},{"Date":"2022-08-05","Open":18,"High":19,"Low":17,"Close":19,"Volume":553633,"Ticker":"ETIT","x":1659657600000,"y":19},{"Date":"2022-08-09","Open":19,"High":19,"Low":18,"Close":19,"Volume":222354,"Ticker":"ETIT","x":1660003200000,"y":19},{"Date":"2022-08-10","Open":19,"High":19,"Low":18,"Close":18,"Volume":216790,"Ticker":"ETIT","x":1660089600000,"y":18},{"Date":"2022-08-11","Open":19,"High":19,"Low":17,"Close":18,"Volume":72884,"Ticker":"ETIT","x":1660176000000,"y":18},{"Date":"2022-08-12","Open":18,"High":18,"Low":18,"Close":18,"Volume":50850,"Ticker":"ETIT","x":1660262400000,"y":18},{"Date":"2022-08-16","Open":18,"High":18,"Low":17,"Close":18,"Volume":158304,"Ticker":"ETIT","x":1660608000000,"y":18},{"Date":"2022-08-17","Open":18,"High":18,"Low":17,"Close":17,"Volume":130500,"Ticker":"ETIT","x":1660694400000,"y":17},{"Date":"2022-08-18","Open":17,"High":18,"Low":17,"Close":18,"Volume":71345,"Ticker":"ETIT","x":1660780800000,"y":18},{"Date":"2022-08-19","Open":18,"High":18,"Low":17,"Close":18,"Volume":237485,"Ticker":"ETIT","x":1660867200000,"y":18},{"Date":"2022-08-22","Open":18,"High":18,"Low":17,"Close":18,"Volume":695740,"Ticker":"ETIT","x":1661126400000,"y":18},{"Date":"2022-08-23","Open":18,"High":18,"Low":17,"Close":18,"Volume":139231,"Ticker":"ETIT","x":1661212800000,"y":18},{"Date":"2022-08-24","Open":18,"High":18,"Low":17,"Close":18,"Volume":73574,"Ticker":"ETIT","x":1661299200000,"y":18},{"Date":"2022-08-25","Open":18,"High":19,"Low":18,"Close":18,"Volume":587028,"Ticker":"ETIT","x":1661385600000,"y":18},{"Date":"2022-08-26","Open":19,"High":19,"Low":17,"Close":18,"Volume":31514,"Ticker":"ETIT","x":1661472000000,"y":18},{"Date":"2022-08-29","Open":18,"High":19,"Low":18,"Close":19,"Volume":114070,"Ticker":"ETIT","x":1661731200000,"y":19},{"Date":"2022-08-30","Open":19,"High":19,"Low":18,"Close":19,"Volume":115303,"Ticker":"ETIT","x":1661817600000,"y":19},{"Date":"2022-08-31","Open":19,"High":19,"Low":18,"Close":19,"Volume":106576,"Ticker":"ETIT","x":1661904000000,"y":19},{"Date":"2022-09-01","Open":19,"High":19,"Low":18,"Close":19,"Volume":1607013,"Ticker":"ETIT","x":1661990400000,"y":19},{"Date":"2022-09-02","Open":19,"High":19,"Low":18,"Close":18,"Volume":27460,"Ticker":"ETIT","x":1662076800000,"y":18},{"Date":"2022-09-05","Open":18,"High":19,"Low":18,"Close":18,"Volume":229730,"Ticker":"ETIT","x":1662336000000,"y":18},{"Date":"2022-09-06","Open":19,"High":19,"Low":18,"Close":19,"Volume":35201,"Ticker":"ETIT","x":1662422400000,"y":19},{"Date":"2022-09-07","Open":19,"High":19,"Low":18,"Close":19,"Volume":27874,"Ticker":"ETIT","x":1662508800000,"y":19},{"Date":"2022-09-08","Open":19,"High":19,"Low":18,"Close":19,"Volume":260667,"Ticker":"ETIT","x":1662595200000,"y":19},{"Date":"2022-09-09","Open":19,"High":19,"Low":18,"Close":19,"Volume":334614,"Ticker":"ETIT","x":1662681600000,"y":19},{"Date":"2022-09-12","Open":19,"High":19,"Low":18,"Close":19,"Volume":129839,"Ticker":"ETIT","x":1662940800000,"y":19},{"Date":"2022-09-13","Open":19,"High":19,"Low":18,"Close":18,"Volume":131078,"Ticker":"ETIT","x":1663027200000,"y":18},{"Date":"2022-09-14","Open":19,"High":19,"Low":18,"Close":19,"Volume":225323,"Ticker":"ETIT","x":1663113600000,"y":19},{"Date":"2022-09-15","Open":19,"High":19,"Low":18,"Close":18,"Volume":176224,"Ticker":"ETIT","x":1663200000000,"y":18},{"Date":"2022-09-16","Open":18,"High":19,"Low":18,"Close":19,"Volume":700368,"Ticker":"ETIT","x":1663286400000,"y":19},{"Date":"2022-09-19","Open":19,"High":19,"Low":18,"Close":19,"Volume":624962,"Ticker":"ETIT","x":1663545600000,"y":19},{"Date":"2022-09-20","Open":19,"High":19,"Low":18,"Close":19,"Volume":38434,"Ticker":"ETIT","x":1663632000000,"y":19},{"Date":"2022-09-21","Open":19,"High":19,"Low":18,"Close":18,"Volume":111139,"Ticker":"ETIT","x":1663718400000,"y":18},{"Date":"2022-09-22","Open":18,"High":19,"Low":18,"Close":19,"Volume":358825,"Ticker":"ETIT","x":1663804800000,"y":19},{"Date":"2022-09-23","Open":19,"High":19,"Low":18,"Close":19,"Volume":133714,"Ticker":"ETIT","x":1663891200000,"y":19},{"Date":"2022-09-26","Open":19,"High":19,"Low":18,"Close":19,"Volume":106912,"Ticker":"ETIT","x":1664150400000,"y":19},{"Date":"2022-09-27","Open":19,"High":19,"Low":18,"Close":19,"Volume":254378,"Ticker":"ETIT","x":1664236800000,"y":19},{"Date":"2022-09-28","Open":18,"High":19,"Low":18,"Close":19,"Volume":283179,"Ticker":"ETIT","x":1664323200000,"y":19},{"Date":"2022-09-29","Open":19,"High":19,"Low":19,"Close":19,"Volume":16141,"Ticker":"ETIT","x":1664409600000,"y":19},{"Date":"2022-09-30","Open":19,"High":19,"Low":18,"Close":19,"Volume":218320,"Ticker":"ETIT","x":1664496000000,"y":19},{"Date":"2022-10-03","Open":19,"High":19,"Low":18,"Close":19,"Volume":490183,"Ticker":"ETIT","x":1664755200000,"y":19},{"Date":"2022-10-04","Open":19,"High":19,"Low":18,"Close":18,"Volume":125690,"Ticker":"ETIT","x":1664841600000,"y":18},{"Date":"2022-10-05","Open":18,"High":18,"Low":18,"Close":18,"Volume":2361095,"Ticker":"ETIT","x":1664928000000,"y":18},{"Date":"2022-10-06","Open":18,"High":19,"Low":18,"Close":18,"Volume":61194,"Ticker":"ETIT","x":1665014400000,"y":18},{"Date":"2022-10-07","Open":18,"High":19,"Low":18,"Close":19,"Volume":11549,"Ticker":"ETIT","x":1665100800000,"y":19},{"Date":"2022-10-10","Open":18,"High":19,"Low":18,"Close":19,"Volume":1549153,"Ticker":"ETIT","x":1665360000000,"y":19},{"Date":"2022-10-11","Open":18,"High":19,"Low":18,"Close":18,"Volume":543081,"Ticker":"ETIT","x":1665446400000,"y":18},{"Date":"2022-10-12","Open":18,"High":19,"Low":17,"Close":18,"Volume":2233371,"Ticker":"ETIT","x":1665532800000,"y":18},{"Date":"2022-10-13","Open":18,"High":19,"Low":18,"Close":18,"Volume":212683,"Ticker":"ETIT","x":1665619200000,"y":18},{"Date":"2022-10-14","Open":18,"High":19,"Low":18,"Close":18,"Volume":74351,"Ticker":"ETIT","x":1665705600000,"y":18},{"Date":"2022-10-17","Open":19,"High":19,"Low":18,"Close":19,"Volume":154876,"Ticker":"ETIT","x":1665964800000,"y":19},{"Date":"2022-10-18","Open":19,"High":19,"Low":18,"Close":19,"Volume":2052735,"Ticker":"ETIT","x":1666051200000,"y":19},{"Date":"2022-10-19","Open":19,"High":19,"Low":18,"Close":19,"Volume":473259,"Ticker":"ETIT","x":1666137600000,"y":19},{"Date":"2022-10-20","Open":18,"High":19,"Low":18,"Close":19,"Volume":58014,"Ticker":"ETIT","x":1666224000000,"y":19},{"Date":"2022-10-21","Open":19,"High":19,"Low":18,"Close":19,"Volume":1111754,"Ticker":"ETIT","x":1666310400000,"y":19},{"Date":"2022-10-24","Open":19,"High":19,"Low":18,"Close":19,"Volume":214686,"Ticker":"ETIT","x":1666569600000,"y":19},{"Date":"2022-10-25","Open":18,"High":19,"Low":18,"Close":19,"Volume":16489,"Ticker":"ETIT","x":1666656000000,"y":19},{"Date":"2022-10-26","Open":19,"High":19,"Low":18,"Close":19,"Volume":29595,"Ticker":"ETIT","x":1666742400000,"y":19},{"Date":"2022-10-27","Open":19,"High":19,"Low":19,"Close":19,"Volume":171081,"Ticker":"ETIT","x":1666828800000,"y":19},{"Date":"2022-10-28","Open":19,"High":19,"Low":18,"Close":19,"Volume":106300,"Ticker":"ETIT","x":1666915200000,"y":19},{"Date":"2022-10-31","Open":19,"High":19,"Low":19,"Close":19,"Volume":3500,"Ticker":"ETIT","x":1667174400000,"y":19},{"Date":"2022-11-02","Open":19,"High":19,"Low":18,"Close":18,"Volume":97834,"Ticker":"ETIT","x":1667347200000,"y":18},{"Date":"2022-11-03","Open":18,"High":19,"Low":18,"Close":19,"Volume":84144,"Ticker":"ETIT","x":1667433600000,"y":19},{"Date":"2022-11-04","Open":19,"High":19,"Low":18,"Close":19,"Volume":30105,"Ticker":"ETIT","x":1667520000000,"y":19},{"Date":"2022-11-07","Open":19,"High":20,"Low":19,"Close":20,"Volume":1497082,"Ticker":"ETIT","x":1667779200000,"y":20},{"Date":"2022-11-08","Open":20,"High":20,"Low":19,"Close":20,"Volume":68078,"Ticker":"ETIT","x":1667865600000,"y":20},{"Date":"2022-11-09","Open":19,"High":20,"Low":19,"Close":20,"Volume":96144,"Ticker":"ETIT","x":1667952000000,"y":20},{"Date":"2022-11-10","Open":19,"High":20,"Low":19,"Close":20,"Volume":33457,"Ticker":"ETIT","x":1668038400000,"y":20},{"Date":"2022-11-11","Open":20,"High":20,"Low":19,"Close":20,"Volume":111662,"Ticker":"ETIT","x":1668124800000,"y":20},{"Date":"2022-11-14","Open":20,"High":20,"Low":19,"Close":20,"Volume":232853,"Ticker":"ETIT","x":1668384000000,"y":20},{"Date":"2022-11-16","Open":20,"High":20,"Low":19,"Close":20,"Volume":244567,"Ticker":"ETIT","x":1668556800000,"y":20},{"Date":"2022-11-17","Open":19,"High":20,"Low":19,"Close":20,"Volume":148077,"Ticker":"ETIT","x":1668643200000,"y":20},{"Date":"2022-11-18","Open":19,"High":20,"Low":19,"Close":19,"Volume":44162,"Ticker":"ETIT","x":1668729600000,"y":19},{"Date":"2022-11-21","Open":19,"High":20,"Low":19,"Close":19,"Volume":705731,"Ticker":"ETIT","x":1668988800000,"y":19},{"Date":"2022-11-22","Open":19,"High":20,"Low":19,"Close":20,"Volume":435995,"Ticker":"ETIT","x":1669075200000,"y":20},{"Date":"2022-11-23","Open":19,"High":20,"Low":19,"Close":20,"Volume":576979,"Ticker":"ETIT","x":1669161600000,"y":20},{"Date":"2022-11-24","Open":19,"High":20,"Low":19,"Close":20,"Volume":127735,"Ticker":"ETIT","x":1669248000000,"y":20},{"Date":"2022-11-25","Open":19,"High":20,"Low":19,"Close":20,"Volume":144745,"Ticker":"ETIT","x":1669334400000,"y":20},{"Date":"2022-11-28","Open":20,"High":20,"Low":19,"Close":20,"Volume":21299,"Ticker":"ETIT","x":1669593600000,"y":20},{"Date":"2022-11-29","Open":19,"High":20,"Low":19,"Close":20,"Volume":653358,"Ticker":"ETIT","x":1669680000000,"y":20},{"Date":"2022-11-30","Open":19,"High":20,"Low":19,"Close":20,"Volume":588371,"Ticker":"ETIT","x":1669766400000,"y":20},{"Date":"2022-12-01","Open":19,"High":19,"Low":19,"Close":19,"Volume":347576,"Ticker":"ETIT","x":1669852800000,"y":19},{"Date":"2022-12-02","Open":18,"High":19,"Low":18,"Close":19,"Volume":275070,"Ticker":"ETIT","x":1669939200000,"y":19},{"Date":"2022-12-05","Open":18,"High":19,"Low":18,"Close":19,"Volume":32335,"Ticker":"ETIT","x":1670198400000,"y":19},{"Date":"2022-12-06","Open":19,"High":19,"Low":19,"Close":19,"Volume":85416,"Ticker":"ETIT","x":1670284800000,"y":19},{"Date":"2022-12-07","Open":19,"High":19,"Low":19,"Close":19,"Volume":17934,"Ticker":"ETIT","x":1670371200000,"y":19},{"Date":"2022-12-08","Open":19,"High":19,"Low":19,"Close":19,"Volume":65037,"Ticker":"ETIT","x":1670457600000,"y":19},{"Date":"2022-12-09","Open":19,"High":19,"Low":19,"Close":19,"Volume":499989,"Ticker":"ETIT","x":1670544000000,"y":19},{"Date":"2022-12-12","Open":19,"High":19,"Low":19,"Close":19,"Volume":164395,"Ticker":"ETIT","x":1670803200000,"y":19},{"Date":"2022-12-13","Open":18,"High":19,"Low":18,"Close":19,"Volume":21028,"Ticker":"ETIT","x":1670889600000,"y":19},{"Date":"2022-12-14","Open":19,"High":19,"Low":19,"Close":19,"Volume":65088,"Ticker":"ETIT","x":1670976000000,"y":19},{"Date":"2022-12-15","Open":19,"High":19,"Low":19,"Close":19,"Volume":29513,"Ticker":"ETIT","x":1671062400000,"y":19},{"Date":"2022-12-16","Open":19,"High":20,"Low":19,"Close":20,"Volume":1431468,"Ticker":"ETIT","x":1671148800000,"y":20},{"Date":"2022-12-19","Open":19,"High":19,"Low":19,"Close":19,"Volume":68511,"Ticker":"ETIT","x":1671408000000,"y":19},{"Date":"2022-12-20","Open":18,"High":19,"Low":18,"Close":19,"Volume":41130,"Ticker":"ETIT","x":1671494400000,"y":19},{"Date":"2022-12-21","Open":19,"High":19,"Low":19,"Close":19,"Volume":39946,"Ticker":"ETIT","x":1671580800000,"y":19},{"Date":"2022-12-22","Open":18,"High":19,"Low":18,"Close":19,"Volume":532576,"Ticker":"ETIT","x":1671667200000,"y":19},{"Date":"2022-12-23","Open":19,"High":20,"Low":19,"Close":20,"Volume":33280,"Ticker":"ETIT","x":1671753600000,"y":20},{"Date":"2022-12-27","Open":20,"High":20,"Low":20,"Close":20,"Volume":198938,"Ticker":"ETIT","x":1672099200000,"y":20},{"Date":"2022-12-28","Open":20,"High":20,"Low":19,"Close":19,"Volume":368390,"Ticker":"ETIT","x":1672185600000,"y":19},{"Date":"2022-12-29","Open":19,"High":19,"Low":19,"Close":19,"Volume":2810627,"Ticker":"ETIT","x":1672272000000,"y":19},{"Date":"2022-12-30","Open":19,"High":19,"Low":18,"Close":19,"Volume":109511,"Ticker":"ETIT","x":1672358400000,"y":19},{"Date":"2023-01-02","Open":19,"High":19,"Low":19,"Close":19,"Volume":104313,"Ticker":"ETIT","x":1672617600000,"y":19},{"Date":"2023-01-03","Open":19,"High":19,"Low":19,"Close":19,"Volume":32006,"Ticker":"ETIT","x":1672704000000,"y":19},{"Date":"2023-01-04","Open":19,"High":19,"Low":19,"Close":19,"Volume":24663,"Ticker":"ETIT","x":1672790400000,"y":19},{"Date":"2023-01-05","Open":19,"High":20,"Low":19,"Close":20,"Volume":665706,"Ticker":"ETIT","x":1672876800000,"y":20},{"Date":"2023-01-06","Open":20,"High":20,"Low":19,"Close":19,"Volume":3308801,"Ticker":"ETIT","x":1672963200000,"y":19},{"Date":"2023-01-09","Open":19,"High":19,"Low":19,"Close":19,"Volume":1263945,"Ticker":"ETIT","x":1673222400000,"y":19},{"Date":"2023-01-10","Open":18,"High":18,"Low":18,"Close":18,"Volume":292716,"Ticker":"ETIT","x":1673308800000,"y":18},{"Date":"2023-01-11","Open":19,"High":19,"Low":19,"Close":19,"Volume":12953,"Ticker":"ETIT","x":1673395200000,"y":19},{"Date":"2023-01-12","Open":19,"High":19,"Low":19,"Close":19,"Volume":38440,"Ticker":"ETIT","x":1673481600000,"y":19},{"Date":"2023-01-13","Open":19,"High":19,"Low":19,"Close":19,"Volume":49382,"Ticker":"ETIT","x":1673568000000,"y":19},{"Date":"2023-01-16","Open":19,"High":19,"Low":19,"Close":19,"Volume":52202,"Ticker":"ETIT","x":1673827200000,"y":19},{"Date":"2023-01-17","Open":19,"High":20,"Low":19,"Close":20,"Volume":104928,"Ticker":"ETIT","x":1673913600000,"y":20},{"Date":"2023-01-18","Open":20,"High":20,"Low":20,"Close":20,"Volume":20245,"Ticker":"ETIT","x":1674000000000,"y":20},{"Date":"2023-01-19","Open":20,"High":20,"Low":20,"Close":20,"Volume":56157,"Ticker":"ETIT","x":1674086400000,"y":20},{"Date":"2023-01-20","Open":20,"High":20,"Low":20,"Close":20,"Volume":59550,"Ticker":"ETIT","x":1674172800000,"y":20},{"Date":"2023-01-23","Open":20,"High":20,"Low":20,"Close":20,"Volume":48297,"Ticker":"ETIT","x":1674432000000,"y":20},{"Date":"2023-01-24","Open":20,"High":20,"Low":20,"Close":20,"Volume":15710,"Ticker":"ETIT","x":1674518400000,"y":20},{"Date":"2023-01-25","Open":19,"High":20,"Low":19,"Close":20,"Volume":94056,"Ticker":"ETIT","x":1674604800000,"y":20},{"Date":"2023-01-26","Open":20,"High":20,"Low":20,"Close":20,"Volume":333023,"Ticker":"ETIT","x":1674691200000,"y":20},{"Date":"2023-01-27","Open":20,"High":20,"Low":20,"Close":20,"Volume":16695,"Ticker":"ETIT","x":1674777600000,"y":20},{"Date":"2023-01-30","Open":20,"High":20,"Low":20,"Close":20,"Volume":44760,"Ticker":"ETIT","x":1675036800000,"y":20},{"Date":"2023-01-31","Open":20,"High":20,"Low":20,"Close":20,"Volume":127128,"Ticker":"ETIT","x":1675123200000,"y":20},{"Date":"2023-02-01","Open":19,"High":20,"Low":19,"Close":20,"Volume":45982,"Ticker":"ETIT","x":1675209600000,"y":20},{"Date":"2023-02-02","Open":20,"High":20,"Low":20,"Close":20,"Volume":89419,"Ticker":"ETIT","x":1675296000000,"y":20},{"Date":"2023-02-03","Open":20,"High":20,"Low":20,"Close":20,"Volume":50500,"Ticker":"ETIT","x":1675382400000,"y":20},{"Date":"2023-02-06","Open":20,"High":20,"Low":20,"Close":20,"Volume":30913,"Ticker":"ETIT","x":1675641600000,"y":20},{"Date":"2023-02-07","Open":19,"High":20,"Low":19,"Close":20,"Volume":116165,"Ticker":"ETIT","x":1675728000000,"y":20},{"Date":"2023-02-08","Open":20,"High":20,"Low":19,"Close":19,"Volume":21750,"Ticker":"ETIT","x":1675814400000,"y":19},{"Date":"2023-02-09","Open":19,"High":20,"Low":19,"Close":20,"Volume":1098556,"Ticker":"ETIT","x":1675900800000,"y":20},{"Date":"2023-02-10","Open":20,"High":20,"Low":20,"Close":20,"Volume":200466,"Ticker":"ETIT","x":1675987200000,"y":20},{"Date":"2023-02-13","Open":19,"High":20,"Low":19,"Close":20,"Volume":100602,"Ticker":"ETIT","x":1676246400000,"y":20},{"Date":"2023-02-14","Open":20,"High":20,"Low":20,"Close":20,"Volume":74090,"Ticker":"ETIT","x":1676332800000,"y":20},{"Date":"2023-02-15","Open":19,"High":20,"Low":19,"Close":20,"Volume":76706,"Ticker":"ETIT","x":1676419200000,"y":20},{"Date":"2023-02-16","Open":19,"High":20,"Low":19,"Close":20,"Volume":1292629,"Ticker":"ETIT","x":1676505600000,"y":20},{"Date":"2023-02-17","Open":20,"High":20,"Low":20,"Close":20,"Volume":17228,"Ticker":"ETIT","x":1676592000000,"y":20},{"Date":"2023-02-20","Open":20,"High":20,"Low":20,"Close":20,"Volume":551629,"Ticker":"ETIT","x":1676851200000,"y":20},{"Date":"2023-02-21","Open":19,"High":21,"Low":19,"Close":21,"Volume":349729,"Ticker":"ETIT","x":1676937600000,"y":21},{"Date":"2023-02-22","Open":20,"High":20,"Low":20,"Close":20,"Volume":194789,"Ticker":"ETIT","x":1677024000000,"y":20},{"Date":"2023-02-23","Open":19,"High":20,"Low":19,"Close":20,"Volume":264036,"Ticker":"ETIT","x":1677110400000,"y":20},{"Date":"2023-02-24","Open":20,"High":20,"Low":20,"Close":20,"Volume":161613,"Ticker":"ETIT","x":1677196800000,"y":20},{"Date":"2023-02-27","Open":20,"High":20,"Low":20,"Close":20,"Volume":57737,"Ticker":"ETIT","x":1677456000000,"y":20},{"Date":"2023-02-28","Open":19,"High":20,"Low":19,"Close":20,"Volume":52684,"Ticker":"ETIT","x":1677542400000,"y":20},{"Date":"2023-03-01","Open":20,"High":20,"Low":20,"Close":20,"Volume":96577,"Ticker":"ETIT","x":1677628800000,"y":20},{"Date":"2023-03-02","Open":20,"High":20,"Low":20,"Close":20,"Volume":113959,"Ticker":"ETIT","x":1677715200000,"y":20},{"Date":"2023-03-03","Open":20,"High":20,"Low":20,"Close":20,"Volume":334792,"Ticker":"ETIT","x":1677801600000,"y":20},{"Date":"2023-03-06","Open":20,"High":20,"Low":20,"Close":20,"Volume":1319402,"Ticker":"ETIT","x":1678060800000,"y":20},{"Date":"2023-03-07","Open":20,"High":20,"Low":20,"Close":20,"Volume":13770,"Ticker":"ETIT","x":1678147200000,"y":20},{"Date":"2023-03-08","Open":20,"High":20,"Low":20,"Close":20,"Volume":259647,"Ticker":"ETIT","x":1678233600000,"y":20},{"Date":"2023-03-09","Open":20,"High":20,"Low":20,"Close":20,"Volume":27362,"Ticker":"ETIT","x":1678320000000,"y":20},{"Date":"2023-03-10","Open":20,"High":20,"Low":20,"Close":20,"Volume":49814,"Ticker":"ETIT","x":1678406400000,"y":20},{"Date":"2023-03-13","Open":20,"High":20,"Low":20,"Close":20,"Volume":1060145,"Ticker":"ETIT","x":1678665600000,"y":20},{"Date":"2023-03-14","Open":20,"High":20,"Low":20,"Close":20,"Volume":1056867,"Ticker":"ETIT","x":1678752000000,"y":20},{"Date":"2023-03-15","Open":20,"High":20,"Low":20,"Close":20,"Volume":2821165,"Ticker":"ETIT","x":1678838400000,"y":20},{"Date":"2023-03-16","Open":20,"High":20,"Low":20,"Close":20,"Volume":462170,"Ticker":"ETIT","x":1678924800000,"y":20},{"Date":"2023-03-17","Open":20,"High":20,"Low":20,"Close":20,"Volume":1153626,"Ticker":"ETIT","x":1679011200000,"y":20},{"Date":"2023-03-20","Open":20,"High":20,"Low":20,"Close":20,"Volume":237206,"Ticker":"ETIT","x":1679270400000,"y":20},{"Date":"2023-03-21","Open":20,"High":20,"Low":20,"Close":20,"Volume":536535,"Ticker":"ETIT","x":1679356800000,"y":20},{"Date":"2023-03-22","Open":20,"High":20,"Low":20,"Close":20,"Volume":195805,"Ticker":"ETIT","x":1679443200000,"y":20},{"Date":"2023-03-23","Open":20,"High":20,"Low":20,"Close":20,"Volume":913348,"Ticker":"ETIT","x":1679529600000,"y":20},{"Date":"2023-03-24","Open":20,"High":20,"Low":20,"Close":20,"Volume":1281760,"Ticker":"ETIT","x":1679616000000,"y":20}],"type":"line"}],"xAxis":{"title":{"text":""}}},"theme":{"chart":{"backgroundColor":"transparent"},"colors":["#7cb5ec","#434348","#90ed7d","#f7a35c","#8085e9","#f15c80","#e4d354","#2b908f","#f45b5b","#91e8e1"]},"conf_opts":{"global":{"Date":null,"VMLRadialGradientURL":"http =//code.highcharts.com/list(version)/gfx/vml-radial-gradient.png","canvasToolsURL":"http =//code.highcharts.com/list(version)/modules/canvas-tools.js","getTimezoneOffset":null,"timezoneOffset":0,"useUTC":true},"lang":{"contextButtonTitle":"Chart context menu","decimalPoint":".","downloadCSV":"Download CSV","downloadJPEG":"Download JPEG image","downloadPDF":"Download PDF document","downloadPNG":"Download PNG image","downloadSVG":"Download SVG vector image","downloadXLS":"Download XLS","drillUpText":"◁ Back to {series.name}","exitFullscreen":"Exit from full screen","exportData":{"annotationHeader":"Annotations","categoryDatetimeHeader":"DateTime","categoryHeader":"Category"},"hideData":"Hide data table","invalidDate":null,"loading":"Loading...","months":["January","February","March","April","May","June","July","August","September","October","November","December"],"noData":"No data to display","numericSymbolMagnitude":1000,"numericSymbols":["k","M","G","T","P","E"],"printChart":"Print chart","resetZoom":"Reset zoom","resetZoomTitle":"Reset zoom level 1:1","shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"shortWeekdays":["Sat","Sun","Mon","Tue","Wed","Thu","Fri"],"thousandsSep":" ","viewData":"View data table","viewFullscreen":"View in full screen","weekdays":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]}},"type":"stock","fonts":[],"debug":false},"evals":[],"jsHooks":[]}</script>
</div>


## The **BRVM_company_info("ticker")** function

It receives the ticker of a company listed on the BRVM stock exchange, Turn to upper case the input by using toupper() and returns informations about the company's RSI, Beta, Closing price, etc. .


```r

# Get informations such us beta, RSI, Closing, Valorisation, etc. of Bank Of Africa Senegal
inform <- BRVM_company_info("BOAS")
inform
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Informations </th>
   <th style="text-align:left;"> Values </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Volume (titres) </td>
   <td style="text-align:left;"> 2 618 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Volume (XOF ) </td>
   <td style="text-align:left;"> 5 694 150 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ouverture </td>
   <td style="text-align:left;"> 2 175 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Plus haut </td>
   <td style="text-align:left;"> 2 175 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Plus bas </td>
   <td style="text-align:left;"> 2 175 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Clôture veille </td>
   <td style="text-align:left;"> 2 175 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Beta 1 an </td>
   <td style="text-align:left;"> 0,11 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RSI </td>
   <td style="text-align:left;"> 27,66 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Capital échangé </td>
   <td style="text-align:left;"> 0,01% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Valorisation </td>
   <td style="text-align:left;"> 52 200 MXOF </td>
  </tr>
</tbody>
</table>

> - **BRVM_cap()** : receives no argument and returns informations about BRVM capitalization


```r
capit_ <- BRVM_cap()
capit_
```

```
#> [1] "Make sure you have an active internet connection"
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> x </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Make sure you have an active internet connection </td>
  </tr>
</tbody>
</table>

> - **BRVM_company_rank()** : returns companies rank from the BRVM Bourse exchange according to their daily change (variation).



```r
comp.rank <- BRVM_company_rank() #Get companies rank
comp.rank <- comp.rank%>%
    arrange(desc(percent_change)) #Describe in decreasing order

comp.rank
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> ticker </th>
   <th style="text-align:left;"> company_name </th>
   <th style="text-align:right;"> percent_change </th>
   <th style="text-align:right;"> rank </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> SEMC </td>
   <td style="text-align:left;"> CROWN SIEM COTE D'IVOIRE </td>
   <td style="text-align:right;"> 7.14 </td>
   <td style="text-align:right;"> 1.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NEIC </td>
   <td style="text-align:left;"> NEI-CEDA COTE D'IVOIRE </td>
   <td style="text-align:right;"> 6.98 </td>
   <td style="text-align:right;"> 2.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PRSC </td>
   <td style="text-align:left;"> TRACTAFRIC MOTORS COTE D'IVOIRE </td>
   <td style="text-align:right;"> 6.90 </td>
   <td style="text-align:right;"> 3.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAC </td>
   <td style="text-align:left;"> BANK OF AFRICA COTE D'IVOIRE </td>
   <td style="text-align:right;"> 2.97 </td>
   <td style="text-align:right;"> 4.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NTLC </td>
   <td style="text-align:left;"> NESTLE COTE D'IVOIRE </td>
   <td style="text-align:right;"> 2.79 </td>
   <td style="text-align:right;"> 5.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAB </td>
   <td style="text-align:left;"> BANK OF AFRICA BENIN </td>
   <td style="text-align:right;"> 1.13 </td>
   <td style="text-align:right;"> 6.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NSBC </td>
   <td style="text-align:left;"> NSIA BANQUE COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.81 </td>
   <td style="text-align:right;"> 7.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAN </td>
   <td style="text-align:left;"> BANK OF AFRICA NIGER </td>
   <td style="text-align:right;"> 0.73 </td>
   <td style="text-align:right;"> 8.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PALC </td>
   <td style="text-align:left;"> PALM COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.41 </td>
   <td style="text-align:right;"> 9.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ORAC </td>
   <td style="text-align:left;"> ORANGE COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.21 </td>
   <td style="text-align:right;"> 10.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BICC </td>
   <td style="text-align:left;"> BICI COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOABF </td>
   <td style="text-align:left;"> BANK OF AFRICA BURKINA FASO </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAS </td>
   <td style="text-align:left;"> BANK OF AFRICA SENEGAL </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CBIBF </td>
   <td style="text-align:left;"> CORIS BANK INTERNATIONAL BURKINA FASO </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CFAC </td>
   <td style="text-align:left;"> CFAO MOTORS COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ETIT </td>
   <td style="text-align:left;"> Ecobank Transnational Incorporated TOGO </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FTSC </td>
   <td style="text-align:left;"> FILTISAC COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SHEC </td>
   <td style="text-align:left;"> VIVO ENERGY COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SIVC </td>
   <td style="text-align:left;"> AIR LIQUIDE COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SLBC </td>
   <td style="text-align:left;"> SOLIBRA COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SMBC </td>
   <td style="text-align:left;"> SMB COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> STBC </td>
   <td style="text-align:left;"> SITAB COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SVOC </td>
   <td style="text-align:left;"> MOVIS COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TTLC </td>
   <td style="text-align:left;"> TOTAL COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TTRC </td>
   <td style="text-align:left;"> TRITURAF Ste en Liquid </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UNLC </td>
   <td style="text-align:left;"> UNILEVER COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UNXC </td>
   <td style="text-align:left;"> UNIWAX COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
   <td style="text-align:right;"> 19.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SDCC </td>
   <td style="text-align:left;"> SODE COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.10 </td>
   <td style="text-align:right;"> 28.5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPHC </td>
   <td style="text-align:left;"> SAPH COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.10 </td>
   <td style="text-align:right;"> 28.5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ORGT </td>
   <td style="text-align:left;"> ORAGROUP TOGO </td>
   <td style="text-align:right;"> -0.18 </td>
   <td style="text-align:right;"> 30.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ECOC </td>
   <td style="text-align:left;"> ECOBANK COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.20 </td>
   <td style="text-align:right;"> 31.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SIBC </td>
   <td style="text-align:left;"> SOCIETE IVOIRIENNE DE BANQUE COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.30 </td>
   <td style="text-align:right;"> 32.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SDSC </td>
   <td style="text-align:left;"> BOLLORE TRANSPORT &amp; LOGISTICS COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.34 </td>
   <td style="text-align:right;"> 33.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ABJC </td>
   <td style="text-align:left;"> SERVAIR ABIDJAN  COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.38 </td>
   <td style="text-align:right;"> 34.5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAM </td>
   <td style="text-align:left;"> BANK OF AFRICA MALI </td>
   <td style="text-align:right;"> -0.38 </td>
   <td style="text-align:right;"> 34.5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ONTBF </td>
   <td style="text-align:left;"> ONATEL BURKINA FASO </td>
   <td style="text-align:right;"> -0.44 </td>
   <td style="text-align:right;"> 36.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CIEC </td>
   <td style="text-align:left;"> CIE COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.47 </td>
   <td style="text-align:right;"> 37.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNBC </td>
   <td style="text-align:left;"> BERNABE COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.50 </td>
   <td style="text-align:right;"> 38.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SNTS </td>
   <td style="text-align:left;"> SONATEL SENEGAL </td>
   <td style="text-align:right;"> -0.63 </td>
   <td style="text-align:right;"> 39.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SCRC </td>
   <td style="text-align:left;"> SUCRIVOIRE COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.72 </td>
   <td style="text-align:right;"> 40.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SOGC </td>
   <td style="text-align:left;"> SOGB COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.88 </td>
   <td style="text-align:right;"> 41.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SAFC </td>
   <td style="text-align:left;"> SAFCA COTE D'IVOIRE </td>
   <td style="text-align:right;"> -1.04 </td>
   <td style="text-align:right;"> 42.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SGBC </td>
   <td style="text-align:left;"> SOCIETE GENERALE COTE D'IVOIRE </td>
   <td style="text-align:right;"> -1.07 </td>
   <td style="text-align:right;"> 43.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CABC </td>
   <td style="text-align:left;"> SICABLE COTE D'IVOIRE </td>
   <td style="text-align:right;"> -2.40 </td>
   <td style="text-align:right;"> 44.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TTLS </td>
   <td style="text-align:left;"> TOTAL SENEGAL </td>
   <td style="text-align:right;"> -2.93 </td>
   <td style="text-align:right;"> 45.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> STAC </td>
   <td style="text-align:left;"> SETAO COTE D'IVOIRE </td>
   <td style="text-align:right;"> -4.55 </td>
   <td style="text-align:right;"> 46.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SICC </td>
   <td style="text-align:left;"> SICOR COTE D'IVOIRE </td>
   <td style="text-align:right;"> -7.47 </td>
   <td style="text-align:right;"> 47.0 </td>
  </tr>
</tbody>
</table>

> - **BRVM_direction(".up_or_down")** : Takes 'Up' or 'Down' and returns respectively n results for the top or flop ranking of the BRVM tickers.

* .up_or_down : This is a character string set to "Up" by default It can either be 'Up' or 'Down'.



```r

# Rank in increasing order the price of shares listed on the BRVM according to daily variations.
brvm_down <- BRVM_direction("Down")
brvm_down
```

<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Symbole </th>
   <th style="text-align:left;"> Nom </th>
   <th style="text-align:right;"> Variation (%) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> SICC </td>
   <td style="text-align:left;"> SICOR COTE D'IVOIRE </td>
   <td style="text-align:right;"> -7.47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> STAC </td>
   <td style="text-align:left;"> SETAO COTE D'IVOIRE </td>
   <td style="text-align:right;"> -4.55 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TTLS </td>
   <td style="text-align:left;"> TOTAL SENEGAL </td>
   <td style="text-align:right;"> -2.93 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CABC </td>
   <td style="text-align:left;"> SICABLE COTE D'IVOIRE </td>
   <td style="text-align:right;"> -2.40 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SGBC </td>
   <td style="text-align:left;"> SOCIETE GENERALE COTE D'IVOIRE </td>
   <td style="text-align:right;"> -1.07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SAFC </td>
   <td style="text-align:left;"> SAFCA COTE D'IVOIRE </td>
   <td style="text-align:right;"> -1.04 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SOGC </td>
   <td style="text-align:left;"> SOGB COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.88 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SCRC </td>
   <td style="text-align:left;"> SUCRIVOIRE COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.72 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SNTS </td>
   <td style="text-align:left;"> SONATEL SENEGAL </td>
   <td style="text-align:right;"> -0.63 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BNBC </td>
   <td style="text-align:left;"> BERNABE COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.50 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CIEC </td>
   <td style="text-align:left;"> CIE COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.47 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ONTBF </td>
   <td style="text-align:left;"> ONATEL BURKINA FASO </td>
   <td style="text-align:right;"> -0.44 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ABJC </td>
   <td style="text-align:left;"> SERVAIR ABIDJAN COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAM </td>
   <td style="text-align:left;"> BANK OF AFRICA MALI </td>
   <td style="text-align:right;"> -0.38 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SDSC </td>
   <td style="text-align:left;"> BOLLORE TRANSPORT &amp; LOGISTICS COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.34 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SIBC </td>
   <td style="text-align:left;"> SOCIETE IVOIRIENNE DE BANQUE COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.30 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ECOC </td>
   <td style="text-align:left;"> ECOBANK COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.20 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ORGT </td>
   <td style="text-align:left;"> ORAGROUP TOGO </td>
   <td style="text-align:right;"> -0.18 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SDCC </td>
   <td style="text-align:left;"> SODE COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SPHC </td>
   <td style="text-align:left;"> SAPH COTE D'IVOIRE </td>
   <td style="text-align:right;"> -0.10 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BICC </td>
   <td style="text-align:left;"> BICI COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOABF </td>
   <td style="text-align:left;"> BANK OF AFRICA BURKINA FASO </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAS </td>
   <td style="text-align:left;"> BANK OF AFRICA SENEGAL </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CBIBF </td>
   <td style="text-align:left;"> CORIS BANK INTERNATIONAL BURKINA FASO </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CFAC </td>
   <td style="text-align:left;"> CFAO MOTORS COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ETIT </td>
   <td style="text-align:left;"> Ecobank Transnational Incorporated TOGO </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FTSC </td>
   <td style="text-align:left;"> FILTISAC COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SHEC </td>
   <td style="text-align:left;"> VIVO ENERGY COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SIVC </td>
   <td style="text-align:left;"> AIR LIQUIDE COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SLBC </td>
   <td style="text-align:left;"> SOLIBRA COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SMBC </td>
   <td style="text-align:left;"> SMB COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> STBC </td>
   <td style="text-align:left;"> SITAB COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SVOC </td>
   <td style="text-align:left;"> MOVIS COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TTLC </td>
   <td style="text-align:left;"> TOTAL COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TTRC </td>
   <td style="text-align:left;"> TRITURAF Ste en Liquid </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UNLC </td>
   <td style="text-align:left;"> UNILEVER COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> UNXC </td>
   <td style="text-align:left;"> UNIWAX COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ORAC </td>
   <td style="text-align:left;"> ORANGE COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PALC </td>
   <td style="text-align:left;"> PALM COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.41 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAN </td>
   <td style="text-align:left;"> BANK OF AFRICA NIGER </td>
   <td style="text-align:right;"> 0.73 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NSBC </td>
   <td style="text-align:left;"> NSIA BANQUE COTE D'IVOIRE </td>
   <td style="text-align:right;"> 0.81 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAB </td>
   <td style="text-align:left;"> BANK OF AFRICA BENIN </td>
   <td style="text-align:right;"> 1.13 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NTLC </td>
   <td style="text-align:left;"> NESTLE COTE D'IVOIRE </td>
   <td style="text-align:right;"> 2.79 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> BOAC </td>
   <td style="text-align:left;"> BANK OF AFRICA COTE D'IVOIRE </td>
   <td style="text-align:right;"> 2.97 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PRSC </td>
   <td style="text-align:left;"> TRACTAFRIC MOTORS COTE D'IVOIRE </td>
   <td style="text-align:right;"> 6.90 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NEIC </td>
   <td style="text-align:left;"> NEI-CEDA COTE D'IVOIRE </td>
   <td style="text-align:right;"> 6.98 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SEMC </td>
   <td style="text-align:left;"> CROWN SIEM COTE D'IVOIRE </td>
   <td style="text-align:right;"> 7.14 </td>
  </tr>
</tbody>
</table>


> - **BRVM_rank** : receives "top" or "flop" and a number 'n' and returns table of companies classification

* top_or_flop : Choose between "top" or "flop"

* n : is the number of companies in the classification


```r
#To get top 15
BRVM_rank("top", 15)
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

#To get flop 5
BRVM_rank("flop", 5)
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


**Authors** : <br>

* [Koffi Frederic Sessie](https://github.com/Koffi-Fredysessie) (<koffisessie@gmail.com>),

* [Abdoul Oudouss Diakité](https://github.com/AODiakite) (<abdouloudoussdiakite@gmail.com>),

* [Sanderson Steven](https://github.com/spsanderson)(<spsanderson@gmail.com>)<br>


**Creator** : Koffi Frederic Sessie <br>

    
**cph (Copyright Holder)** : Koffi Frederic Sessie <br>
    
**License** : MIT 2023, BRVM authors. All rights reserved.
