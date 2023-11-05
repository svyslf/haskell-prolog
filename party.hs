import Data.List

-- Exercise 1.1 --
digits :: Int -> [Int]
digits 0 =
  []
digits x =
  digits (x `quot` 10) ++ [x `rem` 10]
-- Exercise 1.1 ends here --

--Exercise 1.2 --
isPar :: Int -> Bool
isPar x
  | elem 0 uniquelist = False
  | length uniquelist /= 4 = False
  | lasttwo `mod` firsttwo == 0 = True
  | otherwise = False
  where
    digilist = digits x
    uniquelist = nub digilist
    firsttwo = (uniquelist !! 0) * 10 + (uniquelist !! 1)
    lasttwo = (uniquelist !! 2) * 10 + (uniquelist !! 3)

-- produce all 4 digit numbers --
producer :: [Int]
producer =
  [999 .. 9999]

pars :: [Int]
pars =
  filter isPar fourdigitnums
  where
    fourdigitnums = producer


-- Exercise 1.2 ends here --


-- Exercise 1.3 --
isParty :: (Int, Int) -> Bool
isParty (x, y) = x `mod` missingdigit == 0 && y `mod` missingdigit == 0 && filter (`elem` as) bs == [] 
  where
    as = digits x
    bs = digits y
    combinelist = as ++ bs
    alldigits = [1 .. 10]
    missingdigit = head (alldigits \\ combinelist)

elementpair :: Int -> [Int] -> [(Int, Int)]
elementpair elem list
  = case list of
    [] -> []
    x : xs -> [(elem, x)] ++ [(x, elem)] ++ elementpair elem xs
    -- with repetition you get 14 pairs --

makepairs :: [Int] -> [(Int, Int)]
makepairs list 
  = case list of
    [] -> []
    x : xs -> elementpair x xs ++ makepairs xs

partys :: [(Int, Int)]
partys =
  filter isParty possiblepairs
  where
    possiblepairs = makepairs pars
-- SOLUTION TO THE TEASER = YOUR PAR IS 1785 --
-- Unique solutions = (1785, 2496), (2496, 1785), (1785, 4692) AND (4692, 1785) --
main = print partys