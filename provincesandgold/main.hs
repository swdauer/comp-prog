import           Data.Char

main = getLine >>= putStrLn . topBuys . parseBuyingPower

parseBuyingPower :: String -> Int
parseBuyingPower (g:' ':s:' ':c:_) =
    digitToInt g * 3 +
    digitToInt s * 2 +
    digitToInt c

treasureCard :: Int -> String
treasureCard bp | bp >= 6 = "Gold"
                | bp >= 3 = "Silver"
                | otherwise = "Copper"

victoryCard :: Int -> String
victoryCard bp | bp >= 8 = "Province"
               | bp >= 5 = "Duchy"
               | bp >= 2 = "Estate"
               | otherwise = ""

topBuys :: Int -> String
topBuys bp | v == "" = t
           | otherwise = v ++ " or " ++ t
    where t = treasureCard bp
          v = victoryCard bp
