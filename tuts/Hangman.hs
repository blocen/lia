module Hangman where

import System.IO
import System.Random


main :: IO ()
main = do
  -- Computation 'openFile' @file mode@ allocates and returns a new, open
  -- handle to manage the file @file@.  It manages input if @mode@
  -- is 'ReadMode', output if @mode@ is 'WriteMode' or 'AppendMode',
  -- and both input and output if mode is 'ReadWriteMode'.
  handle <- openFile "en1.txt" ReadMode   
  contents <- hGetContents handle

  gen <- getStdGen
  let words = map init (lines contents)
      (n, _) = randomR (0, length words - 1) gen :: (Int, StdGen)
      word = words !! n
      -- putStrLn "n: " 

  play word (map (\x -> '_') word)
  -- putStrLn ("there are " ++ show ( length (lines contents)) ++ " words.")
  hClose handle

play :: [Char] -> [Char] -> IO ()
play word known = do
  -- putStrLn ("The word is " ++ word ++ ".")
  putStrLn known
  putStrLn "Enter a letter to guess: "
  line <- getLine
  play word (handle (head line) word known) -- head NOT for empty lists

-- regular pure haskell function!
handle :: Char -> [Char] -> [Char] -> [Char]
handle letter word known
  | letter `elem` word = zipWith (\w k -> if w == letter then w else k) word known
  | otherwise          = known

