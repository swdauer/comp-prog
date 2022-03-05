import           Data.Char
main = do
    getLine
    contents <- getContents
    let num = sum . map (isPink . map toLower) . lines $ contents
    if num == 0
        then putStrLn "I must watch Star Wars with my daughter"
        else print num

isPink :: String -> Int
isPink []                  = 0
isPink ('p':'i':'n':'k':_) = 1
isPink ('r':'o':'s':'e':_) = 1
isPink (s:ss)              = isPink ss
