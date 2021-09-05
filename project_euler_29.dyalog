⍝ Solution to https://projecteuler.net/problem=29
⍝ Create numbers from 2 to 100, use outer product to get all power combinations, turn into list, get unique and then size
answer←⍴∪,(∘.*)⍨1+⍳99