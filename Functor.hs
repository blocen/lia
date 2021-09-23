{-# LANGUAGE DeriveFunctor, DeriveFoldable #-}

module Functor where

-- type class; 
-- f: type constructor; for some sort of container
class Functor f where
  fmap :: (a -> b) -> f a -> f b

(<$>) :: Functor.Functor f => (a -> b) -> f a -> f b
f <$> x = Functor.fmap f x -- just a different name

-- instance of functor class shoud obey laws:
-- fmap id == id
-- fmap (f . g) == fmap f . fmap g

-- class instances for Functor and Foldable can be 
-- derived via language extension:

-- {-# LANGUAGE DeriveFunctor, DeriveFoldable #-}
data Tree a = Leaf a | Node (Tree a)(Tree a)
  deriving (Show, Eq, Prelude.Functor, Foldable)

-- length (Node (Leaf 3)(Leaf 4))
-- > 2
-- (+ 1) Prelude.<$> Node (Leaf 3)(Leaf 4)
-- > Node (Leaf 4) (Leaf 5)


