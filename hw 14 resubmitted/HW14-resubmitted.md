## 

    rws <- function(r,k,p_A){

        t(replicate(r,{

            s <- rbinom(2*k-1,1,p_A)

            o <- 1*(sum(s)>=k)

            s_star <- if(o==1){s}else{1-s}

            n <- which(cumsum(s_star) == k)[1]

            c(team=o, games=n)

        }))

    }

## Generate 5000 draws from the world series distribution.

    draws<-rws(5000,6, 0.45)
    head(draws)

    ##      team games
    ## [1,]    1     9
    ## [2,]    1    10
    ## [3,]    1    11
    ## [4,]    0     9
    ## [5,]    1    11
    ## [6,]    0     9

## With the draws, create the contingency table with number of games as the row variable and winner as the column variable. Include conditional probabilities.

    library(magrittr)
    library(gmodels)
    results_df <- data.frame(number_of_games = draws[, 2], winner = draws[, 1])

    gmodels::CrossTable(results_df$number_of_games, results_df$winner)

    ## 
    ##  
    ##    Cell Contents
    ## |-------------------------|
    ## |                       N |
    ## | Chi-square contribution |
    ## |           N / Row Total |
    ## |           N / Col Total |
    ## |         N / Table Total |
    ## |-------------------------|
    ## 
    ##  
    ## Total Observations in Table:  5000 
    ## 
    ##  
    ##                            | results_df$winner 
    ## results_df$number_of_games |         0 |         1 | Row Total | 
    ## ---------------------------|-----------|-----------|-----------|
    ##                          6 |       147 |        43 |       190 | 
    ##                            |     6.560 |    11.008 |           | 
    ##                            |     0.774 |     0.226 |     0.038 | 
    ##                            |     0.047 |     0.023 |           | 
    ##                            |     0.029 |     0.009 |           | 
    ## ---------------------------|-----------|-----------|-----------|
    ##                          7 |       359 |       146 |       505 | 
    ##                            |     5.726 |     9.609 |           | 
    ##                            |     0.711 |     0.289 |     0.101 | 
    ##                            |     0.115 |     0.078 |           | 
    ##                            |     0.072 |     0.029 |           | 
    ## ---------------------------|-----------|-----------|-----------|
    ##                          8 |       641 |       286 |       927 | 
    ##                            |     6.227 |    10.450 |           | 
    ##                            |     0.691 |     0.309 |     0.185 | 
    ##                            |     0.205 |     0.153 |           | 
    ##                            |     0.128 |     0.057 |           | 
    ## ---------------------------|-----------|-----------|-----------|
    ##                          9 |       663 |       388 |      1051 | 
    ##                            |     0.030 |     0.050 |           | 
    ##                            |     0.631 |     0.369 |     0.210 | 
    ##                            |     0.212 |     0.208 |           | 
    ##                            |     0.133 |     0.078 |           | 
    ## ---------------------------|-----------|-----------|-----------|
    ##                         10 |       690 |       505 |      1195 | 
    ##                            |     4.615 |     7.745 |           | 
    ##                            |     0.577 |     0.423 |     0.239 | 
    ##                            |     0.220 |     0.270 |           | 
    ##                            |     0.138 |     0.101 |           | 
    ## ---------------------------|-----------|-----------|-----------|
    ##                         11 |       633 |       499 |      1132 | 
    ##                            |     8.210 |    13.777 |           | 
    ##                            |     0.559 |     0.441 |     0.226 | 
    ##                            |     0.202 |     0.267 |           | 
    ##                            |     0.127 |     0.100 |           | 
    ## ---------------------------|-----------|-----------|-----------|
    ##               Column Total |      3133 |      1867 |      5000 | 
    ##                            |     0.627 |     0.373 |           | 
    ## ---------------------------|-----------|-----------|-----------|
    ## 
    ## 

## Supposing that the world series ends in 2k-1 games, what is the probability that team A will win?

### The probability that Team A wins will be the conditional probability for 11 games and A wins which is 0.565 in this case. P(A|11) = 0.565
