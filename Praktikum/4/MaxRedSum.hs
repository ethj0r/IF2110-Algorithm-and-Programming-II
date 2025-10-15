module MaxRedSum where

data BinTree a = Empty | Node a (BinTree a) (BinTree a)
  deriving (Show, Eq)

-- KONSTRUKTOR
makeBinTree :: Int -> (BinTree Int) -> (BinTree Int) -> (BinTree Int)
makeBinTree a l r = Node a l r

-- SELEKTOR
akar :: (BinTree Int) -> Int
akar (Node a _ _) = a

left :: (BinTree Int) -> (BinTree Int)
left (Node _ l _) = l

right :: (BinTree Int) -> (BinTree Int)
right (Node _ _ r) = r

-- PREDIKAT
isTreeEmpty :: (BinTree Int) -> Bool
isTreeEmpty Empty = True
isTreeEmpty _     = False

isOneElmt :: (BinTree Int) -> Bool
isOneElmt p = not (isTreeEmpty p) && isTreeEmpty (left p) && isTreeEmpty (right p)

isUnerLeft :: (BinTree Int) -> Bool
isUnerLeft p = not (isTreeEmpty p) && not (isTreeEmpty (left p)) && isTreeEmpty (right p)

isUnerRight :: (BinTree Int) -> Bool
isUnerRight p = not (isTreeEmpty p) && isTreeEmpty (left p) && not (isTreeEmpty (right p))

isBiner :: (BinTree Int) -> Bool
isBiner p = not (isTreeEmpty p) && not (isTreeEmpty (left p)) && not (isTreeEmpty (right p))

isExistLeft :: (BinTree Int) -> Bool
isExistLeft p = not (isTreeEmpty p) && not (isTreeEmpty (left p))

isExistRight :: (BinTree Int) -> Bool
isExistRight p = not (isTreeEmpty p) && not (isTreeEmpty (right p))

-- DEFINISI UTAMA
maxRedSum :: (BinTree Int) -> Int
maxRedSum p =
  if isTreeEmpty p then 0
  else
    let withRoot =
          akar p
          + (if isTreeEmpty (left p) then 0 else maxRedSum (left (left p)) + maxRedSum (right (left p)))
          + (if isTreeEmpty (right p) then 0 else maxRedSum (left (right p)) + maxRedSum (right (right p)))
        withoutRoot = maxRedSum (left p) + maxRedSum (right p)
    in if withRoot > withoutRoot then withRoot else withoutRoot


    
-- maxRedSum menghitung jumlah maksimum nilai node berwarna merah dengan aturan pewarnaan sebagai berikut:
--   - Awalnya setiap node pada binary tree berwarna putih
--   - Anda dapat mewarnai sebuah node menjadi merah dengan syarat 
--     tidak ada node tetangganya (parent atau child) yang diwarnai merah. 
--     Dengan kata lain, tidak ada dua node warna merah yang bertetanggaan.
--   - Operasi pewarnaan node dapat dilakukan sebanyak mungkin selama tidak melanggar syarat lain
--
-- Batasan:
--   - Nilai dari sebuah node dipastikan bernilai positif
--   - 1 <= n <= 12 dengan n adalah banyak node
--
-- Contoh:
-- Diberikan pohon:
--       3
--      / \
--     1   4
--        / \
--       2   6
-- Dapat dibuktikan bahwa jumlah maksimum nilai node berwarna merah akan diperoleh
-- jika kita mewarnai node-node berikut menjadi merah: [3, 2, 6]
-- sehingga jawabannya adalah 3 + 2 + 6 = 11
--
-- Keterangan:
--   - Anda diperbolehkan menggunakan fungsi helper

-- TODO: implementasikan fungsi maxRedSum