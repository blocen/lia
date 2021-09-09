
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


chainLength :: Chain txs -> Int
chainLength GenesisBlock = 0
chainLength (Block c _) = chainLength c + 1

hasBlockProp :: (txs -> Bool) -> Chain txs -> Bool
hasBlockProp prop GenesisBlock = False
hasBlockProp prop (Block c t) = prop t || hasBlockProp prop c
-- works for any choice of type txs!


--

