import qualified Data.Map.Strict as Map
main = do
    cards <- getLine
    let ranks = foldl addCard rankCounts $ words cards
    print $ maxCount ranks

rankCounts = Map.fromList $ zip "A23456789TJQK" $ repeat 0

keys = "A23456789TJQK"

addCard ranks (suit:_) = Map.adjust (+1) suit ranks

maxCount = Map.foldl max 0
