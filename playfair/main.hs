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
