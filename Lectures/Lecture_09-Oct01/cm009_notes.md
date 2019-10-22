---
title: "cm009_notes"
author: "Trevor Baker"
date: "01/10/2019"
output: 
  html_document:
    keep_md: true
---


```r
library(tidyverse)
```

```
## -- Attaching packages ----------------------------------------------------------------------------------------------------------------------------- tidyverse 1.2.1 --
```

```
## v ggplot2 3.2.1     v purrr   0.3.2
## v tibble  2.1.3     v dplyr   0.8.3
## v tidyr   1.0.0     v stringr 1.4.0
## v readr   1.3.1     v forcats 0.4.0
```

```
## -- Conflicts -------------------------------------------------------------------------------------------------------------------------------- tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```




```r
haireye_untidy <- data.frame(hair=c("black","blue","purple"),
                             brown_eyed=c(3,45,6),
                             red_eyed=c(2,34,56),
                             black_eyed=c(3,4,26))

#method 1, static column names
haireye_untidy %>% 
  pivot_longer(cols      = c(brown_eyed, red_eyed, black_eyed),
               names_to  = "eye",
               values_to = "n")
```

```
## # A tibble: 9 x 3
##   hair   eye            n
##   <fct>  <chr>      <dbl>
## 1 black  brown_eyed     3
## 2 black  red_eyed       2
## 3 black  black_eyed     3
## 4 blue   brown_eyed    45
## 5 blue   red_eyed      34
## 6 blue   black_eyed     4
## 7 purple brown_eyed     6
## 8 purple red_eyed      56
## 9 purple black_eyed    26
```

```r
#method 2, better, flexible col names
haireye_untidy %>% 
  pivot_longer(cols      = -hair,
               names_to  = "eye",
               values_to = "n")
```

```
## # A tibble: 9 x 3
##   hair   eye            n
##   <fct>  <chr>      <dbl>
## 1 black  brown_eyed     3
## 2 black  red_eyed       2
## 3 black  black_eyed     3
## 4 blue   brown_eyed    45
## 5 blue   red_eyed      34
## 6 blue   black_eyed     4
## 7 purple brown_eyed     6
## 8 purple red_eyed      56
## 9 purple black_eyed    26
```

```r
#make a longer dataset, one row per person, yet to be counted up
haireye_untidy %>% 
  pivot_longer(cols      = -hair,
               names_to  = "eye",
               values_to = "n") %>%
  uncount(n)
```

```
## # A tibble: 179 x 2
##    hair  eye       
##    <fct> <chr>     
##  1 black brown_eyed
##  2 black brown_eyed
##  3 black brown_eyed
##  4 black red_eyed  
##  5 black red_eyed  
##  6 black black_eyed
##  7 black black_eyed
##  8 black black_eyed
##  9 blue  brown_eyed
## 10 blue  brown_eyed
## # ... with 169 more rows
```


# work today was mostly in the cm009_exercise.Rmd file
