module Gold where

-- The golden ratio
phi :: Double
phi = (sqrt 5 + 1) / 2

polynomial :: Double -> Double
polynomial x = x ^ 2 - x - 1

f x = polynomial (polynomial x)

main = do
  -- print (polynomial phi)
  -- print (f phi)
  print (area 1)
  print (area 2)

-- area r = pi * rsquare
--   where
--     pi = 3.1415927
--     rsquare = r * r

area r =
  let pi = 3.1415927
      rsquare = r * r
   in pi * rsquare

greet :: String -> String -> String
greet "Finland" name = "Hei, " ++ name
greet "Italy" name = "Ciao, " ++ name
greet "England" name = "How do you do, " ++ name
greet _ name = "Hello, " ++ name
