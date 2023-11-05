import Data.List

--originally written for the other exercise, but also used here--
digits :: Int -> [Int]
digits 0 =
  []
digits x =
  digits (x `quot` 10) ++ [x `rem` 10]

-- Exercise 2.1 --
number :: [Int] -> Int 
number = foldl combine 0
  where combine x xs= x*10 + xs
-- Exercise 2.1 ends here --


--Exercise 2.2--
splits :: [a] -> [([a],[a])]
splits [] = []
splits [x] = []
splits (x:xs) = ([x], xs) : map combinesections (splits xs)
    where combinesections (z, y) = (x:z,y)

possibles :: [([Int],[Int])]
possibles = concat (map splits (permutations [1..9]))
-- Exercise 2.2 ends here-- 


-- Exercise 2.3 --

smallerlist :: [Int] -> [Int] -> Bool
smallerlist x y
  | number x < number y = last x == 3 
  | number y < number x = last y == 3
--checks which list is smaller and if the last value is 3--

isAcceptable :: ([Int],[Int]) -> Bool
isAcceptable (x, y) = smallerlist x y && (head numproduct == 4) && numproduct == reversed
  where numproduct = digits (number x * number y)
        reversed = reverse numproduct

acceptables :: [([Int],[Int])]
acceptables = filter isAcceptable possibles 
-- Exercise 2.3 ends here--

--SOLUTION TO TEASER: The smallest product was 23*1769548 = 40699604--
-- 23 + 1769548 + 100 = 1769671 --
main = putStrLn( show acceptables)

