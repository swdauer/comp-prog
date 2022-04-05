main = do
    line <- getLine
    let split = words line
        recipeSize = read $ split !! 1 :: Int
        finishedSize = read $ split !! 2 :: Int
    contents <- getContents
    mapM_ (print . scaleIngredient recipeSize finishedSize . read) $ lines contents

scaleIngredient :: Int -> Int -> Int -> Int
scaleIngredient recipeSize finishedSize ingredient =
    ingredient * finishedSize `div` recipeSize
