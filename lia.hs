import GHC.Base (Bool (False))
import Text.ParserCombinators.Parsec.Combinator (chainl)

-- Chain, Bool, Txs, Int: data type
-- GenesisBlock, Block: 2 data constructors
data Chain = 
    GenesisBlock
  | Block Chain Txs

-- Txs: data type
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

--
hasBlock :: Txs -> Chain -> Bool
hasBlock x GenesisBlock = False
hasBlock x (Block c t) = 
  x == t || hasBlock x c

-- model a property as function of type Txs -> Bool
-- higher order func: a f is parameterised by another f
hasBlockProp :: (Txs -> Bool) -> Chain -> Bool
hasBlockProp prop GenesisBlock = False
hasBlockProp prop (Block c t) = prop t || hasBlockProp prop c
-- hasBlockProp (\x -> x > 3) chain2
-- hasBlockProp         (> 3) chain2

-- type-directed programming
-- functions follow the structure of the data!




--
