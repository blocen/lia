module Data_types_Tree where

data Tree a = 
  Leaf a | 
  Node (Tree a) (Tree a)
  deriving (Show)

-- Leaf :: a -> Tree abs
-- Node :: Tree a -> Tree a -> Tree a

flatten :: Tree a -> [a]
flatten (Leaf x)   = [x]
flatten (Node l r) = flatten l ++ flatten r

height :: Tree a -> Int
height (Leaf _)   = 0
height (Node l r) = 1 + max (height l) (height r)

--


