module Transaction where

-- import      Data_types_Table     (Table, lookup)
-- import      Data_types_Maybe     (fromMaybe)
import      Prelude              hiding (lookup)

type Amount  = Int
type Account = String

-- imports todo!
-- Data_types_Table
-- Data_types_Maybe
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


fromMaybe :: a -> Maybe a -> a
fromMaybe some_default Nothing = some_default
fromMaybe _ (Just x)           = x
-- end imports


-- data Transaction = 
--   Transaction Amount Account Account
--   deriving (Eq, Show)

-- constructor; same as type
-- Transaction :: Amount -> Account -> Account -> Transaction

-- trAmount :: Transaction -> Amount
-- trAmount (Transaction a _ _) = a

-- trFrom :: Transaction -> Account
-- trFrom (Transaction _ f _) = f

-- trTo :: Transaction -> Account
-- trTo (Transaction _ _ t) = t

-- record syntax
data Transaction = Transaction
  { trAmount :: Amount
  , trFrom   :: Account
  , trTo     :: Account
  }
  deriving (Eq, Show)

-- t2 = Transaction {trAmount = 123, trFrom = "f", trTo = "t"}
-- let tx = Transaction {trAmount = 123, trFrom = "f", trTo = "t"}

-- record update syntax
-- tx {trAmount = 777}

-- model a bank
type Accounts = Table Account Amount

processTransaction ::  Transaction -> Accounts -> Accounts
processTransaction Transaction {trAmount = x, trFrom = f, trTo = t} as =
  let fOld = fromMaybe 0 (lookup f as)
      tOld = fromMaybe 0 (lookup t as)
  in  insert f (fOld - x) (insert t (tOld + x) as)


-- as = insert "uno" 1000 (insert "due" 2000 empty )
-- tx = Transaction {trAmount = 123, trFrom = "uno", trTo = "due"}
-- > processTransaction tx as
-- [("uno",877),("due",2123),("uno",1000),("due",2000)]
