
--

f :: Int -> Int
f  x = x

-- result is not an Int, but an action "IO of Int"
-- g :: Int -> IO Int
-- g = ?

--
-- readFile :: FilePath -> IO String
type FilePath = String

-- readFile      :: FilePath -> IO String
-- writeFile     :: FilePath -> String -> IO ()

-- lengthOfFile  :: FilePath -> IO Int
-- lengthOfFile file = length <$> readFile file


--

