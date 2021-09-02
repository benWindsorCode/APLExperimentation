 solution←{
     ⍝ load and reshape so we have a rank 1 list of names
     file←5163⍴⎕CSV ⍵
     ⍝ sort alphabetically
     file←file[⍋file]
     ⍝ map chars to numbers and then sum the resultant vectors of numbers
     alph←'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
     vals←+/¨{⊃⍸alph=⍵}¨¨file
     ⍝ multiply each entry with its position in the list and sum
     out←+/(⍳⍴vals)×vals
     out
 }
