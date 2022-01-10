import           Data.Bifunctor (first, second)

main = print 3

type Queue = ([Int], [Int])

insert :: Int -> Queue -> Queue
insert n = second (n :)

pop :: Queue -> (Queue, Int)
pop q | null $ fst q = pop (reverse $ snd q, [])
      | otherwise = (first tail q, head $ fst q)
