module ColumnOperations where 

konsdot :: [Int] -> Int -> [Int]
konso :: Int -> [Int] -> [Int]
isEmpty :: [Int] -> Bool

-- REALISASI
konso e l = [e] ++ l
konsdot l e = l ++ [e]
isEmpty l = null l

isOneelmt :: [Int] -> Bool
isOneelmt l =
    if (null (tail l)) then
        True
    else
        False

maxElement :: [Int] -> Int
maxElement l =
    if isOneelmt l then
        head l
    else if (head l) >= head (tail l) then
        maxElement (konso (head l) (tail(tail l)))
    else
        maxElement (tail l)

minElement :: [Int] -> Int
minElement l =
    if isOneelmt l then
        head l
    else if (head l) <= head (tail l) then
        minElement (konso (head l) (tail(tail l)))
    else
        minElement (tail l)

sumElement :: [Int] -> Int
sumElement l =
    if l == [] then
        0
    else
        (head l) + sumElement (tail l)

coba :: [[Int]] -> Int -> [Int]
coba l n =
    if null l then
        []
    else if null (head l) then
        []
    else if n == 1 then
        konso (maxElement (map head l)) (coba (map tail l) 2)
    else if n == 2 then
        konso (minElement (map head l)) (coba (map tail l) 3)
    else
        konso (sumElement (map head l)) (coba (map tail l) 1)

-- Lengkapi Fungsi di bawah ini
columnOperations :: [[Int]] -> [Int]
columnOperations l =
    coba l 1