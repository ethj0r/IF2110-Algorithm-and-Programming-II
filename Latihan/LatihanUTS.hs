
konso :: Int -> [Int] -> [Int]
konso e list = [e] ++ list

konsDot :: [Int] -> Int -> [Int]
konsDot list e = list ++ [e]

isEmpty :: [Int] -> Bool
isEmpty list = null list

isOneElmt :: [Int] -> Bool
isOneElmt list = (length list) == 1

----------------------------------

nbElmt :: [Int] -> Int
nbElmt list = 
    if (isEmpty list) then 0
    else 1 + nbElmt(tail list)

isMember :: Int -> [Int] -> Bool
isMember target list =
    if (isEmpty list) then False
    else if (target == head list) then True
    else isMember target (tail list)

copyList :: [Int] -> [Int]
copyList list =
    if (isEmpty list) then []
    else konso (head list) (copyList (tail list))

isEqual :: [Int] -> [Int] -> Bool
isEqual l1 l2 
    | isEmpty l1 && isEmpty l2 = True
    | isEmpty l1 && not (isEmpty l2) = False
    | not (isEmpty l1) && isEmpty l2 = False
    | otherwise = (head l1 == head l2) && isEqual (tail l1) (tail l2)

konkat :: [Int] -> [Int] -> [Int]
konkat l1 l2 =
    if (isEmpty l1) then l2
    else konso (head l1) (konkat (tail l1) l2)

elmtKeN :: Int -> [Char] -> Char
elmtKeN n lc = 
    if (null lc) then error "List kosong"
    else if (n == 1) then head lc
    else elmtKeN (n-1) (tail lc)

isXElmtKeN :: Int -> Int -> [Int] -> Bool
isXElmtKeN x n l =
    if (isEmpty l) then False
    else if (n == 1 && (head l) == x) then True
    else isXElmtKeN x (n-1) (tail l)

max2 :: Int -> Int -> Int
max2 a b =
    if (a > b) then a else b

maxList :: [Int] -> Int
maxList l =
    if (isOneElmt l) then last l
    else (max2 (head l) (maxList (tail l)))

listPlus :: [Int] -> [Int] -> [Int]
listPlus l1 l2 =
    if (isEmpty l1) || (isEmpty l2) then []
    else
        konso ((head l1)+(head l2)) (listPlus (tail l1) (tail l2))

maxNb :: [Int] -> (Int, Int)
maxNb l =
    if (isOneElmt l) then (head l, 1)
    else
        let (m,n) = maxNb (tail l)
        in
            if (m < head l) then (head l, 1)
            else if (m > head l) then (m, n)
            else (m, n+1)

nbA :: [Char] -> Int
nbA lc =
    if (null lc) then 0
    else if (head lc == 'a') then 1 + nbA (tail lc)
    else nbA (tail lc)

nbX :: Int -> [Int] -> Int
nbX x l =
    if (isEmpty l) then 0
    else if (x == head l) then 1 + nbX x (tail l)
    else nbX x (tail l)

----------------------------------

-- ini udah masuk ke latihan edunex

countFactorOfX :: Int -> [Int] -> Int
countFactorOfX n l =
    if (isEmpty l) then 0
    else if ((head l) `mod` n == 0) then 1 + countFactorOfX n (tail l)
    else countFactorOfX n (tail l)

delNthElmt :: Int -> [Char] -> [Char]
delNthElmt n lc =
    if (null lc) then []
    else if (n == 1) then tail lc
    else (head lc) : (delNthElmt (n-1) (tail lc))

sumIsiList :: [Int] -> Int
sumIsiList l =
    if (isEmpty l) then 0
    else (head l) + sumIsiList (tail l)

filterGanjil :: [Int] -> [Int]
filterGanjil l =
    if (isEmpty l) then []
    else if (head l `mod` 2 /= 0) then konso (head l) (filterGanjil (tail l))
    else filterGanjil (tail l)

isEqFront :: [Char] -> [Char] -> Bool
isEqFront t1 t2 =
    if (null t1) then True
    else if (head t1 /= head t2) then False
    else isEqFront (tail t1) (tail t2)

isOrdered :: [Int] -> Bool
-- terurut membesar
isOrdered l =
    if (isOneElmt l || isEmpty l) then True
    else if ((head l) > head (tail l)) then False
    else isOrdered (tail l)

mergeList :: [Int] -> [Int] -> [Int]
-- merge list dengan tetap terurut membesar
-- prekondisi l1 dan l2 list terurut membesar
mergeList l1 l2
    | isEmpty l1 && isEmpty l2  = []
    | isEmpty l1                = l2
    | isEmpty l2                = l1
    | head l1 <= head l2        = konso (head l1) (mergeList (tail l1) l2)
    | otherwise                 = konso (head l2) (mergeList l1 (tail l2))


-- maxNb :: [Int] -> (Int, Int)
-- maxNb l =
--     if (isOneElmt l) then (head l, 1)
--     else
--         let (m,n) = maxNb (tail l)
--         in
--             if (m < head l) then (head l, 1)
--             else if (m > head l) then (m, n)
--             else (m, n+1)


splitList :: [Int] -> ([Int], [Int])
splitList l =
    if (isEmpty l) then ([], [])
    else
        let (l1, l2) = splitList (tail l)
        in
            if (head l >= 0) then (konso (head l) l1, l2)
            else (l1, konso (head l) l2)


isMemberChar :: Char -> [Char] -> Bool
isMemberChar c lc = 
    if (null lc) then False
    else if (c == head lc) then True
    else isMemberChar (c) (tail lc)
 
isUnique :: [Char] -> Bool
isUnique lc =
    if (null lc) then True
    else if (isMemberChar (head lc) (tail lc)) then False
    else (isUnique (tail lc))

posOfX :: Char -> [Char] -> Int
posOfX c lc =
    if null lc then 0
    else if c == head lc then 1
    else let pos = posOfX c (tail lc)
         in if pos == 0 then 0 else 1 + pos

splitAlternate :: [Char] -> ([Char], [Char])
splitAlternate l =
    if (null l) then ([],[])
    else if (null (tail l)) then ([head l],[])
    else
        let (l1, l2) = splitAlternate (tail (tail l))
        in
            (head l : l1, head (tail l) : l2)


isEqS :: [[Int]] -> [[Int]] -> Bool
isEqS l1 l2 = 
    if (null l1 && null l2) then True
    else if (null l1 && not (null l2)) then False
    else if (not (null l1) && not (null l2)) then False
    else if (not (null l1) && not (null l2)) then
        if (head l1 == Int) && (head l2 == Int) then 
            (head l1) = (head l2) and then
                isEqS(tail l1)