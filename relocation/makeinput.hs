import           Control.Monad
main = do
    putStrLn "40000 40000"
    putChar '1'
    replicateM_ 39999 $ putStr " 1"
    putChar '\n'
    replicateM_ 39999 $ putStrLn "1 2 5"
    putStrLn "2 2 1000"
