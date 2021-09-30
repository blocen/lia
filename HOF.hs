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




-- capturing design patterns
-- fun :: [someType] -> someResult
-- fun [] = ... -- code
-- fund (x: xs) = ... -- code that can use x and fun xs

-- -- now abstract from that:
-- fun :: [someType] -> someResult
-- fun [] = nil
-- fun (x: xs) = cons x (fund xs)

-- -- now introduce cons and nil as parameters:
-- fun :: (someType -> someResult -> someResult) -> someResult -> [someType] -> someResult
-- fun cons nil []  = nil
-- fun cons nil (x: xs) = cons x (fun cons nil xs)

-- short names:
-- foldr :: ( a -> r -> r) -> r -> [a] -> r
-- foldr cons nil []  = nil
-- foldr cons nil (x: xs) = cons x (HOF.foldr cons nil xs)

-- go where pattern
foldr :: ( a -> r -> r) -> r -> [a] -> r
foldr cons nil = go
  where
    go []      = nil
    go (x: xs) = cons x (go xs)


