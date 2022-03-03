import           Data.Char

main = getLine >>= putStr . show . stringToClock

data ClockNum = CN {
    b0   :: Char
    , b1 :: Char
    , b2 :: Char
    , b3 :: Char
} deriving Show

data Clock = C {
    hoursTens     :: ClockNum
    , hoursOnes   :: ClockNum
    , minutesTens :: ClockNum
    , minutesOnes :: ClockNum
}

instance Show Clock where
    show c = clockLine b3 c ++ clockLine b2 c ++ clockLine b1 c ++ clockLine b0 c

clockLine :: (ClockNum -> Char) -> Clock -> String
clockLine f c = f (hoursTens c) : ' ' : f (hoursOnes c) : ' ' : ' ' : ' '
                : f (minutesTens c) : ' ' : f (minutesOnes c) : "\n"

digitToClockNum :: Int -> ClockNum
digitToClockNum i =
    let mod2toChar int = if int `mod` 2 == 1 then '*' else '.'
    in CN (mod2toChar i) (mod2toChar $ i `div` 2) (mod2toChar $ i `div` 4) (mod2toChar $ i `div` 8)

stringToClock :: String -> Clock
stringToClock (ht:ho:mt:mo:_) =
    C (digitToClockNum . digitToInt $ ht)
    (digitToClockNum . digitToInt $ ho)
    (digitToClockNum . digitToInt $ mt)
    (digitToClockNum . digitToInt $ mo)
