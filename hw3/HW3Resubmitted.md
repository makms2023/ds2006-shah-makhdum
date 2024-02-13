## Working Directory: What is the working directory? What are the best practices for setting and using the working directory?

### The working directory is the directory in the file system where R will look for and save files by default unless otherwise specified.

1.  Always set the working directory at the beginning of your script.
2.  Avoid hardcoding paths
3.  Consider using the here() package to avoid harcoding paths.
4.  Use getwd() to check the current working directory.
5.  Avoid confusion by being aware of where your files are located and
    where R is looking for them.

<!-- -->

    name<-"Makhdum Mourad Shah"
    ls()

    ## [1] "name"

    v1 <- c(TRUE, FALSE, TRUE, FALSE, TRUE)
    v2 <- c(1L, 2L, 3L, 4L, 5L)
    v3 <- c(1.1, 2.2, 3.3, 4.4, 5.5)
    v4 <- c("apple", "banana", "watermelon", "mango", "grape")
    V <- list(v1, v2, v3, v4)
    str(V)

    ## List of 4
    ##  $ : logi [1:5] TRUE FALSE TRUE FALSE TRUE
    ##  $ : int [1:5] 1 2 3 4 5
    ##  $ : num [1:5] 1.1 2.2 3.3 4.4 5.5
    ##  $ : chr [1:5] "apple" "banana" "watermelon" "mango" ...

    newmatrix <- matrix(data = 1:20, nrow = 4, ncol = 5)
    newsequence <- seq(from = 22, to = 44)
    newarray <- cbind(newmatrix,newsequence)

    ## Warning in cbind(newmatrix, newsequence): number of rows of result is not a
    ## multiple of vector length (arg 2)

    element <- v3[3]
    d1 <- read.csv("http://hbiostat.org/data/repo/2.20.Framingham.csv")
    column_4 <- d1[, 4]
    fifth_row <- d1[5, ]

    bmi<- d1$bmi

## Purpose of this Function:

### The pipe operator allow us to do multiple operations in a concise manner without having to save the intermediate results.

    require(dplyr)

    ## Loading required package: dplyr

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    # Old way
    sum(log(sqrt(select(d1,age)),base=10))

    ## [1] 3890.094

    # OG magrittr pipe
    d1 %>% 
      pull(age)  %>% 
      sqrt  %>% 
      log(base=10)  %>% 
      sum

    ## [1] 3890.094

    d1 %>% 
      lm(sbp ~ dbp, data = .)  # Use the dot if the piped objects needs to go to an input other than the first

    ## 
    ## Call:
    ## lm(formula = sbp ~ dbp, data = .)
    ## 
    ## Coefficients:
    ## (Intercept)          dbp  
    ##      16.947        1.403

    d1 %>% 
      split(.$sex) %>%  # Can use the input multiple times
      lapply(function(x){x$age %>% mean})

    ## $`1`
    ## [1] 45.796
    ## 
    ## $`2`
    ## [1] 46.23057

    # New base R pipe
    d1 |> 
      pull(age) |> 
      sqrt() |> # Note the parentheses have to be used
      log(base=10) |> 
      sum()

    ## [1] 3890.094

    d1 |>  
      lm(sbp ~ dbp, data = _) # Use `_` instead of `.` with new pipe

    ## 
    ## Call:
    ## lm(formula = sbp ~ dbp, data = d1)
    ## 
    ## Coefficients:
    ## (Intercept)          dbp  
    ##      16.947        1.403

## Prime UVA phone numbers in the form (434) 924-???

    prime <- function(x){
      ps <- primes::generate_primes(min = 2, max = ceiling(sqrt(x)))
      for(i in ps) if(x%%i == 0) return(FALSE)
      TRUE
    }

    k <- 0
    for(i in 0:9999) {
      phone_number <- 4349240000 + i
      if (prime(phone_number)) {
        k <- k + 1
      }
    }
    k

    ## [1] 471

## List of Prime UVA phone numbers in the form (434) 924-???

    prime <- function(x) {
      ps <- primes::generate_primes(min = 2, max = ceiling(sqrt(x)))
      for (i in ps) if (x %% i == 0) return(FALSE)
      TRUE
    }

    k <- 0

    for (i in 0:9999) {
      uva_number <- 4349240000 + i
      if (prime(uva_number)) {
        k <- k + 1
        print(paste("(434) 924-", sprintf("%04d", i), " is prime"))
      }
    }

    ## [1] "(434) 924- 0003  is prime"
    ## [1] "(434) 924- 0029  is prime"
    ## [1] "(434) 924- 0059  is prime"
    ## [1] "(434) 924- 0069  is prime"
    ## [1] "(434) 924- 0099  is prime"
    ## [1] "(434) 924- 0123  is prime"
    ## [1] "(434) 924- 0141  is prime"
    ## [1] "(434) 924- 0179  is prime"
    ## [1] "(434) 924- 0197  is prime"
    ## [1] "(434) 924- 0279  is prime"
    ## [1] "(434) 924- 0299  is prime"
    ## [1] "(434) 924- 0309  is prime"
    ## [1] "(434) 924- 0327  is prime"
    ## [1] "(434) 924- 0351  is prime"
    ## [1] "(434) 924- 0383  is prime"
    ## [1] "(434) 924- 0393  is prime"
    ## [1] "(434) 924- 0411  is prime"
    ## [1] "(434) 924- 0431  is prime"
    ## [1] "(434) 924- 0447  is prime"
    ## [1] "(434) 924- 0513  is prime"
    ## [1] "(434) 924- 0521  is prime"
    ## [1] "(434) 924- 0527  is prime"
    ## [1] "(434) 924- 0537  is prime"
    ## [1] "(434) 924- 0549  is prime"
    ## [1] "(434) 924- 0561  is prime"
    ## [1] "(434) 924- 0569  is prime"
    ## [1] "(434) 924- 0617  is prime"
    ## [1] "(434) 924- 0627  is prime"
    ## [1] "(434) 924- 0653  is prime"
    ## [1] "(434) 924- 0671  is prime"
    ## [1] "(434) 924- 0699  is prime"
    ## [1] "(434) 924- 0723  is prime"
    ## [1] "(434) 924- 0737  is prime"
    ## [1] "(434) 924- 0743  is prime"
    ## [1] "(434) 924- 0761  is prime"
    ## [1] "(434) 924- 0801  is prime"
    ## [1] "(434) 924- 0803  is prime"
    ## [1] "(434) 924- 0807  is prime"
    ## [1] "(434) 924- 0827  is prime"
    ## [1] "(434) 924- 0839  is prime"
    ## [1] "(434) 924- 0851  is prime"
    ## [1] "(434) 924- 0869  is prime"
    ## [1] "(434) 924- 0879  is prime"
    ## [1] "(434) 924- 0899  is prime"
    ## [1] "(434) 924- 0941  is prime"
    ## [1] "(434) 924- 0947  is prime"
    ## [1] "(434) 924- 0971  is prime"
    ## [1] "(434) 924- 0993  is prime"
    ## [1] "(434) 924- 1011  is prime"
    ## [1] "(434) 924- 1047  is prime"
    ## [1] "(434) 924- 1059  is prime"
    ## [1] "(434) 924- 1073  is prime"
    ## [1] "(434) 924- 1077  is prime"
    ## [1] "(434) 924- 1101  is prime"
    ## [1] "(434) 924- 1103  is prime"
    ## [1] "(434) 924- 1133  is prime"
    ## [1] "(434) 924- 1163  is prime"
    ## [1] "(434) 924- 1167  is prime"
    ## [1] "(434) 924- 1179  is prime"
    ## [1] "(434) 924- 1271  is prime"
    ## [1] "(434) 924- 1277  is prime"
    ## [1] "(434) 924- 1313  is prime"
    ## [1] "(434) 924- 1367  is prime"
    ## [1] "(434) 924- 1433  is prime"
    ## [1] "(434) 924- 1443  is prime"
    ## [1] "(434) 924- 1451  is prime"
    ## [1] "(434) 924- 1467  is prime"
    ## [1] "(434) 924- 1499  is prime"
    ## [1] "(434) 924- 1521  is prime"
    ## [1] "(434) 924- 1653  is prime"
    ## [1] "(434) 924- 1667  is prime"
    ## [1] "(434) 924- 1697  is prime"
    ## [1] "(434) 924- 1713  is prime"
    ## [1] "(434) 924- 1719  is prime"
    ## [1] "(434) 924- 1727  is prime"
    ## [1] "(434) 924- 1731  is prime"
    ## [1] "(434) 924- 1739  is prime"
    ## [1] "(434) 924- 1779  is prime"
    ## [1] "(434) 924- 1781  is prime"
    ## [1] "(434) 924- 1791  is prime"
    ## [1] "(434) 924- 1803  is prime"
    ## [1] "(434) 924- 1811  is prime"
    ## [1] "(434) 924- 1823  is prime"
    ## [1] "(434) 924- 1859  is prime"
    ## [1] "(434) 924- 1863  is prime"
    ## [1] "(434) 924- 1887  is prime"
    ## [1] "(434) 924- 1899  is prime"
    ## [1] "(434) 924- 1917  is prime"
    ## [1] "(434) 924- 1929  is prime"
    ## [1] "(434) 924- 1983  is prime"
    ## [1] "(434) 924- 1991  is prime"
    ## [1] "(434) 924- 2003  is prime"
    ## [1] "(434) 924- 2021  is prime"
    ## [1] "(434) 924- 2099  is prime"
    ## [1] "(434) 924- 2147  is prime"
    ## [1] "(434) 924- 2151  is prime"
    ## [1] "(434) 924- 2189  is prime"
    ## [1] "(434) 924- 2193  is prime"
    ## [1] "(434) 924- 2199  is prime"
    ## [1] "(434) 924- 2211  is prime"
    ## [1] "(434) 924- 2229  is prime"
    ## [1] "(434) 924- 2241  is prime"
    ## [1] "(434) 924- 2273  is prime"
    ## [1] "(434) 924- 2343  is prime"
    ## [1] "(434) 924- 2351  is prime"
    ## [1] "(434) 924- 2357  is prime"
    ## [1] "(434) 924- 2369  is prime"
    ## [1] "(434) 924- 2393  is prime"
    ## [1] "(434) 924- 2397  is prime"
    ## [1] "(434) 924- 2421  is prime"
    ## [1] "(434) 924- 2427  is prime"
    ## [1] "(434) 924- 2459  is prime"
    ## [1] "(434) 924- 2493  is prime"
    ## [1] "(434) 924- 2501  is prime"
    ## [1] "(434) 924- 2511  is prime"
    ## [1] "(434) 924- 2517  is prime"
    ## [1] "(434) 924- 2543  is prime"
    ## [1] "(434) 924- 2577  is prime"
    ## [1] "(434) 924- 2591  is prime"
    ## [1] "(434) 924- 2613  is prime"
    ## [1] "(434) 924- 2637  is prime"
    ## [1] "(434) 924- 2657  is prime"
    ## [1] "(434) 924- 2679  is prime"
    ## [1] "(434) 924- 2687  is prime"
    ## [1] "(434) 924- 2727  is prime"
    ## [1] "(434) 924- 2739  is prime"
    ## [1] "(434) 924- 2759  is prime"
    ## [1] "(434) 924- 2789  is prime"
    ## [1] "(434) 924- 2817  is prime"
    ## [1] "(434) 924- 2847  is prime"
    ## [1] "(434) 924- 2873  is prime"
    ## [1] "(434) 924- 2913  is prime"
    ## [1] "(434) 924- 2921  is prime"
    ## [1] "(434) 924- 2939  is prime"
    ## [1] "(434) 924- 2943  is prime"
    ## [1] "(434) 924- 2949  is prime"
    ## [1] "(434) 924- 2987  is prime"
    ## [1] "(434) 924- 2993  is prime"
    ## [1] "(434) 924- 3021  is prime"
    ## [1] "(434) 924- 3023  is prime"
    ## [1] "(434) 924- 3131  is prime"
    ## [1] "(434) 924- 3147  is prime"
    ## [1] "(434) 924- 3149  is prime"
    ## [1] "(434) 924- 3153  is prime"
    ## [1] "(434) 924- 3201  is prime"
    ## [1] "(434) 924- 3207  is prime"
    ## [1] "(434) 924- 3219  is prime"
    ## [1] "(434) 924- 3221  is prime"
    ## [1] "(434) 924- 3257  is prime"
    ## [1] "(434) 924- 3281  is prime"
    ## [1] "(434) 924- 3287  is prime"
    ## [1] "(434) 924- 3309  is prime"
    ## [1] "(434) 924- 3357  is prime"
    ## [1] "(434) 924- 3383  is prime"
    ## [1] "(434) 924- 3401  is prime"
    ## [1] "(434) 924- 3407  is prime"
    ## [1] "(434) 924- 3429  is prime"
    ## [1] "(434) 924- 3449  is prime"
    ## [1] "(434) 924- 3491  is prime"
    ## [1] "(434) 924- 3497  is prime"
    ## [1] "(434) 924- 3513  is prime"
    ## [1] "(434) 924- 3527  is prime"
    ## [1] "(434) 924- 3537  is prime"
    ## [1] "(434) 924- 3543  is prime"
    ## [1] "(434) 924- 3597  is prime"
    ## [1] "(434) 924- 3677  is prime"
    ## [1] "(434) 924- 3681  is prime"
    ## [1] "(434) 924- 3687  is prime"
    ## [1] "(434) 924- 3693  is prime"
    ## [1] "(434) 924- 3707  is prime"
    ## [1] "(434) 924- 3737  is prime"
    ## [1] "(434) 924- 3749  is prime"
    ## [1] "(434) 924- 3753  is prime"
    ## [1] "(434) 924- 3761  is prime"
    ## [1] "(434) 924- 3803  is prime"
    ## [1] "(434) 924- 3867  is prime"
    ## [1] "(434) 924- 3869  is prime"
    ## [1] "(434) 924- 3881  is prime"
    ## [1] "(434) 924- 3891  is prime"
    ## [1] "(434) 924- 3893  is prime"
    ## [1] "(434) 924- 3897  is prime"
    ## [1] "(434) 924- 3923  is prime"
    ## [1] "(434) 924- 3957  is prime"
    ## [1] "(434) 924- 3981  is prime"
    ## [1] "(434) 924- 4013  is prime"
    ## [1] "(434) 924- 4019  is prime"
    ## [1] "(434) 924- 4037  is prime"
    ## [1] "(434) 924- 4049  is prime"
    ## [1] "(434) 924- 4101  is prime"
    ## [1] "(434) 924- 4103  is prime"
    ## [1] "(434) 924- 4131  is prime"
    ## [1] "(434) 924- 4139  is prime"
    ## [1] "(434) 924- 4149  is prime"
    ## [1] "(434) 924- 4161  is prime"
    ## [1] "(434) 924- 4167  is prime"
    ## [1] "(434) 924- 4197  is prime"
    ## [1] "(434) 924- 4203  is prime"
    ## [1] "(434) 924- 4209  is prime"
    ## [1] "(434) 924- 4227  is prime"
    ## [1] "(434) 924- 4281  is prime"
    ## [1] "(434) 924- 4349  is prime"
    ## [1] "(434) 924- 4353  is prime"
    ## [1] "(434) 924- 4397  is prime"
    ## [1] "(434) 924- 4401  is prime"
    ## [1] "(434) 924- 4407  is prime"
    ## [1] "(434) 924- 4421  is prime"
    ## [1] "(434) 924- 4437  is prime"
    ## [1] "(434) 924- 4461  is prime"
    ## [1] "(434) 924- 4481  is prime"
    ## [1] "(434) 924- 4539  is prime"
    ## [1] "(434) 924- 4553  is prime"
    ## [1] "(434) 924- 4563  is prime"
    ## [1] "(434) 924- 4577  is prime"
    ## [1] "(434) 924- 4611  is prime"
    ## [1] "(434) 924- 4619  is prime"
    ## [1] "(434) 924- 4629  is prime"
    ## [1] "(434) 924- 4707  is prime"
    ## [1] "(434) 924- 4709  is prime"
    ## [1] "(434) 924- 4719  is prime"
    ## [1] "(434) 924- 4733  is prime"
    ## [1] "(434) 924- 4763  is prime"
    ## [1] "(434) 924- 4773  is prime"
    ## [1] "(434) 924- 4787  is prime"
    ## [1] "(434) 924- 4821  is prime"
    ## [1] "(434) 924- 4857  is prime"
    ## [1] "(434) 924- 4859  is prime"
    ## [1] "(434) 924- 4877  is prime"
    ## [1] "(434) 924- 4923  is prime"
    ## [1] "(434) 924- 4971  is prime"
    ## [1] "(434) 924- 4979  is prime"
    ## [1] "(434) 924- 4983  is prime"
    ## [1] "(434) 924- 5009  is prime"
    ## [1] "(434) 924- 5013  is prime"
    ## [1] "(434) 924- 5049  is prime"
    ## [1] "(434) 924- 5067  is prime"
    ## [1] "(434) 924- 5073  is prime"
    ## [1] "(434) 924- 5091  is prime"
    ## [1] "(434) 924- 5093  is prime"
    ## [1] "(434) 924- 5111  is prime"
    ## [1] "(434) 924- 5139  is prime"
    ## [1] "(434) 924- 5171  is prime"
    ## [1] "(434) 924- 5177  is prime"
    ## [1] "(434) 924- 5183  is prime"
    ## [1] "(434) 924- 5193  is prime"
    ## [1] "(434) 924- 5207  is prime"
    ## [1] "(434) 924- 5259  is prime"
    ## [1] "(434) 924- 5261  is prime"
    ## [1] "(434) 924- 5267  is prime"
    ## [1] "(434) 924- 5321  is prime"
    ## [1] "(434) 924- 5343  is prime"
    ## [1] "(434) 924- 5379  is prime"
    ## [1] "(434) 924- 5387  is prime"
    ## [1] "(434) 924- 5393  is prime"
    ## [1] "(434) 924- 5423  is prime"
    ## [1] "(434) 924- 5427  is prime"
    ## [1] "(434) 924- 5463  is prime"
    ## [1] "(434) 924- 5469  is prime"
    ## [1] "(434) 924- 5477  is prime"
    ## [1] "(434) 924- 5487  is prime"
    ## [1] "(434) 924- 5499  is prime"
    ## [1] "(434) 924- 5553  is prime"
    ## [1] "(434) 924- 5583  is prime"
    ## [1] "(434) 924- 5613  is prime"
    ## [1] "(434) 924- 5619  is prime"
    ## [1] "(434) 924- 5699  is prime"
    ## [1] "(434) 924- 5723  is prime"
    ## [1] "(434) 924- 5751  is prime"
    ## [1] "(434) 924- 5801  is prime"
    ## [1] "(434) 924- 5807  is prime"
    ## [1] "(434) 924- 5841  is prime"
    ## [1] "(434) 924- 5853  is prime"
    ## [1] "(434) 924- 5861  is prime"
    ## [1] "(434) 924- 5883  is prime"
    ## [1] "(434) 924- 5889  is prime"
    ## [1] "(434) 924- 5891  is prime"
    ## [1] "(434) 924- 5961  is prime"
    ## [1] "(434) 924- 5997  is prime"
    ## [1] "(434) 924- 6047  is prime"
    ## [1] "(434) 924- 6059  is prime"
    ## [1] "(434) 924- 6101  is prime"
    ## [1] "(434) 924- 6113  is prime"
    ## [1] "(434) 924- 6159  is prime"
    ## [1] "(434) 924- 6177  is prime"
    ## [1] "(434) 924- 6201  is prime"
    ## [1] "(434) 924- 6233  is prime"
    ## [1] "(434) 924- 6267  is prime"
    ## [1] "(434) 924- 6273  is prime"
    ## [1] "(434) 924- 6287  is prime"
    ## [1] "(434) 924- 6311  is prime"
    ## [1] "(434) 924- 6333  is prime"
    ## [1] "(434) 924- 6383  is prime"
    ## [1] "(434) 924- 6389  is prime"
    ## [1] "(434) 924- 6399  is prime"
    ## [1] "(434) 924- 6411  is prime"
    ## [1] "(434) 924- 6431  is prime"
    ## [1] "(434) 924- 6443  is prime"
    ## [1] "(434) 924- 6497  is prime"
    ## [1] "(434) 924- 6519  is prime"
    ## [1] "(434) 924- 6543  is prime"
    ## [1] "(434) 924- 6579  is prime"
    ## [1] "(434) 924- 6581  is prime"
    ## [1] "(434) 924- 6591  is prime"
    ## [1] "(434) 924- 6597  is prime"
    ## [1] "(434) 924- 6599  is prime"
    ## [1] "(434) 924- 6639  is prime"
    ## [1] "(434) 924- 6641  is prime"
    ## [1] "(434) 924- 6651  is prime"
    ## [1] "(434) 924- 6687  is prime"
    ## [1] "(434) 924- 6743  is prime"
    ## [1] "(434) 924- 6761  is prime"
    ## [1] "(434) 924- 6771  is prime"
    ## [1] "(434) 924- 6819  is prime"
    ## [1] "(434) 924- 6873  is prime"
    ## [1] "(434) 924- 6879  is prime"
    ## [1] "(434) 924- 6887  is prime"
    ## [1] "(434) 924- 6921  is prime"
    ## [1] "(434) 924- 6963  is prime"
    ## [1] "(434) 924- 6971  is prime"
    ## [1] "(434) 924- 6983  is prime"
    ## [1] "(434) 924- 6999  is prime"
    ## [1] "(434) 924- 7017  is prime"
    ## [1] "(434) 924- 7047  is prime"
    ## [1] "(434) 924- 7059  is prime"
    ## [1] "(434) 924- 7101  is prime"
    ## [1] "(434) 924- 7109  is prime"
    ## [1] "(434) 924- 7137  is prime"
    ## [1] "(434) 924- 7143  is prime"
    ## [1] "(434) 924- 7157  is prime"
    ## [1] "(434) 924- 7163  is prime"
    ## [1] "(434) 924- 7167  is prime"
    ## [1] "(434) 924- 7187  is prime"
    ## [1] "(434) 924- 7197  is prime"
    ## [1] "(434) 924- 7233  is prime"
    ## [1] "(434) 924- 7263  is prime"
    ## [1] "(434) 924- 7281  is prime"
    ## [1] "(434) 924- 7289  is prime"
    ## [1] "(434) 924- 7317  is prime"
    ## [1] "(434) 924- 7389  is prime"
    ## [1] "(434) 924- 7391  is prime"
    ## [1] "(434) 924- 7407  is prime"
    ## [1] "(434) 924- 7431  is prime"
    ## [1] "(434) 924- 7433  is prime"
    ## [1] "(434) 924- 7443  is prime"
    ## [1] "(434) 924- 7451  is prime"
    ## [1] "(434) 924- 7467  is prime"
    ## [1] "(434) 924- 7493  is prime"
    ## [1] "(434) 924- 7503  is prime"
    ## [1] "(434) 924- 7527  is prime"
    ## [1] "(434) 924- 7533  is prime"
    ## [1] "(434) 924- 7563  is prime"
    ## [1] "(434) 924- 7571  is prime"
    ## [1] "(434) 924- 7577  is prime"
    ## [1] "(434) 924- 7607  is prime"
    ## [1] "(434) 924- 7613  is prime"
    ## [1] "(434) 924- 7619  is prime"
    ## [1] "(434) 924- 7631  is prime"
    ## [1] "(434) 924- 7673  is prime"
    ## [1] "(434) 924- 7691  is prime"
    ## [1] "(434) 924- 7701  is prime"
    ## [1] "(434) 924- 7709  is prime"
    ## [1] "(434) 924- 7713  is prime"
    ## [1] "(434) 924- 7731  is prime"
    ## [1] "(434) 924- 7743  is prime"
    ## [1] "(434) 924- 7761  is prime"
    ## [1] "(434) 924- 7803  is prime"
    ## [1] "(434) 924- 7809  is prime"
    ## [1] "(434) 924- 7823  is prime"
    ## [1] "(434) 924- 7841  is prime"
    ## [1] "(434) 924- 7863  is prime"
    ## [1] "(434) 924- 7899  is prime"
    ## [1] "(434) 924- 7901  is prime"
    ## [1] "(434) 924- 7937  is prime"
    ## [1] "(434) 924- 8003  is prime"
    ## [1] "(434) 924- 8039  is prime"
    ## [1] "(434) 924- 8081  is prime"
    ## [1] "(434) 924- 8087  is prime"
    ## [1] "(434) 924- 8097  is prime"
    ## [1] "(434) 924- 8103  is prime"
    ## [1] "(434) 924- 8129  is prime"
    ## [1] "(434) 924- 8147  is prime"
    ## [1] "(434) 924- 8151  is prime"
    ## [1] "(434) 924- 8157  is prime"
    ## [1] "(434) 924- 8229  is prime"
    ## [1] "(434) 924- 8249  is prime"
    ## [1] "(434) 924- 8271  is prime"
    ## [1] "(434) 924- 8283  is prime"
    ## [1] "(434) 924- 8289  is prime"
    ## [1] "(434) 924- 8297  is prime"
    ## [1] "(434) 924- 8381  is prime"
    ## [1] "(434) 924- 8399  is prime"
    ## [1] "(434) 924- 8403  is prime"
    ## [1] "(434) 924- 8417  is prime"
    ## [1] "(434) 924- 8429  is prime"
    ## [1] "(434) 924- 8441  is prime"
    ## [1] "(434) 924- 8451  is prime"
    ## [1] "(434) 924- 8469  is prime"
    ## [1] "(434) 924- 8481  is prime"
    ## [1] "(434) 924- 8487  is prime"
    ## [1] "(434) 924- 8493  is prime"
    ## [1] "(434) 924- 8507  is prime"
    ## [1] "(434) 924- 8513  is prime"
    ## [1] "(434) 924- 8537  is prime"
    ## [1] "(434) 924- 8591  is prime"
    ## [1] "(434) 924- 8597  is prime"
    ## [1] "(434) 924- 8613  is prime"
    ## [1] "(434) 924- 8643  is prime"
    ## [1] "(434) 924- 8663  is prime"
    ## [1] "(434) 924- 8681  is prime"
    ## [1] "(434) 924- 8691  is prime"
    ## [1] "(434) 924- 8693  is prime"
    ## [1] "(434) 924- 8711  is prime"
    ## [1] "(434) 924- 8723  is prime"
    ## [1] "(434) 924- 8727  is prime"
    ## [1] "(434) 924- 8763  is prime"
    ## [1] "(434) 924- 8777  is prime"
    ## [1] "(434) 924- 8781  is prime"
    ## [1] "(434) 924- 8793  is prime"
    ## [1] "(434) 924- 8817  is prime"
    ## [1] "(434) 924- 8831  is prime"
    ## [1] "(434) 924- 8859  is prime"
    ## [1] "(434) 924- 8867  is prime"
    ## [1] "(434) 924- 8909  is prime"
    ## [1] "(434) 924- 8913  is prime"
    ## [1] "(434) 924- 8931  is prime"
    ## [1] "(434) 924- 8933  is prime"
    ## [1] "(434) 924- 8957  is prime"
    ## [1] "(434) 924- 8961  is prime"
    ## [1] "(434) 924- 8997  is prime"
    ## [1] "(434) 924- 9029  is prime"
    ## [1] "(434) 924- 9041  is prime"
    ## [1] "(434) 924- 9071  is prime"
    ## [1] "(434) 924- 9081  is prime"
    ## [1] "(434) 924- 9117  is prime"
    ## [1] "(434) 924- 9119  is prime"
    ## [1] "(434) 924- 9137  is prime"
    ## [1] "(434) 924- 9141  is prime"
    ## [1] "(434) 924- 9183  is prime"
    ## [1] "(434) 924- 9231  is prime"
    ## [1] "(434) 924- 9269  is prime"
    ## [1] "(434) 924- 9287  is prime"
    ## [1] "(434) 924- 9299  is prime"
    ## [1] "(434) 924- 9327  is prime"
    ## [1] "(434) 924- 9339  is prime"
    ## [1] "(434) 924- 9389  is prime"
    ## [1] "(434) 924- 9413  is prime"
    ## [1] "(434) 924- 9441  is prime"
    ## [1] "(434) 924- 9447  is prime"
    ## [1] "(434) 924- 9467  is prime"
    ## [1] "(434) 924- 9477  is prime"
    ## [1] "(434) 924- 9479  is prime"
    ## [1] "(434) 924- 9497  is prime"
    ## [1] "(434) 924- 9507  is prime"
    ## [1] "(434) 924- 9521  is prime"
    ## [1] "(434) 924- 9579  is prime"
    ## [1] "(434) 924- 9581  is prime"
    ## [1] "(434) 924- 9599  is prime"
    ## [1] "(434) 924- 9603  is prime"
    ## [1] "(434) 924- 9617  is prime"
    ## [1] "(434) 924- 9629  is prime"
    ## [1] "(434) 924- 9633  is prime"
    ## [1] "(434) 924- 9677  is prime"
    ## [1] "(434) 924- 9711  is prime"
    ## [1] "(434) 924- 9719  is prime"
    ## [1] "(434) 924- 9771  is prime"
    ## [1] "(434) 924- 9833  is prime"
    ## [1] "(434) 924- 9867  is prime"
    ## [1] "(434) 924- 9869  is prime"
    ## [1] "(434) 924- 9897  is prime"
    ## [1] "(434) 924- 9909  is prime"
    ## [1] "(434) 924- 9969  is prime"
    ## [1] "(434) 924- 9977  is prime"
