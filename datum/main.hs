main = do
    line <- getLine
    let (day:month:_) = map read . words $ line
    putStrLn $ weekday !! dayMod7 month day

monthDays :: [Int]
monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30]

dayMod7 :: Int -> Int -> Int
dayMod7 month day = (sum (take (month-1) monthDays) + day - 1) `mod` 7

weekday :: [String]
weekday = ["Thursday", "Friday", "Saturday",
           "Sunday", "Monday", "Tuesday", "Wednesday"]
