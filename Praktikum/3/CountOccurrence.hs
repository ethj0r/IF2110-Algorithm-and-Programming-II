module CountOccurrence where

-- count(ListOfList, n) menghitung berapa kali integer n muncul di dalam sebuah list of list.
-- CONTOH: count [[1,2,1],[3],[1,4]] 1 menghasilkan 3
counter :: [Int] -> Int -> Int
counter x n =
    if x == [] then
        0
    else if (head x) == n then
        1 + counter (tail x) n
    else
        counter (tail x) n

count :: [[Int]] -> Int -> Int
count l n = 
    if l == [] then 0
    else
        counter (head l) n + count (tail l) n