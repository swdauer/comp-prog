main = do
    number <- getLine
    let first3 = take 3 number
    if first3 == "555"
        then putChar '1'
        else putChar '0'
    putChar '\n'
