
-- summer trips

data Trip = Trip
  { trFrom     :: String
  , trTo       :: String
  , trDistance :: Int 
  }
  deriving (Eq, Show)

-- let trip = Trip {trFrom = "london", trTo = "paris", trDistance = 234}


