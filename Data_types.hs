module Data_types where

import    Prelude hiding (Bool (..), not, (||))

data Bool = 
  True | False
  deriving Show

{-
comment
-}

-- constructors
-- False :: Bool
-- True  :: Bool

-- functions:
-- fun :: Bool -> ...
-- fun False = ...
-- fun True  = ...

not :: Bool -> Bool
not False = True
not True  = False

--

