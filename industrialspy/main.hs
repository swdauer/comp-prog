module Main where

import           Control.Monad
import           Data.Array.IO
import           Data.List     (permutations, subsequences)
import           Data.Set      (fromList, toList)

data TriBool = M | Y | N deriving (Eq, Show)

-- main = print 3
        --   c <- readArray memo 25
        --   putStr $ shows c "\n"
        --   a <- primeCheck memo 25
        --   b <- primeCheck memo $ 17*13
        --   d <- primeCheck memo 11981
        --   a' <- readArray memo 25
        --   b' <- readArray memo $ 17*13
        --   d' <- readArray memo 11981
        --   putStr $ shows a' "\n"
        --   putStr $ shows b' "\n"
        --   putStr $ shows d' "\n"
main = do
    memo <- newListArray (0, 9999999) initialMemo :: IO (IOArray Int TriBool)
    inp <- getContents
    let nums = tail . lines $ inp
        perms = map (toList . fromList . allPerms) nums
    out <- mapM (countPrimes memo) perms
    mapM_ print out

allPerms = map (read :: (String -> Int)) . foldr (\x y -> if null x then y else permutations x ++ y) [] . subsequences

initial25 :: [TriBool]
initial25 = [N, N, Y, Y] ++ [if even x || x `mod` 3 == 0
                             then N
                             else Y | x <- [4..24]]

initialMemo :: [TriBool]
initialMemo = initial25 ++ replicate (9999999-24) M

countPrimes :: IOArray Int TriBool -> [Int] -> IO Int
countPrimes memo = foldM (\total val -> do bool <- primeCheck memo val
                                           if bool then return (total+1)
                                                   else return total) 0

primeCheck :: IOArray Int TriBool -> Int -> IO Bool
primeCheck arr n = do ans <- readArray arr n
                      case ans of
                        Y -> return True
                        N -> return False
                        M -> if isPrime n
                             then do writeArray arr n Y
                                     return True
                             else do writeArray arr n N
                                     return False

isPrime toCheck | even toCheck || toCheck `mod` 3 == 0 = False
                | otherwise = divisorCheck toCheck 5

divisorCheck toCheck divisor | toCheck `mod` divisor == 0 || toCheck `mod` (divisor+2) == 0 = False
                             | divisor*divisor <= toCheck = divisorCheck toCheck $ divisor+6
                             | otherwise = True

