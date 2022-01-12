import           Data.Array.IO
import           Data.Char
import           Data.List

type CharMap = IOUArray Char Int

main = do
    toEncode <- getLine
    charCounts <- newArray ('a', 'z') 0 :: IO CharMap
    mapM_ (addToCount charCounts) toEncode
    listCounts <- charMapToList charCounts
    let sortedCounts = reverse . sort $ listCounts
    -- testing below here
    print listCounts >> print sortedCounts

addToCount :: CharMap -> Char -> IO ()
addToCount charMap c | isLetter c = do
                        let lowerC = toLower c
                        cCount <- readArray charMap lowerC
                        writeArray charMap lowerC (cCount+1)
                     | otherwise = return ()

charMapToList :: CharMap -> IO [Int]
charMapToList charMap = mapM (readArray charMap) $ range ('a', 'z')

numberOfSequencesNDotsWide :: Int -> Int
numberOfSequencesNDotsWide 1 = 1
numberOfSequencesNDotsWide 2 = 2
numberOfSequencesNDotsWide n = numberOfSequencesNDotsWide (n-1) + numberOfSequencesNDotsWide (n-2)

lengthOfSequences :: [Int]
lengthOfSequences = take 26 ([2*x - 1 | x <- concat [replicate (numberOfSequencesNDotsWide y) y | y <- [1..]]])
