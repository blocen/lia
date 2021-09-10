-- Eq: equality class (constraint)
-- additional constraint for what can be a

-- :t (==)
-- (==) :: Eq a => a -> a -> Bool

hasBlock :: Eq txs => txs -> Chain txs -> Bool
hasBlock x GenesisBlock = False
hasBlock x (Block c t) = 
  x == t || hasBlock x c

-- chain3 :: Chain ??
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

-- polymorphic functions/data constructors
-- GenesisBlock :: Chain txs
-- Block :: Chain txs -> txs -> Chain txs

chain1 :: Chain Int
chain1 =
  Block GenesisBlock 2

chain2 :: Chain Int
chain2 =
  Block chain1 4



