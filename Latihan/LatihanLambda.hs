

pos :: [Int] -> [Int]
pos l =
    if (null l) then []
    else
        if (head l >= 0) then (head l) : (pos (tail l))
        else (pos (tail l))

neg :: [Int] -> [Int]
neg l =
    if (null l) then []
    else 
        if (head l < 0) then (head l) : (neg (tail l))
        else (neg (tail l))

kabisat :: [Int] -> [Int]
kabisat l =
    if (null l) then []
    else
        if ((head l `mod` 400 == 0) || ((head l `mod` 4 == 0) && (head l `mod` 100 /= 0)))
            then head l : kabisat (tail l)
        else kabisat (tail l)

myFilter :: ([Int] -> [Int]) -> [Int] -> [Int]
myFilter func l =
    if null l then []
    else if func (head l) then head l : myFilter func (tail l)
    else myFilter func (tail l)

------------------------------------------------------------------

isPos :: Int -> Bool
isPos x = x < 0

isNeg :: Int -> Bool
isNeg x = x < 0

isKabisat :: Int -> Bool
isKabisat x = (mod x 400 == 0) || ((mod x 4== 0) && (mod x 100 /= 0))

-- filterIn :: [Int]
