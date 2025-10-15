-- TYPE DEFINITION
data LinkedList a = Nil | Node a (LinkedList a)
  deriving (Show, Eq)

isEmpty :: LinkedList a -> Bool
isEmpty l =
    case l of
        Nil -> True
        _   -> False

konso :: a -> LinkedList a -> LinkedList a
konso e l = Node e l

konsDot :: LinkedList a -> a -> LinkedList a
konsDot l e =
    if (isEmpty l) then Node e Nil
    else Node (firstElmt l) (konsDot (tailList l) e)

firstElmt :: LinkedList a -> a
firstElmt l =
    if (isEmpty l) then error "List kosong"
    else case l of Node x _ -> x


-- BASIC OPS lets fucking go (ini implementasi dari list biasa)

tailList :: LinkedList a -> LinkedList a
tailList l =
    if (isEmpty l) then error "List kosong"
    else case l of Node _ xs -> xs

nbElmt :: LinkedList a -> Int
nbElmt l =
    if (isEmpty l) then 0
    else 1 + nbElmt (tailList l)

isOneElmt :: LinkedList a -> Bool
isOneElmt l =
    if (isEmpty l) then False
    else isEmpty (tailList l)

isMember :: (Eq a) => a -> LinkedList a -> Bool
isMember x l =
    if (isEmpty l) then False
    else if (firstElmt l == x) then True
    else isMember x (tailList l)

copy :: LinkedList a -> LinkedList a
copy l =
    if (isEmpty l) then Nil
    else Node (firstElmt l) (copy (tailList l))

konkat :: LinkedList a -> LinkedList a -> LinkedList a
konkat l1 l2 =
    if (isEmpty l1) then l2
    else Node (firstElmt l1) (konkat (tailList l1) l2)

elmtKeN :: Int -> LinkedList a -> a
elmtKeN n l =
    if (isEmpty l) then error "Indeks tidak valid"
    else if (n == 1) then firstElmt l
    else elmtKeN (n - 1) (tailList l)

nbX :: (Eq a) => a -> LinkedList a -> Int
nbX x l =
    if (isEmpty l) then 0
    else if (firstElmt l == x) then 1 + nbX x (tailList l)
    else nbX x (tailList l)

maxList :: LinkedList Int -> Int
maxList l =
    if (isEmpty l) then error "List kosong"
    else if (isEmpty (tailList l)) then firstElmt l
    else
        let m = maxList (tailList l)
        in if (firstElmt l) > m then firstElmt l else m

-- _________________________________________________________ divider

insertFirst :: a -> LinkedList a -> LinkedList a
insertFirst x l = Node x l

insertLast :: a -> LinkedList a -> LinkedList a
insertLast x l =
    if (isEmpty l) then Node x Nil
    else Node (firstElmt l) (insertLast x (tailList l))

insertAt :: a -> Int -> LinkedList a -> LinkedList a
insertAt x i l =
    if (i == 0) then Node x l
    else if (isEmpty l) then error "Invalid idx"
    else Node (firstElmt l) (insertAt x (i - 1) (tailList l))

deleteFirst :: LinkedList a -> LinkedList a
deleteFirst l =
    if (isEmpty l) then error "Empty list"
    else tailList l

deleteLast :: LinkedList a -> LinkedList a
deleteLast l =
    if (isEmpty l) then error "Empty list"
    else if (isEmpty (tailList l)) then Nil
    else Node (firstElmt l) (deleteLast (tailList l))

deleteAt :: Int -> LinkedList a -> LinkedList a
deleteAt i l =
    if (isEmpty l) then error "Invalid idx"
    else if (i == 0) then tailList l
    else Node (firstElmt l) (deleteAt (i - 1) (tailList l))

-- _________________________________________________________ divider

nbX :: (Eq a) => a -> LinkedList a -> Int
nbX x l =
    if (isEmpty l) then 0
    else if (firstElmt l == x) then 1 + nbX x (tailList l)
    else nbX x (tailList l)

maxList :: LinkedList Int -> Int
maxList l =
    if (isEmpty l) then error "List kosong"
    else if (isEmpty (tailList l)) then firstElmt l
    else
        let m = maxList (tailList l)
        in if (firstElmt l) > m then firstElmt l else m

isMax :: LinkedList Int -> Int -> Bool
isMax l x =
    if (isEmpty l) then error "List kosong"
    else if (isEmpty (tailList l)) then x >= firstElmt l
    else (x >= firstElmt l) && isMax (tailList l) x

deleteUnderX :: LinkedList Int -> Int -> LinkedList Int
deleteUnderX l x =
    if (isEmpty l) then Nil
    else if (firstElmt l) < x then deleteUnderX (tailList l) x
    else Node (firstElmt l) (deleteUnderX (tailList l) x)

-- _________________________________________________________ divider

concatList :: LinkedList a -> LinkedList a -> LinkedList a
concatList l1 l2 =
    if (isEmpty l1) then l2
    else Node (firstElmt l1) (concatList (tailList l1) l2)

find :: (Eq a) => a -> LinkedList a -> Maybe a
find x l =
    if (isEmpty l) then Nothing
    else if (firstElmt l == x) then Just x
    else find x (tailList l)

findBy :: (a -> Bool) -> LinkedList a -> Maybe a
findBy f l =
    if (isEmpty l) then Nothing
    else if (f (firstElmt l)) then Just (firstElmt l)
    else findBy f (tailList l)
