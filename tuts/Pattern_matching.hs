
-- is list in increasing order?
-- is_increasing :: (Ord a) => [a] -> Bool
-- is_increasing xs = 
--   if xs == []
--     then True
--     else if tail xs == []
--       then True
--       else if head xs <= head (tail xs)
--         then is_increasing (tail xs)
--         else False

-- is_increasing :: (Ord a) => [a] -> Bool
-- is_increasing []       = True
-- is_increasing [x]      = True
-- is_increasing (x:y:ys) = x <= y && is_increasing (y:ys)


is_increasing :: (Ord a) => [a] -> Bool
is_increasing (x:y:ys) = x <= y && is_increasing (y:ys)
is_increasing _ = True




-- no_vowels :: [Char] -> [Char]
-- no_vowels word = 
--   if word == ""
--     then ""
--     else
--       if head word `elem` "aeiouAEIOU"
--         then no_vowels (tail word)
--         else (head word) : no_vowels (tail word)

no_vowels :: [Char] -> [Char]
no_vowels "" = ""
no_vowels (x:xs) =
  if x `elem` "aeiouAEIOU"
    then no_vowels xs
    else x : no_vowels xs






