## 

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

    require(pander)

    ## Loading required package: pander

    d1 <- read.csv("https://tgstewart.cloud/soda.csv") |>
      filter(!is.na(cola) & !is.na(sugar))
    descr::CrossTable(
          d1$sugar
        , d1$cola
        , prop.chisq = FALSE
    ) |>
    pander(split.table=Inf)

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 31%" />
<col style="width: 19%" />
<col style="width: 16%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: center;"> <br />
d1$sugar</th>
<th style="text-align: center;">d1$cola<br />
Cola (Coke, Pepsi, etc.)</th>
<th style="text-align: center;"> <br />
Something else</th>
<th style="text-align: center;"> <br />
Total</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;"><strong>Regular (full
sugar)</strong><br />
N<br />
Row(%)<br />
Column(%)<br />
Total(%)</td>
<td style="text-align: center;"> <br />
10<br />
25.0000%<br />
50.0000%<br />
15.1515%</td>
<td style="text-align: center;"> <br />
30<br />
75.0000%<br />
65.2174%<br />
45.4545%</td>
<td style="text-align: center;"> <br />
40<br />
60.6061%<br />
<br />
</td>
</tr>
<tr class="even">
<td style="text-align: center;"><strong>Zero sugar or
diet</strong><br />
N<br />
Row(%)<br />
Column(%)<br />
Total(%)</td>
<td style="text-align: center;"> <br />
10<br />
38.4615%<br />
50.0000%<br />
15.1515%</td>
<td style="text-align: center;"> <br />
16<br />
61.5385%<br />
34.7826%<br />
24.2424%</td>
<td style="text-align: center;"> <br />
26<br />
39.3939%<br />
<br />
</td>
</tr>
<tr class="odd">
<td style="text-align: center;">Total<br />
</td>
<td style="text-align: center;">20<br />
30.303%</td>
<td style="text-align: center;">46<br />
69.697%</td>
<td style="text-align: center;">66<br />
</td>
</tr>
</tbody>
</table>

## 1.If the proportions in the contingency table represented probabilities, would drink preference and sugar preference be independent?

### Drink preference and sugar preference would not be independent because for instance P(Cola|Regular) would not be equal to P(Cola)

## 2. Is a preference for Cola positively or negatively or not associated with a preference for regular sugar?

### A preference for Cola is negatively associated with a preference for regular sugar.

## 3.Consider the population of individuals who suffer from migraine headaches. What can you conclude from this data about the effectiveness of the more toxic treatment?

### We can’t conclude anything because we haven’t been able to control any of the factors which are affecting subject behaviour. This is because this is an observational study and not an experimental one. For instance, it could be possible that some people moved from less toxic to more toxic treatments because the less toxic ones didn’t work. Another option would be to develop an experiment that observes behaviour before and after treatments.
