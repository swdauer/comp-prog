main = do
    getLine
    getContents >>= print . areaUnderCurve . map parsePoint . lines

parsePoint :: String -> (Double, Double)
parsePoint line =
    let ws = words line
    in (read $ head ws, read . head . tail $ ws)

trapezoidArea :: (Double, Double) -> (Double, Double) -> Double
trapezoidArea (t, v) (t', v') = (v + v') / 2 * (t' - t) / 1000

areaUnderCurve :: [(Double, Double)] -> Double
areaUnderCurve []        = 0
areaUnderCurve [_]       = 0
areaUnderCurve (p:p':ps) = trapezoidArea p p' + areaUnderCurve (p':ps)
