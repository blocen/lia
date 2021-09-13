
type Amount  = Int
type Account = String


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
-- tx {trAmount =777}


