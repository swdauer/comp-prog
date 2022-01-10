import           Control.Monad
import           Data.Array.IO
import           Data.Bifunctor

main = do
    line <- getLine
    let numVertices = read line :: Int
    if numVertices == 0 then return ()
    else do
        parents <- newArray (1, numVertices) 0 :: IO (IOUArray Int Int)
        nChildren <- newArray (1, numVertices) 0 :: IO (IOUArray Int Int)
        nMarbles <- newArray (1, numVertices) 0 :: IO (IOUArray Int Int)
        ls <- replicateM numVertices getLine
        queue <- foldM (\q line -> parseLine line
                                             parents
                                             nChildren
                                             nMarbles
                                             q) ([], []) ls
        readArray parents 9 >>= print
        readArray nChildren 4 >>= print
        readArray nMarbles 8 >>= print
        print queue

type Queue = ([Int], [Int])

insert :: Int -> Queue -> Queue
insert n = second (n :)

pop :: Queue -> (Queue, Int)
pop q | null $ fst q = pop (reverse $ snd q, [])
      | otherwise = (first tail q, head $ fst q)

parseLine :: String -> IOUArray Int Int -> IOUArray Int Int -> IOUArray Int Int -> Queue -> IO Queue
parseLine line parents nChildren nMarbles leaves = do
    let pieces = map (read :: String -> Int) . words $ line
        vertexNum = head pieces
    writeArray nChildren vertexNum (pieces !! 2)
    writeArray nMarbles vertexNum (pieces !! 1)
    mapM_ (\x -> writeArray parents x vertexNum) $ drop 3 pieces
    if pieces !! 2 == 0
        then return $ insert vertexNum leaves
        else return leaves
