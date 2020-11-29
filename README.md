# APLExperimentation
Experimentation with the APL programming language
# Snippets
To calculate returns of a matrix, in which the rows represent time series of asset prices
Returns ← {(1↓[2]⍵)÷(¯1↓[2]⍵)}
