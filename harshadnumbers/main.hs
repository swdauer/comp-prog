main = do
    line <- getLine
    let n = read line :: Int
    print $ firstOf isHN [n..]

sumOfDigits :: Int -> Int
sumOfDigits 0 = 0
sumOfDigits x = (x `mod` 10) + sumOfDigits (x `div` 10)

isHN :: Int -> Bool
isHN n = n `mod` sumOfDigits n == 0

firstOf :: (Int -> Bool) -> [Int] -> Int
firstOf _ [] = 0
firstOf predicate (x:xs) = if predicate x
    then x
    else firstOf predicate xs
