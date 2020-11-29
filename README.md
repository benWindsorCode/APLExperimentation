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
