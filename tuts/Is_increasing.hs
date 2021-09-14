
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



