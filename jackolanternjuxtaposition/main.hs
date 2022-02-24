main = getLine >>= print . head . parseAndMult

parseAndMult [] = [1]
parseAndMult input = do
    (n, rest) <- reads input :: [(Int, String)]
    acc <- parseAndMult rest
    return (n*acc)
