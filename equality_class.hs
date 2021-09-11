-- Eq: equality class (constraint)
-- additional constraint for what can be a

-- :t (==)
-- (==) :: Eq a => a -> a -> Bool

hasBlock :: Eq txs => txs -> Chain txs -> Bool
hasBlock x GenesisBlock = False
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



