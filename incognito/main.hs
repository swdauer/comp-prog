import           Control.Monad (replicateM)

main :: IO ()
main = do
    t <- getLine
    let n = read t :: Int
    carryOutCases n
    return ()

carryOutCases :: Int -> IO ()
carryOutCases 0 = return ()
carryOutCases n = do
    r <- getLine
    let i = read r :: Int
    ls <- replicateM i getLine
    print . numOfDisguises $ foldl (\dict line -> addToDict (parseLine line) dict) [] ls
    carryOutCases (n-1)

parseLine :: String -> String
parseLine line = words line !! 1

addToDict :: String -> [(String, Int)] -> [(String, Int)]
addToDict category [] = [(category, 1)]
addToDict category ((c,sum):cs) | c == category = (c, sum+1):cs
                                | otherwise = (c,sum) : addToDict category cs

numOfDisguises dict = foldl (\total (_, count) -> total * (count+1)) 1 dict - 1
