
def bsearch array, key
	return nil if array.size == 0

	loop do 
		probe = array.size / 2
		mid_value = array[probe]

		return probe if mid_value == key

		if mid_value < key
			return bsearch array[0,probe + 1]
		else
			return bsearch array[probe + 1, array.size]
		end
	end
end


a = [].fill 'a'...'z'
puts a.inspect

