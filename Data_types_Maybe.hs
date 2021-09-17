module Data_types_Maybe where

import    Prelude hiding (Maybe (..))

-- Maybe is for optional values
-- type constructor, not a type!
-- a: type variable
data Maybe a = Nothing | Just a
  deriving (Show)

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

orelse :: Maybe a -> Maybe a -> Maybe a
orelse Nothing y  = y
orelse (Just x) _ = Just x

addMaybe :: Maybe Int -> Maybe Int -> Maybe Int
addMaybe (Just x) (Just y) = Just (x + y)
addMaybe _        _        = Nothing

liftMaybe :: (a -> b -> c) -> Maybe a -> Maybe b -> Maybe c
liftMaybe f (Just a) (Just b) = Just (f a b)
liftMaybe _ _        _        = Nothing

-- 

