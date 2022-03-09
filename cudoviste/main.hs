import           Data.Array.IO
import           Data.Ix

type Memo = IOUArray (Int, Int) Char

main = do
    line <- getLine
    let [x, y] = map (read :: String -> Int) . words $ line
    memo <- newArray_ ((0,0), (x-1, y-1)) :: IO Memo
    contents <- getContents
    mapM_ (uncurry $ populateRow memo) $ zip [0..] . lines $ contents
    output <- mapM (numCarsSquashed memo) $ range ((0,0), (x-2,y-2))
    mapM_ print $ map (\y -> foldl (\acc x -> if x == Just y then acc + 1 else acc) 0 output) [0..4]

populateRow :: Memo -> Int -> String -> IO ()
populateRow memo x line = mapM_ (\(y, c) -> writeArray memo (x, y) c) $ zip [0..] line

numCarsSquashed :: Memo -> (Int,Int) -> IO (Maybe Int)
numCarsSquashed memo (x,y) = do
    p <- readArray memo (x, y)
    p' <- readArray memo (x+1, y)
    p'' <- readArray memo (x, y+1)
    p''' <- readArray memo (x+1, y+1)
    let ps = [p,p',p'',p''']
    if '#' `elem` ps then return Nothing
    else do
        let n = foldl (\acc c -> if c == 'X' then acc + 1 else acc) 0 ps
        return (Just n)
