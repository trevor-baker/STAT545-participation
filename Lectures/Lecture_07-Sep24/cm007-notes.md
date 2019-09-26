cm007-notes
================
Trevor Baker
24/09/2019

    ## # A tibble: 4 x 2
    ##       a b    
    ##   <int> <chr>
    ## 1     1 small
    ## 2     2 small
    ## 3     3 small
    ## 4     4 small

    ## # A tibble: 4 x 3
    ##       a c     d    
    ##   <int> <chr> <chr>
    ## 1     1 small small
    ## 2     2 small small
    ## 3     3 big   big  
    ## 4     4 big   big

Diff between summarize and mutate:

``` r
library(gapminder)
gapminder %>%
  summarize(mu = mean(lifeExp)) #one column, one row
```

    ## # A tibble: 1 x 1
    ##      mu
    ##   <dbl>
    ## 1  59.5

``` r
gapminder %>%
  mutate(mu = mean(lifeExp)) #mu value tacked on as column, all rows still there
```

    ## # A tibble: 1,704 x 7
    ##    country     continent  year lifeExp      pop gdpPercap    mu
    ##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl> <dbl>
    ##  1 Afghanistan Asia       1952    28.8  8425333      779.  59.5
    ##  2 Afghanistan Asia       1957    30.3  9240934      821.  59.5
    ##  3 Afghanistan Asia       1962    32.0 10267083      853.  59.5
    ##  4 Afghanistan Asia       1967    34.0 11537966      836.  59.5
    ##  5 Afghanistan Asia       1972    36.1 13079460      740.  59.5
    ##  6 Afghanistan Asia       1977    38.4 14880372      786.  59.5
    ##  7 Afghanistan Asia       1982    39.9 12881816      978.  59.5
    ##  8 Afghanistan Asia       1987    40.8 13867957      852.  59.5
    ##  9 Afghanistan Asia       1992    41.7 16317921      649.  59.5
    ## 10 Afghanistan Asia       1997    41.8 22227415      635.  59.5
    ## # ... with 1,694 more rows

`group_by` can group by a novel variable, adding a new column to the
tibble:

``` r
gapminder %>%
  group_by(small.lifeExp= lifeExp < 60)
```

    ## # A tibble: 1,704 x 7
    ## # Groups:   small.lifeExp [2]
    ##    country     continent  year lifeExp      pop gdpPercap small.lifeExp
    ##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl> <lgl>        
    ##  1 Afghanistan Asia       1952    28.8  8425333      779. TRUE         
    ##  2 Afghanistan Asia       1957    30.3  9240934      821. TRUE         
    ##  3 Afghanistan Asia       1962    32.0 10267083      853. TRUE         
    ##  4 Afghanistan Asia       1967    34.0 11537966      836. TRUE         
    ##  5 Afghanistan Asia       1972    36.1 13079460      740. TRUE         
    ##  6 Afghanistan Asia       1977    38.4 14880372      786. TRUE         
    ##  7 Afghanistan Asia       1982    39.9 12881816      978. TRUE         
    ##  8 Afghanistan Asia       1987    40.8 13867957      852. TRUE         
    ##  9 Afghanistan Asia       1992    41.7 16317921      649. TRUE         
    ## 10 Afghanistan Asia       1997    41.8 22227415      635. TRUE         
    ## # ... with 1,694 more rows

Add identifying column to your group\_by tibble:

``` r
gapminder %>%
  mutate(group=paste(continent,year,sep="_")) %>%
           group_by(continent, year)
```

    ## # A tibble: 1,704 x 7
    ## # Groups:   continent, year [60]
    ##    country     continent  year lifeExp      pop gdpPercap group    
    ##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl> <chr>    
    ##  1 Afghanistan Asia       1952    28.8  8425333      779. Asia_1952
    ##  2 Afghanistan Asia       1957    30.3  9240934      821. Asia_1957
    ##  3 Afghanistan Asia       1962    32.0 10267083      853. Asia_1962
    ##  4 Afghanistan Asia       1967    34.0 11537966      836. Asia_1967
    ##  5 Afghanistan Asia       1972    36.1 13079460      740. Asia_1972
    ##  6 Afghanistan Asia       1977    38.4 14880372      786. Asia_1977
    ##  7 Afghanistan Asia       1982    39.9 12881816      978. Asia_1982
    ##  8 Afghanistan Asia       1987    40.8 13867957      852. Asia_1987
    ##  9 Afghanistan Asia       1992    41.7 16317921      649. Asia_1992
    ## 10 Afghanistan Asia       1997    41.8 22227415      635. Asia_1997
    ## # ... with 1,694 more rows

*Window functions* take in vector, return a vector that depends on the
entire vector e.g. `rank()` - you can’t get the right output going
linearly along vector, need to look at whole whereas `round()` just
works linearly along vector

`lubridate`

``` r
ymd <- lubridate::mdy("Sep 24. 2019", 
               "09 25 19", 
               "Sept 26 2019",
               "Septem 27 2019",
               "September 28 2019")

#lubridate does not do year-month format but tsibble does
tsibble::yearmonth(ymd)
```

    ## [1] "2019 Sep" "2019 Sep" "2019 Sep" "2019 Sep" "2019 Sep"

`tsibble` can create tsibble object like so, give date column as “index”

``` r
#didn't get this to work, couldnt get data loaded
# energy <- here::here("data", "daily_consumption.csv") %>% 
#   read_csv()
# energy <- as_tsibble(energy)
```
