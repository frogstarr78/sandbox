
# line 1 "/home/scott/git/sandbox/ragel/i.rl"


# line 10 "/home/scott/git/sandbox/ragel/i.rl"



class Experimental


  attr_accessor :data

  def initialize data
    @data = data
  end

  
# line 20 "/home/scott/git/sandbox/ragel/i.rb"
class << self
	attr_accessor :_Experimental_key_offsets
	private :_Experimental_key_offsets, :_Experimental_key_offsets=
end
self._Experimental_key_offsets = [
	0, 0, 2
]

class << self
	attr_accessor :_Experimental_trans_keys
	private :_Experimental_trans_keys, :_Experimental_trans_keys=
end
self._Experimental_trans_keys = [
	48, 57, 0
]

class << self
	attr_accessor :_Experimental_single_lengths
	private :_Experimental_single_lengths, :_Experimental_single_lengths=
end
self._Experimental_single_lengths = [
	0, 0, 0
]

class << self
	attr_accessor :_Experimental_range_lengths
	private :_Experimental_range_lengths, :_Experimental_range_lengths=
end
self._Experimental_range_lengths = [
	0, 1, 0
]

class << self
	attr_accessor :_Experimental_index_offsets
	private :_Experimental_index_offsets, :_Experimental_index_offsets=
end
self._Experimental_index_offsets = [
	0, 0, 2
]

class << self
	attr_accessor :_Experimental_trans_targs
	private :_Experimental_trans_targs, :_Experimental_trans_targs=
end
self._Experimental_trans_targs = [
	0, 2, 2, 0
]

class << self
	attr_accessor :_Experimental_trans_actions
	private :_Experimental_trans_actions, :_Experimental_trans_actions=
end
self._Experimental_trans_actions = [
	0, 1, 0, 0
]

class << self
	attr_accessor :_Experimental_eof_actions
	private :_Experimental_eof_actions, :_Experimental_eof_actions=
end
self._Experimental_eof_actions = [
	0, 1, 0
]

class << self
	attr_accessor :Experimental_start
end
self.Experimental_start = 1;
class << self
	attr_accessor :Experimental_first_final
end
self.Experimental_first_final = 1;
class << self
	attr_accessor :Experimental_error
end
self.Experimental_error = 0;

class << self
	attr_accessor :Experimental_en_main
end
self.Experimental_en_main = 1;


# line 23 "/home/scott/git/sandbox/ragel/i.rl"
  
# line 106 "/home/scott/git/sandbox/ragel/i.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = Experimental_start
end

# line 24 "/home/scott/git/sandbox/ragel/i.rl"

  def run
    
# line 117 "/home/scott/git/sandbox/ragel/i.rb"
begin
	testEof = false
	_klen, _trans, _keys = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_keys = _Experimental_key_offsets[cs]
	_trans = _Experimental_index_offsets[cs]
	_klen = _Experimental_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p] < _Experimental_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p] > _Experimental_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _Experimental_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p] < _Experimental_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p] > _Experimental_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	cs = _Experimental_trans_targs[_trans];

	if _Experimental_trans_actions[_trans] != 0

		case _Experimental_trans_actions[_trans] 
	when 1 then
# line 5 "/home/scott/git/sandbox/ragel/i.rl"
		begin

  		end
# line 198 "/home/scott/git/sandbox/ragel/i.rb"
		end # action switch 
	end

	end
	if _goto_level <= _again
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	begin
		case ( _Experimental_eof_actions[cs] )
	when 1 then
# line 5 "/home/scott/git/sandbox/ragel/i.rl"
		begin

  		end
# line 223 "/home/scott/git/sandbox/ragel/i.rb"
		end
	end
	end

	end
	if _goto_level <= _out
		break
	end
end
	end

# line 27 "/home/scott/git/sandbox/ragel/i.rl"
  end
end

e = Experimental.new ARGV
e.run
