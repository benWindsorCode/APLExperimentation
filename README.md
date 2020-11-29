# APLExperimentation
Experimentation with the APL programming language
# Snippets
To calculate the mean of each row of a matrix
``` Dyalog
Mean ← {(+/⍵)÷(⍴⍵)[2]}
```
To calculate returns of a matrix, in which the rows represent time series of asset prices
``` Dyalog
Returns ← {(1↓[2]⍵)÷(¯1↓[2]⍵)}
```
