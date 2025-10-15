data BinTree a = Empty | Node a (BinTree a) (BinTree a) deriving (Show)

makeBinTree :: Int -> (BinTree Int) -> (BinTree Int) -> (BinTree Int)
-- makeBinTree a Empty = Node a Empty Empty
makeBinTree a l r = Node a l r

-- SELEKTOR
akar :: (BinTree Int) -> Int
akar (Node a l r) = a

left :: (BinTree Int) -> (BinTree Int)
left (Node a l r) = l

right :: (BinTree Int) -> (BinTree Int)
right (Node a l r) = r

-- PREDIKAT
isTreeEmpty :: (BinTree Int) -> Bool
isTreeEmpty Empty = True
isTreeEmpty (Node a l r) = False

isUnerLeft :: (BinTree Int) -> Bool
isUnerLeft p =
    not (isTreeEmpty p) && not (isTreeEmpty (left p)) && isTreeEmpty (right p)

isUnerRight :: (BinTree Int) -> Bool
isUnerRight p =
    not (isTreeEmpty p) && isTreeEmpty (left p) && not (isTreeEmpty (right p))

isBiner :: (BinTree Int) -> Bool
isBiner p =
    not (isTreeEmpty p) && not (isTreeEmpty (left p)) && not (isTreeEmpty (right p))

isExistLeft :: (BinTree Int) -> Bool
isExistLeft p =
    not (isTreeEmpty p) && not (isTreeEmpty (left p))

isExistRight :: (BinTree Int) -> Bool
isExistRight p =
    not (isTreeEmpty p) && not (isTreeEmpty (right p))



-- FUNGSI LAIN (LATIHAN)
nbElmt :: (BinTree Int) -> Int
nbElmt p =
    if isTreeEmpty p then 0
    else
        nbElmt (left p) + 1 + nbElmt (right p)

isMember :: Int -> (BinTree Int) -> Bool
isMember x p = 
    if isTreeEmpty p then False
    else if akar p == x then True
    else
        isMember x (left p) || isMember x (right p)

isSkewLeft :: (BinTree Int) -> Bool
isSkewLeft p =
    if (isTreeEmpty p) then False
    else if (isExistRight p) then False
    else if (isUnerLeft p) then isSkewLeft (left p)
    else True

sumPos :: (BinTree Int) -> Int
-- sumPos p =
--     if (isTreeEmpty p) then 0
--     else if (isBiner p) then
--         if (akar p >= 0) then
--             (sumPos (left p)) + (akar p) + (sumPos (right p))
--         else
--             (sumPos (left p) + sumPos (right p))
--     else if (isUnerLeft p) then
--         if (akar p >= 0) then
--             (akar p) + (sumPos (left p))
--         else sumPos (left p)
--     else
--         if (akar p >= 0) then
--             (akar p) + (sumPos (right p))
--         else sumPos (right p)
sumPos p 
    | isTreeEmpty p = 0   
    | akar p >= 0  = akar p + sumPos (left p) + sumPos (right p)
    | otherwise    = sumPos (left p) + sumPos (right p) 

levelOfX :: Int -> (BinTree Int) -> Int
levelOfX x p = 
    if (isTreeEmpty p) then 0
    else if (akar p == x) then 1
    else
        let lk = levelOfX x (left p)
            rk = levelOfX x (right p)
            in 
                if (lk /= 0) then lk + 1
                else if (rk /= 0) then rk + 1
                else 0

levelMax :: (BinTree Int) -> Int
levelMax p
    | isTreeEmpty p     = 0
    -- | isOneElmt p       = 1
    | isBiner p         = let lk = levelMax (left p)
                              rk = levelMax (right p)
                              in
                                if lk > rk then 1 + lk else 1 + rk
    | isUnerLeft p      = 1 + levelMax (left p)
    | isUnerRight p     = 1 + levelMax (right p)
    | otherwise         = 0

makeListPos :: (BinTree Int) -> [Int]
makeListPos p =
    if (isTreeEmpty p) then []
    else if (akar p >= 0) then [(akar p)] ++ makeListPos (left p) ++ makeListPos (right p)
    else makeListPos (left p) ++ makeListPos (right p)

makeListParent :: 

-- EXAMPLE INPUT

-- skew to left:
p1 =
    makeBinTree
        8
        (makeBinTree
            8
            (makeBinTree
                8
                (makeBinTree
                    8
                    (makeBinTree
                        8
                        -- (makeBinTree 10 Empty Empty)
                        -- (makeBinTree 11 Empty Empty)
                        Empty
                        Empty
                    )
                    Empty
                )
                Empty
            )
            Empty
        )
        Empty


p3 = 
    makeBinTree
        8
        (makeBinTree
            3
            (makeBinTree
                1
                Empty
                Empty
            )
            (makeBinTree
                6
                (makeBinTree 4 Empty Empty)
                (makeBinTree 7 Empty Empty)
            )
        )
        (makeBinTree
            10
            Empty
            (makeBinTree
                (-14)
                (makeBinTree 13 Empty Empty)
                Empty
            )
        )