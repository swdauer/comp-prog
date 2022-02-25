main = do
    sauron <- getLine
    putStrLn $ isRight sauron

isRight :: String -> String
isRight = helper 0
    where helper i ('(':rest) =
            if length rest - 1 == i
                then "correct"
                else "fix"
          helper i (_:rest) = helper (i+1) rest
