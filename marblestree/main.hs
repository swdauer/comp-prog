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
        readArray nChildren 4 >>= print
        readArray nMarbles 4 >>= print
        (q, count) <- removeVertex 8 4 nChildren nMarbles queue
        readArray nChildren 4 >>= print
        readArray nMarbles 4 >>= print

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

removeVertex :: Int -> Int
                -> IOUArray Int Int -> IOUArray Int Int
                -> Queue -> IO (Queue, Int)
removeVertex vertex parent nChildren nMarbles leaves = do
    -- remove child from parent
    parentChildren <- readArray nChildren parent
    writeArray nChildren parent (parentChildren - 1)
    -- add (marbles - 1) from child to parent
    childMarbles <- readArray nMarbles vertex
    parentMarbles <- readArray nMarbles parent
    writeArray nMarbles parent (parentMarbles + childMarbles - 1)
    return (if parentChildren == 1
                then insert parent leaves
                else leaves,
            abs(childMarbles-1))
