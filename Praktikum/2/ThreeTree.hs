module ThreeTree where

-- DEFINISI DAN SPESIFIKASI FUNGSI
-- threeTree: [Int] -> (Int,[Int])
-- {threeTree(l) menghasilkan list baru yang hanya berisi bilangan kelipatan 3 dari list l}
-- Contoh : threeTree [1,2,3,4,5,6] = [3,6]
threeTree :: [Int] -> [Int]
threeTree l =
    if (null l) then []
    else if (mod (head l) 3 == 0) then head l : threeTree (tail l)
    else threeTree (tail l)