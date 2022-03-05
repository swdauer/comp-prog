import           Data.Maybe
main = do
    getLine
    getContents >>= mapM_ (maybe (putStrLn "skipped") print . computeCase) . lines

computeCase :: String -> Maybe Int
computeCase ('P':_) = Nothing
computeCase line = let (x, rest) = head . reads $ line
                       (y, _) = head . reads . tail $ rest
                   in Just (x + y)
