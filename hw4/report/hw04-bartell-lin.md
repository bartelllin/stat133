hw04
================
Bartell Lin

``` r
source("../code/archive_functions.R")
source("../code/regex_functions.R")
```

``` r
raw_data <- read_archive("stringr")
clean_data <- clean_archive(raw_data)
plot_archive(clean_data)
```

![](hw04-bartell-lin_files/figure-markdown_github/unnamed-chunk-2-1.png)

``` r
ggsave("../images/stingr.png")
```

    ## Saving 7 x 5 in image

``` r
raw_gg <- read_archive("ggplot2")
clean_gg <- clean_archive(raw_gg)
write.csv(clean_gg, "../data/ggplot2_archive.csv")

raw_xml <- read_archive("XML")
clean_xml <- clean_archive(raw_xml)
write.csv(clean_xml, "../data/XML_archive.csv")

raw_knitr <- read_archive("knitr")
clean_knitr <- clean_archive(raw_knitr)
write.csv(clean_knitr, "../data/knitr_archive.csv")

raw_dp <- read_archive("dplyr")
clean_dp <- clean_archive(raw_dp)
write.csv(clean_dp, "../data/dplyr_archive.csv")
```

``` r
ggplot(rbind(clean_gg, clean_dp, clean_knitr, clean_xml)) + geom_step(aes(date, size, color = name))
```

![](hw04-bartell-lin_files/figure-markdown_github/unnamed-chunk-4-1.png)

``` r
ggsave("../images/overlay.png")
```

    ## Saving 7 x 5 in image

``` r
ggplot(rbind(clean_gg, clean_dp, clean_knitr, clean_xml)) + geom_step(aes(date, size, color = name)) + facet_wrap(~name)
```

![](hw04-bartell-lin_files/figure-markdown_github/unnamed-chunk-5-1.png)

``` r
ggsave("../images/facet.png")
```

    ## Saving 7 x 5 in image

``` r
split_char("Go Bears!")
```

    ## [1] "G" "o" " " "B" "e" "a" "r" "s" "!"

``` r
split_char("Expecto Patronum")
```

    ##  [1] "E" "x" "p" "e" "c" "t" "o" " " "P" "a" "t" "r" "o" "n" "u" "m"

``` r
vec <- c(split_char("Go Bears!"))
num_vowels(vec)
```

    ## s
    ## a e i o u 
    ## 1 1 0 1 0

``` r
count_vowels("The quick brown fox jumps over the lazy dog")
```

    ## s
    ## a e i o u 
    ## 1 3 1 4 2

``` r
count_vowels("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")
```

    ## s
    ## a e i o u 
    ## 1 3 1 4 2

``` r
reverse_chars("gattaca")
```

    ## [1] "acattag"

``` r
reverse_chars("Lumox Maxima")
```

    ## [1] "amixaM xomuL"

``` r
reverse_words("sentence! this reverse")
```

    ## [1] "reverse this sentence!"

``` r
reverse_words("string")
```

    ## [1] "string"

``` r
dat <- read.csv('../data/text-emotion.csv', stringsAsFactors = FALSE)
```

``` r
count <- c()
for (i in dat['content']) {
  count <- c(count, str_length(i))
}
summary(count)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    1.00   43.00   69.00   73.41  103.00  167.00

``` r
hist(count, breaks= seq(0,170,5))
```

![](hw04-bartell-lin_files/figure-markdown_github/unnamed-chunk-12-1.png)

``` r
ten <- c()
n <- length(dat['content'][,])
counts <- c()
for (i in 1:1000) {
  spl <- str_split(dat['content'][, 1], " ")[[i]]
  spl <- grepl("^@\\w{1}[[:alnum:]_\\]+$", spl)
  counts <- c(counts, sum(spl))
  if (sum(spl) == 10) {
    ten <- c(dat['content'][, 1][[i]])
  }
}
```

``` r
for (i in 10001:2000) {
  spl <- str_split(dat['content'][, 1], " ")[[i]]
  spl <- grepl("^@\\w{1}[[:alnum:]_\\]+$", spl)
  counts <- c(counts, sum(spl))
  if (sum(spl) == 10) {
    ten <- c(dat['content'][, 1][[i]])
  }
}
```

``` r
for (i in 2001:3000) {
  spl <- str_split(dat['content'][, 1], " ")[[i]]
  spl <- grepl("^@\\w{1}[[:alnum:]_\\]+$", spl)
  counts <- c(counts, sum(spl))
  if (sum(spl) == 10) {
    ten <- c(dat['content'][, 1][[i]])
  }
}
```

``` r
for (i in 3001:4000) {
  spl <- str_split(dat['content'][, 1], " ")[[i]]
  spl <- grepl("^@\\w{1}[[:alnum:]_\\]+$", spl)
  counts <- c(counts, sum(spl))
  if (sum(spl) == 10) {
    ten <- c(dat['content'][, 1][[i]])
  }
}
```

``` r
hist(counts)
```

![](hw04-bartell-lin_files/figure-markdown_github/unnamed-chunk-17-1.png)

``` r
ten
```

    ## [1] "last #ff  @Mel_Diesel @vja4041 @DemonFactory @shawnmcguirt @SEO_Web_Design @ChuckSwanson @agracing @confidentgolf @tluckow @legalblonde31"

``` r
n <- length(dat['content'][,])
len <- c()
hash <- c()
for (i in 1:1000) {
  spl <- str_split(dat['content'][, 1], " ")[[i]]
  s <- grepl("^#\\w{1}[[:alpha:]]+[[:alnum:]]+$", spl)
  hash <- c(counts, sum(s))
  len <- c(len, str_length(spl[s]) - 1)
}
```

``` r
for (i in 1001:2000) {
  spl <- str_split(dat['content'][, 1], " ")[[i]]
  s <- grepl("^#\\w{1}[[:alpha:]]+[[:alnum:]]+$", spl)
  hash <- c(counts, sum(s))
  len <- c(len, str_length(spl[s]) - 1)
}
```

``` r
for (i in 2001:3000) {
  spl <- str_split(dat['content'][, 1], " ")[[i]]
  s <- grepl("^#\\w{1}[[:alpha:]]+[[:alnum:]]+$", spl)
  hash <- c(counts, sum(s))
  len <- c(len, str_length(spl[s]) - 1)
}
```

``` r
for (i in 3001:4000) {
  spl <- str_split(dat['content'][, 1], " ")[[i]]
  s <- grepl("^#\\w{1}[[:alpha:]]+[[:alnum:]]+$", spl)
  hash <- c(counts, sum(s))
  len <- c(len, str_length(spl[s]) - 1)
}
```

``` r
hist(hash)
```

![](hw04-bartell-lin_files/figure-markdown_github/unnamed-chunk-24-1.png)

``` r
mean(len)
```

    ## [1] 8.550725

``` r
unique(len)[which.max(tabulate(match(len, unique(len))))]
```

    ## [1] 4
