main = getLine >>= putStrLn . mooseType . parseCase

parseCase :: String -> [(Int, Int)]
parseCase line = do
    (x, rest) <- reads line
    (x', _) <- reads rest
    return (x, x')

mooseType :: [(Int, Int)] -> String
mooseType [(x, x')] | x == x' && x /= 0 = "Even " ++ show (2*x)
                    | x /= x' = "Odd " ++ show (2*max x x')
                    | otherwise = "Not a moose"
