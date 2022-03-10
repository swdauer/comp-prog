main = do
    contents <- getContents
    let indicesAndLines = zip [1..] . map containsFBI . lines $ contents
        nums = foldr (\(idx, b) acc -> if b then show idx:acc else acc) [] indicesAndLines
    if null nums then putStrLn "HE GOT AWAY!"
    else do
        putStrLn $ foldl1 (\acc c -> acc ++ " " ++ c) nums

containsFBI :: String -> Bool
containsFBI []              = False
containsFBI ('F':'B':'I':_) = True
containsFBI (_:rest)        = containsFBI rest
