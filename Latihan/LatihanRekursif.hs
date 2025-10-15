deretSegitiga :: Int -> Int
deretSegitiga n = 
    if (n==1) then
        1
    else
        n + deretSegitiga n-1

isGanjil :: Int -> Bool
isGanjil n =
    if (n==0) then False
    else if (n==1) then True
    else isGanjil (n-2)

luasBS :: Int -> Int
luasBS n = 
    if (n==0) then 0
    else luasBS(n-1) + (2*n-1)

sumOfDigits :: Int -> Int
sumOfDigits n =
    if (n<10) then n
    else (n `mod` 10) + sumOfDigits(n `div` 10)

sumOfDigitsPosNeg :: Int -> Int
sumOfDigitsPosNeg n
    | n < 0 = sumOfDigitsPosNeg (abs(n))
    | n < 10 = n
    | otherwise = (n `mod` 10) + sumOfDigitsPosNeg(n `div` 10)
    -- if (n < 0) then sumOfDigitsPosNeg(abs(n))
    -- else if (n < 10) then n
    -- else (n `mod` 10) + sumOfDigitsPosNeg(n `div` 10)

sumRange :: Int -> Int -> Int
sumRange n m =
    if (n == m) then m
    else n + sumRange (n+1) m