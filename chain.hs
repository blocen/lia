-- ??
-- what's the issue?
-- No instance for (Show (Chain Int)) arising from a use of ‘print’
build :: Int -> Chain Int
build n =
  if n <= 0
    then GenesisBlock
    else Block (build (n - 1)) n



--

data Chain i =
    GenesisBlock
  | Block (Chain i) i

--

