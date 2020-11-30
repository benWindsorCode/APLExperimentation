# APLExperimentation
Experimentation with the APL programming language
# Snippets
To calculate the mean of each row of a matrix
``` Dyalog
Mean ← {(+/⍵)÷(⍴⍵)[2]}
```
To calculate returns of a set of assets time series, structured as a matrix where rows represent time series of asset prices
``` Dyalog
Returns ← {(1↓[2]⍵)÷(¯1↓[2]⍵)}
```
To calculate the sample variance of a set of series, structured as a matrix where rows represent the time series
``` Dyalog
SampleVar ← { Sums ← +/⍵ -[1] (+/⍵)÷(⍴⍵)[2] ⋄ Sums ÷ (⍴⍵)[2] - 1 }
```
Or using the above mean function we could simplify to
``` Dyalog
SampleVar ← { Sums ← +/⍵ -[1] Mean ⍵ ⋄ Sums ÷ (⍴⍵)[2] - 1}
```
note here the reliance of operator precidence from right to left. 

Given two vectors of the same length, calculate the sample covariance with the following operator
```  Dyalog
⍝ Join rows into a matrix one below the other, then subtract mean of each row, multiply down columns to get (xi-xbar)(yi-ybar), sum and divide
Covar ← { Joint ← ⍺,[0.5]⍵ ⋄ (÷(⍴Joint[1;])-1) × +/×⌿Joint -[1] (+/Joint)÷(⍴Joint)[2] }
```
This is useful because we can now apply it with an outer product, given an array of arrays of prices, the variance covariance matrix is easily obtained with
``` Dyalog
Examples ← (1 2 3 55) (4 5 6 ¯2) (7 8 9 12)
∘.Covar⍨Examples
┌────────────┬────────────┬────────────┐
│702.9166667 │¯92.08333333│53.66666667 │
├────────────┼────────────┼────────────┤
│¯92.08333333│12.91666667 │¯6.333333333│
├────────────┼────────────┼────────────┤
│53.66666667 │¯6.333333333│4.666666667 │
└────────────┴────────────┴────────────┘
```
applying Covariance as an outer product over the elements of the array, where each element is itself an array of the sample values.

Given a square matrix on the left and a column vector on the right, you can compute the quadratic form (x^t)A(x) using
``` Dyalog
QuadForm ← { (⍉⍵) +.× ⍺ +.× ⍵ }
```
# Value At Risk
To use the value at risk calculator pass it an array structured as
``` Dyalog
InputVals ← ( Stock1PriceSeries Stock2PriceSeries ... StockNPriceSeries) (Stock1Position Stock2Position ... StockNPosition)
```
For example a small set of prices for AAPL, MSFT, GOOG prices for a portfolio with 10 shares AAPL, 12 shares MSFT, 9 shares GOOG:
``` Dyalog
┌────────────────────────────────────────────────────────────────────────────────────────────┬───────┐
│┌───────────────────────────┬───────────────────────────┬──────────────────────────────────┐│10 12 9│
││115 119 120 119 118 118 117│211 216 215 216 217 214 211│1763 1740 1752 1749 1777 1781 1770││       │
│└───────────────────────────┴───────────────────────────┴──────────────────────────────────┘│       │
└────────────────────────────────────────────────────────────────────────────────────────────┴───────┘
```
