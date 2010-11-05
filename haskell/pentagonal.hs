import List

pentagonal n = div ( n * (3 * n - 1 ) ) 2

pentagonals max = [ pentagonal x | x <- [1..max] ]

pentagonalDiff j k
     | j > k     = ( pentagonal j ) - ( pentagonal k )
	 | otherwise = ( pentagonal k ) - ( pentagonal j )

pentagonalSum j k = ( pentagonal j ) + ( pentagonal k )

pentagonalSumAndDiff max = [ (pSum, pDiff, isPentagonal pSum, isPentagonal pDiff) | x <- [1..max], y <- [1..max], let pSum = pentagonalSum x y, let pDiff = pentagonalDiff x y ]
filteredPentagonalSumAndDiff max = [ (pSum, pDiff, isPentagonal pSum, isPentagonal pDiff) | x <- [1..max], y <- [1..max], let pSum = pentagonalSum x y, let pDiff = pentagonalDiff x y, isPentagonal pSum, isPentagonal pDiff ]
filteredPentagonalSumAndDiff' max = [ (pSum, pDiff, isPentagonal pSum, isPentagonal pDiff) | x <- (pentagonals max), y <- (pentagonals max), let pSum = x + y, let pDiff = x - y, isPentagonal pSum, isPentagonal pDiff ]

isPentagonal num = elem num ( pentagonals num ) 

--filterPentagonals :: (a -> Bool) -> [a] -> [a]
--filterPentagonals [] = []
filterSumPentagonals max = filter (\(sum,diff,sumPent,diffPent) -> sumPent ) ( pentagonalSumAndDiff max )
filterDiffPentagonals max = filter (\(sum,diff,sumPent,diffPent) -> diffPent ) ( pentagonalSumAndDiff max )
filterSumAndDiffPentagonals max = filter (\(sum,diff,sumPent,diffPent) -> sumPent && diffPent ) ( pentagonalSumAndDiff max )

-- Pn = n(3n-1)/2
-- Pm = Pn+1
-- Po = Pn-1
-- Pn + Pm = Pn
-- Pn - Po = Pn
-- 92 = n(3n-1)/2
-- 184 = n(3n-1)
-- 184/n = 3n-1
-- (184/n)-1 = 3n
