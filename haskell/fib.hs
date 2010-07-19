fib 1 = 1
fib 2 = 1
fib n = fib (n-1) + fib (n-2)

fibs xs = [ fib x | x <- xs ]
evenFibs xs = [ is_fib | x <- xs, let is_fib = fib x, even( is_fib ) ]
--evenFibs' xs = [ x | x <- evenFibs(xs) ]
--evenFibs' xs = foldr (\x acc -> x : acc ) [] [ last( take 3 x) | x <- xs ]
third xs = last ( take 3 xs )
sumFibs' xs = sum xs

--maxEvenFibs xs max = [ is_fib | x <- xs, let is_fib = fib x, even( is_fib ) ]
evenFilter = filter even

--sumFibs xs = foldl (\acc x -> if acc > 4000000 then acc else acc + x) 0 xs

threeFibs xs = [(a,b,c) | a <- xs, b <- xs, c <- xs ]
