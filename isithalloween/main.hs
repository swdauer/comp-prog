main = getLine >>= putStrLn . isItHalloween

isItHalloween "OCT 31" = "yup"
isItHalloween "DEC 25" = "yup"
isItHalloween _        = "nope"
