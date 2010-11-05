fib 1 = 1
fib 2 = 1
fib n = fib(n - 1) + fib(n - 2)


fibonacci max = [cfib | x <- [1..max], let cfib = fib x]
evenFibs toMax = [ evenFib | x <- [1..toMax], let afib = fib x, let bfib = fib x, let evenFib = fib x]
