module SecondLargest where

helper :: [Int] -> Int -> Int -> Int
helper l maks1 maks2 =
    if null l then maks2
    else if head l > maks1
        then helper (tail l) (head l) maks1
    else if head l > maks2
        then helper (tail l) maks1 (head l)
    else helper (tail l) maks1 maks2

secondLargest :: [Int] -> Int
secondLargest l =
    if head l > head (tail l)
        then helper (tail (tail l)) (head l) (head (tail l))
    else helper (tail (tail l)) (head (tail l)) (head l)
