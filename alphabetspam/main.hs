import           Data.Char
import           Numeric

main = do
    line <- getLine
    let len = doubleLength line
        numSpace = numPredicate (== '_') line
        numLower = numPredicate isLower line
        numUpper = numPredicate isUpper line
        numSymbol = len - numSpace - numLower - numUpper
    putStrLn . asDecimalString $ numSpace / len
    putStrLn . asDecimalString $ numLower / len
    putStrLn . asDecimalString $ numUpper / len
    putStrLn . asDecimalString $ numSymbol / len

doubleLength :: String -> Double
doubleLength = fromIntegral . length

numPredicate :: (Char -> Bool) -> String -> Double
numPredicate p = foldl (\acc c -> if p c then 1 + acc else acc) 0

asDecimalString :: Double -> String
asDecimalString d = showFFloat Nothing d ""
