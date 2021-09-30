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
      (n, _) = randomR (0, (length words) - 1) gen :: (Int, StdGen)
  play (words !! n)
  -- putStrLn ("there are " ++ show ( length (lines contents)) ++ " words.")
  hClose handle

play word = do
  putStrLn ("The word is " ++ word ++ ".")
