∇ Out←ValueAtRisk InputData;Series;Positions;Returns;Covar;VarCovar;QuadForm;StdDev
  ⍝ Extract the series from first elem of input, and positions from second elem
  Series Positions←(⊃1⌷InputData) (⊃2⌷InputData)
  ⍝ For each assets time series, calculate returns
  Returns←{¯1+(1↓⍵)÷(¯1↓⍵)}¨Series
  ⍝ Use outer product of covariance over a assets returns to obtain variance covariance matrix
  Covar←{Joint←⍺,[0.5]⍵ ⋄ (÷(⍴Joint[1;])-1)×+/×⌿Joint-[1](+/Joint)÷(⍴Joint)[2]}
  VarCovar←∘.Covar⍨Returns
  ⍝ Finally apply positions to variance covariance quadratic form to get VaR
  QuadForm←{(⍉⍵)+.×⍺+.×⍵}
  StdDev←{⍵*0.5}VarCovar QuadForm(⍉Positions)    
  ⍝ Return a 99% tail
  Out←2.33*StdDev
∇
