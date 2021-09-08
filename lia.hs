import Text.ParserCombinators.Parsec.Combinator (chainl)

-- 2 data constructors
data Chain
  = GenesisBlock
  | Block Chain Txs

type Txs = Int

chain1 :: Chain
chain1 =
  Block GenesisBlock 2

chain2 :: Chain
chain2 =
  Block chain1 4

-- type signature
chainLength :: Chain -> Int
chainLength GenesisBlock = 0
chainLength (Block c _) = chainLength c + 1