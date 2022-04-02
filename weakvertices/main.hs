import           Control.Monad
import           Data.Array.IO

{-
Procedure:
1. Read in the adjMatrix
2. For each vertex, check if it is memoized as strong
3. If not generate all pairs of its connected vertices
4. Check if any of these pairs are connected
5. If so, all three of those vertices are strong, if not, it's weak
-}

main = do
    line <- getLine
    let n = read line :: Int
    if n == -1 then return ()
    else do
        matrix <- mapM (const getLine) [0..n-1]
        memo <- newArray (0, n-1) False :: IO Memo
        adjMatrix <- newArray_ ((0, 0), (n-1, n-1)) :: IO AdjMatrix
        writeAdjMatrix adjMatrix matrix
        ps <- mapM (getConnections adjMatrix n) [0..n-1]
        m <- zipWithM (isStrong adjMatrix memo) [0..n-1] (map pairs ps)
        mapM_ (\(r, x) -> unless x $ putStr (shows r " ")) $ zip [0..] m
        putStrLn ""
        main

type AdjMatrix = IOUArray (Int, Int) Bool
type Memo = IOUArray Int Bool

writeAdjMatrix :: AdjMatrix -> [String] -> IO ()
writeAdjMatrix adjMatrix matrix =
    mapM_ (uncurry $ writeRow adjMatrix) $ zip [0..] matrix

writeRow :: AdjMatrix -> Int -> String -> IO ()
writeRow adjMatrix rowNum row =
    mapM_ (\(colNum, c) -> writeArray adjMatrix (rowNum, colNum) (c == "1"))
          $ zip [0..] (words row)

getConnections :: AdjMatrix -> Int -> Int -> IO [Int]
getConnections adjMatrix n rowNum = do
    row <- mapM (\colNum -> readArray adjMatrix (rowNum, colNum)) [0..n-1]
    return $ map fst $ filter snd $ zip [0..] row

isStrong :: AdjMatrix -> Memo -> Int -> [(Int, Int)] -> IO Bool
isStrong adjMatrix memo n [] = do
    m <- readArray memo n
    if m then return True
    else return False
isStrong adjMatrix memo n ((x, y):xys) = do
    m <- readArray memo n
    if m then return True
    else do
        isC <- readArray adjMatrix (x, y)
        if isC then do
            writeArray memo n True
            writeArray memo x True
            writeArray memo y True
            return True
        else do
            isStrong adjMatrix memo n xys

pairs :: [Int] -> [(Int, Int)]
pairs []     = []
pairs (x:xs) = zip (repeat x) xs ++ pairs xs
