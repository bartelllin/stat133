hw05
================
bartell lin

``` r
library("dieroller")
```

``` r
dice <- die()
count <- 0
for (i in 1:1000) {
  t <- roll(dice, 4)
  if (6 %in% t$rolls) {
    count <- count + 1
  }
}
count
```

    ## [1] 519

``` r
freq <- count/1000
freq
```

    ## [1] 0.519

``` r
d1 <- die()
d2 <- die()
c <- 0
for (i in 1:1000) {
  t1 <- roll(d1, 24)
  t2 <- roll(d2, 24)
  temp <- 0
  for (i in 1:24) {
    if (t1[i] == 6 & t2[i] == 6) {
      temp <- temp + 1
    }
  }
  if (temp > 0) {
    c <- c + 1
  }
}
c
```

    ## [1] 509

``` r
freq <- c/1000
freq
```

    ## [1] 0.509
