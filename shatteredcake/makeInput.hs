import           Control.Monad (replicateM_)
main = do
    print 5
    print 5000000
    replicateM_ 5000000 $ putStrLn "1 1"
