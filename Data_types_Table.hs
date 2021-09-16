module Data_types_Table where

import Prelude    hiding (lookup)

type Table k v = [(k, v)]

-- interface:
empty :: Table k v
empty = []

insert :: k -> v -> Table k v -> Table k v
insert k v t = (k, v) : t

delete :: Eq k => k -> Table k v -> Table k v
delete _ [] = []
delete k ((k', v) : t )
  | k == k'   = delete k t
  | otherwise = (k', v) : delete k t
-- delete k kvs = filter (\(k', _) -> not (k == k')) kvs
-- delete k kvs = filter (\kv -> not (k == fst kv)) kvs
-- delete k = filter (\kv /= fst kv) 

lookup :: Eq k => k -> Table k v -> Maybe v
lookup _ [] = Nothing
lookup k ((k', v') : t)
  | k == k'   = Just v'
  | otherwise = lookup k t

