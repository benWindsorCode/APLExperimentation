⍝ Solution for https://codegolf.stackexchange.com/questions/233660/rot-transform/235075#235075
solution←{⎕←1↑⍵ ⋄ ({(3↓⍵),⍨(+/2↑1⌽3↑⍵),1↑⍵}⍣{⎕←1↑⍺ ⋄ (⍴⍺)<3})⍵}