main = do
    contents <- getContents
    let caseStrings = tail . lines $ contents
    mapM_ (putStrLn . isSafe . parseCase) caseStrings

type Case = (Double, Double, Double, Double, Double)

parseCase :: String -> Case
parseCase line =
    let parseCaseList :: String -> [Double]
        parseCaseList l = do
            (x, rest) <- reads l :: [(Double, String)]
            x : parseCaseList rest
        caseList = parseCaseList line
    in (head caseList, caseList !! 1, caseList !! 2, caseList !! 3, caseList !! 4)

t1 :: Case -> Double
t1 (v0, theta, x1, _, _) = x1 / (v0 * (cos . degToRad $ theta))

isSafe :: Case -> String
isSafe c@(v0, theta, x1, h1, h2) =
    let t = t1 c
        y1 = v0 * t * (sin . degToRad $ theta) - 0.5 * 9.81 * t**2 in
    if y1 >= h1 + 1 && y1 <= h2 - 1 then "Safe"
    else "Not Safe"

degToRad :: Double -> Double
degToRad = (*) $ 2 * pi / 360
