# Autogenerated from a Treetop grammar. Edits may be lost.


#grammar Example
#  rule labels
#    first_letter:[a-z] rest_letters:(', ' letter:[a-z])* '.' {
#      def letters
#        [first_letter] + rest_letters
#      end
#      
#      def rest_letters 
#        super.map do |comma_and_letter|
#          comma_and_letter.letter
#        end
#      end
#    }
#  end
#end

module Example
  include Treetop::Runtime

  def root
    @root ||= :thing
  end

  module Thing0
    def chars
      elements[0]
    end

  end

  def _nt_thing
    start_index = index
    if node_cache[:thing].has_key?(index)
      cached = node_cache[:thing][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_chars
    s0 << r1
    if r1
      if has_terminal?('.', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('.')
        r2 = nil
      end
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Thing0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:thing][start_index] = r0

    r0
  end

  module Chars0
    def l
      elements[1]
    end
  end

  module Chars1
    def f
      elements[0]
    end

    def r
      elements[1]
    end
  end

  module Chars2
    def letters
      [f] + r.elements.collect {|e| e.l }
    end
  end

  module Chars3
    def letters
      [self]
    end
  end

  def _nt_chars
    start_index = index
    if node_cache[:chars].has_key?(index)
      cached = node_cache[:chars][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_char
    s1 << r2
    if r2
      s3, i3 = [], index
      loop do
        i4, s4 = index, []
        if has_terminal?(', ', false, index)
          r5 = instantiate_node(SyntaxNode,input, index...(index + 2))
          @index += 2
        else
          terminal_parse_failure(', ')
          r5 = nil
        end
        s4 << r5
        if r5
          r6 = _nt_char
          s4 << r6
        end
        if s4.last
          r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
          r4.extend(Chars0)
        else
          @index = i4
          r4 = nil
        end
        if r4
          s3 << r4
        else
          break
        end
      end
      if s3.empty?
        @index = i3
        r3 = nil
      else
        r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      end
      s1 << r3
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Chars1)
      r1.extend(Chars2)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      r7 = _nt_char
      r7.extend(Chars3)
      if r7
        r0 = r7
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:chars][start_index] = r0

    r0
  end

  def _nt_char
    start_index = index
    if node_cache[:char].has_key?(index)
      cached = node_cache[:char][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('\G[a-z]', true, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      r0 = nil
    end

    node_cache[:char][start_index] = r0

    r0
  end

end

class ExampleParser < Treetop::Runtime::CompiledParser
  include Example
end

