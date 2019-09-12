Assmt 1: gapminder exploration
================
Trevor Baker
11/09/2019

This document explores the *gapminder* dataset of historical demographic
data spanning from 1952 to 2007.

The dataset includes the following
    fields:

    ## [1] "country"   "continent" "year"      "lifeExp"   "pop"       "gdpPercap"

There seems to be an asymptotic relationship between life expectancy and
GDP. Mean life expectancy doesn’t increase much beyond 80 years, no
matter how rich the country.

``` r
leg.labels <- levels(as.factor(gm$continent))

{ plot(gm$gdpPercap,
     gm$lifeExp, 
     xlim=c(0,50000),
     ylab="Life expectancy (years)",
     xlab="GDP per capita",
     col=as.factor(gm$continent))
legend("bottomright", pch=21, pt.bg=1:length(leg.labels),
       legend=leg.labels ) }
```

![](hw01_gapminder_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->
