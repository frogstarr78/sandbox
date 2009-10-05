module Arithmetic
  include Treetop::Runtime

  def root
    @root || :additive
  end

  module Additive0
    def multitive
      elements[0]
    end

    def additive
      elements[2]
    end
  end

  module Additive1
    def value
      multitive.value + additive.value
    end
  end

  def _nt_additive
    start_index = index
    if node_cache[:additive].has_key?(index)
      cached = node_cache[:additive][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_multitive
    s1 << r2
    if r2
      if input.index('+', index) == index
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('+')
        r3 = nil
      end
      s1 << r3
      if r3
        r4 = _nt_additive
        s1 << r4
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Additive0)
      r1.extend(Additive1)
    else
      self.index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      r5 = _nt_multitive
      if r5
        r0 = r5
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:additive][start_index] = r0

    return r0
  end

  def _nt_add_op
    start_index = index
    if node_cache[:add_op].has_key?(index)
      cached = node_cache[:add_op][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index('+', index) == index
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('+')
      r0 = nil
    end

    node_cache[:add_op][start_index] = r0

    return r0
  end

  module Multitive0
    def primary
      elements[0]
    end

    def multitive
      elements[2]
    end
  end

  module Multitive1

    def value
      primary.value * multitive.value
    end
  end

  def _nt_multitive
    start_index = index
    if node_cache[:multitive].has_key?(index)
      cached = node_cache[:multitive][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_primary
    s1 << r2
    if r2
      if input.index('*', index) == index
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('*')
        r3 = nil
      end
      s1 << r3
      if r3
        r4 = _nt_multitive
        s1 << r4
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Multitive0)
      r1.extend(Multitive1)
    else
      self.index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      r5 = _nt_primary
      if r5
        r0 = r5
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:multitive][start_index] = r0

    return r0
  end

  def _nt_mult_op
    start_index = index
    if node_cache[:mult_op].has_key?(index)
      cached = node_cache[:mult_op][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index('*', index) == index
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('*')
      r0 = nil
    end

    node_cache[:mult_op][start_index] = r0

    return r0
  end

  module Primary0
    def additive
      elements[1]
    end

  end

  module Primary1
    def value
      additive.value
    end
  end

  def _nt_primary
    start_index = index
    if node_cache[:primary].has_key?(index)
      cached = node_cache[:primary][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    if input.index('(', index) == index
      r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('(')
      r2 = nil
    end
    s1 << r2
    if r2
      r3 = _nt_additive
      s1 << r3
      if r3
        if input.index(')', index) == index
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(')')
          r4 = nil
        end
        s1 << r4
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Primary0)
      r1.extend(Primary1)
    else
      self.index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      r5 = _nt_number
      if r5
        r0 = r5
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:primary][start_index] = r0

    return r0
  end

  module Number0
  end

  module Number1
 
	  def value
	    text_value.to_i
	  end
  end

  def _nt_number
    start_index = index
    if node_cache[:number].has_key?(index)
      cached = node_cache[:number][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index(Regexp.new('[1-9]'), index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if input.index(Regexp.new('[0-9]'), index) == index
          r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Number0)
      r0.extend(Number1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:number][start_index] = r0

    return r0
  end

end

class ArithmeticParser < Treetop::Runtime::CompiledParser
  include Arithmetic
end

