import           Control.Monad (replicateM_)
main = do
    hey <- getLine
    putChar 'h'
    replicateM_ ((length hey - 2) * 2) (putChar 'e')
    putChar 'y'
    putChar '\n'
