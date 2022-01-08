module Main where

import           Data.Char (isLetter)

main = print 3

-- constructTable table [] = table
-- constructTable table (s:ss) | not (isLetter s) || s `inTable` table = constructTable table ss
--                             | otherwise = constructTable (addToTable s table) ss

constructTable :: [Char] -> [[Char]]
constructTable = foldl (\table c -> if not (isLetter c) || c `inTable` table
                                    then table
                                    else addToTable c table) [[]]

constructFullTable str = constructTable (str ++ ['a'..'p'] ++ ['r'..'z'])

inTable s = foldl (\b r -> b || (s `elem` r)) False

addToTable c [[]] = [[c]]
addToTable c (r:table) | length r == 5 = [c]:r:table
                       | otherwise = (c:r) : table

colIndex :: [Char] -> Char -> Maybe Int
colIndex row c = let colIndexHelper [] c i = Nothing
                     colIndexHelper (r:row) c i | r == c = Just i
                                                | otherwise = colIndexHelper row c (i+1)
                 in colIndexHelper row c 0

tableCoord table c = let tableCoordHelper (row:table) c rowIdx = case colIndex row c of
                                                                    Nothing -> tableCoordHelper table c (rowIdx+1)
                                                                    Just x -> (rowIdx, x)
                     in tableCoordHelper table c 0

idxRight (x, y) | y == 0 = (x, 4)
                | otherwise = (x, y-1)

idxBelow (x, y) | x == 0 = (4, y)
                | otherwise = (x-1, y)

accessTable (x, y) table = table !! x !! y
