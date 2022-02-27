import           Control.Monad
import           Data.IORef
import qualified Data.Map.Strict as Map
import           Data.Maybe

type Memo = Map.Map String Int

main = do
    wLine <- getLine
    getLine
    let w = read wLine :: Int
    area <- newIORef 0
    content <- getContents
    foldM_ (addNextArea area) Map.empty $ lines content
    readIORef area >>= (\x -> print $ x `div` w)

parsePoint :: String -> [(Int, Int)]
parsePoint content = do
    (x, rest) <- reads content :: [(Int, String)]
    (y, _) <- reads rest :: [(Int, String)]
    return (x, y)

addNextArea :: IORef Int -> Memo -> String -> IO Memo
addNextArea area memo content = do
    let val = Map.lookup content memo
    if isNothing val then do
        let (x, y) = head . parsePoint $ content
            prod = x * y
        modifyIORef' area (+ prod)
        return $ Map.insert content prod memo
    else do
        modifyIORef' area (+ fromJust val)
        return memo
