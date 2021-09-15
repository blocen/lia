module Data_types where

import    Prelude hiding (Maybe (..))

-- Maybe is for optional values
-- type constructor, not a type!
-- a: type variable
data Maybe a = Nothing | Just a

-- Using Maybe is a good way to deal with errors 
-- or exceptional cases without resorting to 
-- drastic measures such as error.

-- two constructors: 
-- Nothing :: Maybe a
-- Just    :: a -> Maybe a

-- The 'fromMaybe' function takes a default value and and 'Maybe'
--  value.  If the 'Maybe' is 'Nothing', it returns the default values;
--  otherwise, it returns the value contained in the 'Maybe'.
fromMaybe :: a -> Maybe a -> a
fromMaybe some_default Nothing = some_default
fromMaybe _ (Just x)           = x

-- 





