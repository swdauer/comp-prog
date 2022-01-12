import           Data.Array.IO
import           Data.Char
import           Data.List

type CharMap = IOUArray Char Int

main = do
    toEncode <- getLine
    charCounts <- newArray ('a', 'z') 0 :: IO CharMap
    mapM_ (addToCount charCounts) toEncode
    listCounts <- charMapToList charCounts
    -- testing below here
    -- mapM_ (\c -> putChar c >> putChar ' ' >> readArray charCounts c >>= print) ['a'..'z']
    let sortedCounts = reverse . sort $ listCounts
    print listCounts >> print sortedCounts

addToCount :: CharMap -> Char -> IO ()
addToCount charMap c | isLetter c = do
                        let lowerC = toLower c
                        cCount <- readArray charMap lowerC
                        writeArray charMap lowerC (cCount+1)
                     | otherwise = return ()

charMapToList :: CharMap -> IO [Int]
charMapToList charMap = mapM (readArray charMap) ['a'..'z']
