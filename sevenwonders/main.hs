main = do
    cards <- getLine
    print $ score . counts $ cards

counts :: String -> (Int, Int, Int)
counts = let helper :: Int -> Int -> Int -> String -> (Int, Int, Int)
             helper c g t [] = (c, g, t)
             helper c g t (card:cards) | card == 'C' = helper (c+1) g t cards
                                       | card == 'G' = helper c (g+1) t cards
                                       | otherwise = helper c g (t+1) cards
         in helper 0 0 0

score :: (Int, Int, Int) -> Int
score (c, g, t) = c^2 + g^2 + t^2 + 7*(min c $ min g t)
