import           Data.Array.IO
main = do
    line1 <- getLine
    let n = head $ parseLine line1
    companiesLine <- getLine
    coords <- newArray (1, n) 0 :: IO (IOUArray Int Int)
    initArray n 1 coords companiesLine
    -- print 3
    -- let companies = parseLine companiesLine
    -- coords <- newListArray (1, n) companies :: IO (IOUArray Int Int)
    contents <- getContents
    mapM_ (executeQuery coords . parseLine) $ lines contents

parseLine :: String -> [Int]
parseLine line = do
    (x, rest) <- reads line
    x : parseLine rest

initArray :: Int -> Int -> IOUArray Int Int -> String -> IO ()
initArray numCoords curr coords line | curr > numCoords = return ()
                                     | otherwise = do
                                         let (val, rest) = head . reads $ line
                                         writeArray coords curr val
                                         initArray numCoords (curr+1) coords rest

executeQuery :: IOUArray Int Int -> [Int] -> IO ()
executeQuery coords (1:c:x:_) = writeArray coords c x
executeQuery coords (2:a:b:_) = do
    a' <- readArray coords a
    b' <- readArray coords b
    if a' > b' then print $ a' - b'
    else print $ b' - a'
