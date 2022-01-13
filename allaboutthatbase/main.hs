import           Data.Char

main = do
    input <- getContents
    let cases = tail $ lines input
        answers = map checkAllBases cases
    mapM_ (\answer -> if not $ null answer then putStrLn answer else putStrLn "invalid") answers

parseAsBaseB str 1 = parseAsUnary str
parseAsBaseB str b = parseAsBaseBHelper str 0 b

parseAsUnary :: String -> Maybe Integer
parseAsUnary "" = Just 0
parseAsUnary (x:xs) | x == '1' = fmap (+1) (parseAsUnary xs)
                    | otherwise = Nothing

parseAsBaseBHelper :: String -> Integer -> Integer -> Maybe Integer
parseAsBaseBHelper "" acc b = if acc > 2^31 then Nothing else Just acc
parseAsBaseBHelper (x:xs) acc b | digit >= b || newAcc >= 2^31 = Nothing
                          | otherwise = parseAsBaseBHelper xs newAcc b
    where digit = charToInteger x
          newAcc = digit + acc*b

parseOp :: Char -> Integer -> Integer -> Integer
parseOp c = case c of
                '+' -> (+)
                '-' -> (-)
                '*' -> (*)
                '/' -> div

charToInteger :: Char -> Integer
charToInteger c | isLetter c = toInteger $ ord c - ord 'a' + 10
                | otherwise = toInteger $ digitToInt c

integerToChar :: Integer -> Char
integerToChar b | b < 10 = intToDigit $ fromInteger b
                | b == 36 = '0'
                | otherwise = chr $ fromInteger (b - 10 + toInteger (ord 'a'))

checkLineInBaseB :: String -> Integer -> Maybe Bool
checkLineInBaseB line b = let strs = words line
                              leftOperand = parseAsBaseB (strs !! 0) b
                              rightOperand = parseAsBaseB (strs !! 2) b
                              operator = parseOp (head $ strs !! 1)
                              lhs = operator <$> leftOperand <*> rightOperand
                              answer = (==) <$> lhs <*> parseAsBaseB (strs !! 4) b
                          in if head (strs !! 1) == '/' && (mod <$> leftOperand <*> rightOperand) /= Just 0
                              then Just False
                              else answer

checkAllBases :: String -> String
checkAllBases line = concat [if bool == Just True
                             then integerToChar i : ""
                             else "" | (i, bool) <- zip [1..36] (map (checkLineInBaseB line) [1..36])]
