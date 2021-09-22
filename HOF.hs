module HOF where

-- a function parameterized by another function or returning a function

-- curried version for partial application
-- f = elem 't'
-- f "test"

-- function composition
-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- (f . g) x = f (g x)
  -- ((+4) . (*2)) 10

-- composition example
ex :: [Int]
ex = (take 100 . filter odd . map (\x -> x * x)) [1 ..]


flip :: (a -> b -> c) -> (b -> a -> c)
flip f x y = f y x

-- HOF.flip map [1 .. 10] (\x -> x * x)

-- curry
-- uncurry
-- map (uncurry (*)) (zip [1..3][4..6])

-- ($) :: (a -> b) -> a -> b


