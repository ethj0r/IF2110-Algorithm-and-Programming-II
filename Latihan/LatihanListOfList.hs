data LList a = Atom a | List [LList a] deriving (Show, Eq)

isEmpty :: LList a -> Bool
isEmpty x =
    if isAtom x then False
    else 
        let (List xs) = x
        in
            if null xs then True else all isEmpty xs

isOneElmt :: LList a -> Bool
isOneElmt x =
    if isAtom x then True
    else
        let (List xs) = x
        in
            if length xs == 1 then not (isEmpty (head xs)) else False

isAtom :: LList a -> Bool
isAtom x = if case x of Atom _ -> True; _ -> False then True
            else if case x of List [y] -> True; _ -> False then isAtom (let (List [y]) = x in y)
            else False

isList :: LList a -> Bool
isList x = if isAtom x then False else True