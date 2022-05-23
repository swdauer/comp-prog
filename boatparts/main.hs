import           Data.Maybe
main = do
    line <- getLine
    let numParts = head $ map (read :: String -> Int) $ words line
    contents <- getContents
    putStrLn $ maybe "paradox avoided" show
        $ replacedWholeBoat numParts 0 [] $ lines contents

replacedWholeBoat :: Int -> Int -> [String] -> [String] -> Maybe Int
replacedWholeBoat _ _ _ [] = Nothing
replacedWholeBoat numParts day partsReplaced (part:parts)
    | part `elem` partsReplaced = replacedWholeBoat numParts (day+1) partsReplaced parts
    | length partsReplaced + 1 == numParts = Just (day+1)
    | otherwise = replacedWholeBoat numParts (day+1) (part:partsReplaced) parts
