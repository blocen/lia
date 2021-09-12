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

not :: Bool -> Bool
not False = True
not True  = False

(||) :: Bool -> Bool -> Bool
(||) True _  = True
(||) False b = b

ifthenelse :: Bool -> a -> a -> a
ifthenelse False _t e = e
ifthenelse True t _e  = t

-- would work if used with build-in Bool
-- ifthenelse c t e = 
--   if c
--     then t
--     else e

-- guards
-- ifthenelse c t e 
--   | c         = t
--   | otherwise = e

--

