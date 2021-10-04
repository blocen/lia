module Spaceman where

import System.IO
import System.Random
import Data.Array.IO.Safe (Ix(inRange))
import TcRnMonad (getRoleAnnots)

-- todos
-- System.Random?
-- start col
-- bring on
-- real r/cl
-- multipl
-- 

main :: IO ()
main = do
  -- Computation 'openFile' @file mode@ allocates and returns a new, open
  -- handle to manage the file @file@.  It manages input if @mode@
  -- is 'ReadMode', output if @mode@ is 'WriteMode' or 'AppendMode',
  -- and both input and output if mode is 'ReadWriteMode'.
  handle <- openFile "en1.txt" ReadMode
  contents <- hGetContents handle

  -- how to multi line strings
  putStrLn "**********************\n\
           \welcome to spaceman!\n\
           \**********************"
  putStrLn "how many guesses: (6-9)"
  -- input validation
  input <- getLine
  let guesses = read input :: Int

  -- get words
  let words = map init (lines contents)
  let ok = inRange (6, 9) guesses
  -- if not ok... Maybe Int
  case ok of
    -- todo: cheap!
    False     -> putStrLn "try again, how many guesses: (6-9)"
    otherwise -> do

      -- gen <- getStdGen
      gen <- newStdGen -- new seeds
      let (n, _) = randomR (0, length words - 1) gen :: (Int, StdGen)
      -- let lc = length words - 1
      -- let n = getRandomNr lc 
      let word = words !! n
      putStrLn ("number: " ++ show n ++ " is word: " ++ word)
      putStrLn ("guesses: " ++ show guesses)

      play word (map (\x -> '_') word) guesses
      -- putStrLn ("there are " ++ show ( length (lines contents)) ++ " words.")
      hClose handle

getRandomNr :: Int -> IO Int
-- getRandomNr lc = getStdRandom (randomR (0, lc - 1))
getRandomNr lc = do
  randomRIO (0, lc - 1)

play :: [Char] -> [Char] -> Int -> IO ()
play word known guesses
  -- putStrLn ("The word is " ++ word ++ ".")
  | word == known = do
                    putStrLn known
                    putStrLn "Winner!!"
  | guesses == 0  = do
                    putStrLn known
                    putStrLn ("Game over! The word was " ++ word ++ ".")
  | otherwise     = do
                    putStrLn known
                    putStrLn ("You have " ++ show guesses ++ " guesses left.")
                    line <- getLine
                    let (newKnown, newGuesses) = handle (head line) word known guesses
                    play word newKnown newGuesses -- head NOT for empty lists

-- regular pure haskell function!
handle :: Char -> [Char] -> [Char] -> Int -> ([Char], Int)
handle letter word known guesses
  | letter `elem` word = (zipWith (\w k -> if w == letter then w else k) word known, guesses)
  | otherwise          = (known, guesses - 1)

