module RunLengthEncoding where

runLengthEncoding :: [Char] -> [(Char, Int)]
runLengthEncoding lc =
    if (null lc) then []
    else
        if null (tail lc) then [(head lc, 1)]
        else if head lc == head (tail lc) then
            let (c, n) : xs = runLengthEncoding (tail lc)
            in
                (c, n+1) : xs
        else
            (head lc, 1) : runLengthEncoding (tail lc)
