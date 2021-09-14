
length' :: [a] -> Int
length' []     = 0
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a 
sum' []     = 0
sum' (x:xs) = x + sum' xs

prod' :: (Num a) => [a] -> a 
prod' []     = 1
prod' (x:xs) = x * prod' xs 

maximum' :: (Ord a) => [a] -> a 
maximum' [] = error "(my error message) maximum' of an empty list"
maximum' [x] = x
maximum' (x:xs)
  | x > mx    = x
  | otherwise = mx
  where mx = maximum' xs


