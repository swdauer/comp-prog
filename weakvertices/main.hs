import           Control.Monad
import           Data.Array.IO

main = do
    line <- getLine
    let n = read line :: Int
    if n == -1 then return ()
    else do
        matrix <- mapM (const getLine) [1..n]
        putStrLn line >> mapM_ putStrLn matrix
        main

type AdjMatrix = IOUArray (Int, Int) Bool
type Memo = IOUArray Int Bool
