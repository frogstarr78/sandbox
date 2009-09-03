#!/usr/bin/env ruby

def fib
    rng = (0..10).to_a
    rng.inject(0) do |l,r|
        l+=rng.index(r)-1
        puts l
        l
    end
end

fib
