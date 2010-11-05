--fac n = if n == 0 then 1 else n * fac (n-1)

fac 0 = 1
fac n = n * fac ( n - 1 )

--primeFactor ofNum
--[ show x | x <- xs ]


--poly x y = x == y
--poly [x] = False
poly [] = 0
poly (x:[]) = x
poly (x:xs) = last xs
--poly (x:xs) = {
--	x == last xs
--	poly $ init xs
--}
--[ ( (head $ show x ) == (last $ show x ), x) | x <- xs ]
--isPolymorph :: [Char] -> Bool
--isPolymorph num
--   | length ( show num ) > 1 = isPolymorph 
--   | otherwise               = isPolymorph


