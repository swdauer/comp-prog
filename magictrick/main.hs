import           Data.Array.IO
main = do
    word <- getLine
    hashTable <- newArray ('a', 'z') 0 :: IO (IOUArray Char Int)
    q <- isRepeatedChar hashTable word
    if q
        then print 1
        else print 0

isRepeatedChar :: IOUArray Char Int -> String -> IO Bool
isRepeatedChar _ "" = return True
isRepeatedChar hashTable (w:word) = do
    val <- readArray hashTable w
    if val == 1
        then return False
        else do
            writeArray hashTable w (val+1)
            isRepeatedChar hashTable word
