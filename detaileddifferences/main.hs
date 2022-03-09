main = do
    getContents >>= mapM_ putStrLn . executeCases . tail . lines

executeCases :: [String] -> [String]
executeCases []       = []
executeCases (x:y:ss) = x : y : difference x y : "" : executeCases ss

difference :: String -> String -> String
difference "" _          = ""
difference (x:xs) (y:ys) = (if x == y then '.' else '*') : difference xs ys
