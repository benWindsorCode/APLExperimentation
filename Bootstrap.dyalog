∇ Out←Bootstrap Input;SampleSize;SampleNum;Samples
  SampleSize←50
  SampleNum←100
  ⍝ Generate SampleNum x SampleSize matrix of samples with replacement
  Samples←SampleNum SampleSize⍴Input[?(SampleSize×SampleNum)⍴(⍴Input)]
  ⍝ Calculate mean of each row and order smallest to largest
  Means←(+/Samples)÷(⍴Samples)[2]
  Means←Means[⍋Means]
  ⍝ Discard upper and lower 0.5% to retain 99% confidence interval
  Discard←⌈(0.05×SampleNum)
  Means←(¯1×Discard)↓Discard↓Means
  ⍝ Return lower and upper value remaining as a 99% CI for the mean
  Out←(⊃Means)(⊃⌽Means)
∇
