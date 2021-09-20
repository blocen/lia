{-# LANGUAGE InstanceSigs #-}


-- Eq: equality class (constraint)
-- additional constraint for what can be a

-- :t (==)
-- (==) :: Eq a => a -> a -> Bool

hasBlock :: Eq txs => txs -> Chain txs -> Bool
hasBlock _ GenesisBlock = False
hasBlock x (Block c t) = 
  x == t || hasBlock x c

chain3 :: Chain [Char]
chain3 = 
  Block GenesisBlock "test"
-- hasBlock "test" chain3

-- from Poly_chains

-- abstract from type of tx
-- Chain: parameterised data type 
-- txs: type variable; could stand for any type
data Chain txs =
    GenesisBlock
  | Block (Chain txs) txs
  deriving (Eq, Show)
  -- deriving (Eq, Show, Foldable)

-- polymorphic functions/data constructors
-- GenesisBlock :: Chain txs
-- Block        :: Chain txs -> txs -> Chain txs

-- similar for lists; which grow to the left
-- []           :: [a]
-- "cons" for constructor
-- (:)          :: a -> [a] -> [a]
l :: [Int]
l = 2 : (1 : [])
m :: [Int]
m = [2,1]

chain1 :: Chain Int
chain1 =
  Block GenesisBlock 2

chain2 :: Chain Int
chain2 =
  Block chain1 4


-- t: 0
-- Num class

-- class declaration:
-- class: keyword / name/ a 'is a member of xy class' / where: keyword
-- class Ep a where
--   (==) :: a -> a -> Bool -- type signatures
--   (/=) :: a -> a -> Bool
--   {-# MINIMAL (==) | (/=) #-} -- pragma; either on, other is inferred

-- class definition
class MyEq a where
  (===) :: a -> a -> Bool -- base operation

(=/=) :: MyEq a => a -> a -> Bool
(=/=) x y = not (x === y)

-- how to make instance of a class?
-- instance declaration
instance MyEq Bool where
  (===) :: Bool -> Bool -> Bool -- only with lang ext InstanceSigs!
  (===) True True   = True
  (===) False False = True
  (===) _    _      = False

instance MyEq a => MyEq [a] where
  (===) :: MyEq a => [a] -> [a] -> Bool
  (===) [] []            = True
  (===) [] (y : ys)      = False
  (===) (x : xs) []      = False
  (===) (x: xs) (y : ys) = 
    x === y && xs === ys
  
