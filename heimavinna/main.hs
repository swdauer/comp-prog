main :: IO ()
main = do
    line <- getLine
    print $ countProblems 0 line

countProblems :: Int -> String -> Int
countProblems _ "" = 0
countProblems _ (';':line) = countProblems 0 line
countProblems previous ('-':line) = let (current, next) = head . reads $ line
                                    in current - previous + countProblems 0 next
countProblems _ line = let (current, next) = head . reads $ line
                       in 1 + countProblems current next
