# Autogenerated from a Treetop grammar. Edits may be lost.


require 'html_parser'
require 'html_attribute'

module HTMLNodeElement
  include Treetop::Runtime

  def root
    @root ||= :node
  end

  include HTML

  include HTMLAttribute

  module Node0
    def any
      elements[1]
    end
  end

  module Node1
    def space
      elements[0]
    end

    def attributes
      elements[1]
    end
  end

  module Node2
    def gt
      elements[0]
    end

    def name
      elements[1]
    end

    def lt
      elements[5]
    end
  end

  module Node3
    def node_name
      elements[1].text_value
    end

    def attributes
      elements[2].elements[0].attributes
    end

    def empty?
      elements[4].text_value == '/'
    end
  end

  def _nt_node
    start_index = index
    if node_cache[:node].has_key?(index)
      cached = node_cache[:node][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_gt
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        i3, s3 = index, []
        i4 = index
        r5 = _nt_space
        if r5
          r4 = nil
        else
          @index = i4
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s3 << r4
        if r4
          r6 = _nt_any
          s3 << r6
        end
        if s3.last
          r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
          r3.extend(Node0)
        else
          @index = i3
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        @index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      s0 << r2
      if r2
        s7, i7 = [], index
        loop do
          i8, s8 = index, []
          r9 = _nt_space
          s8 << r9
          if r9
            r10 = _nt_attributes
            s8 << r10
          end
          if s8.last
            r8 = instantiate_node(SyntaxNode,input, i8...index, s8)
            r8.extend(Node1)
          else
            @index = i8
            r8 = nil
          end
          if r8
            s7 << r8
          else
            break
          end
        end
        r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
        s0 << r7
        if r7
          r12 = _nt_space
          if r12
            r11 = r12
          else
            r11 = instantiate_node(SyntaxNode,input, index...index)
          end
          s0 << r11
          if r11
            if has_terminal?('/', false, index)
              r14 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure('/')
              r14 = nil
            end
            if r14
              r13 = r14
            else
              r13 = instantiate_node(SyntaxNode,input, index...index)
            end
            s0 << r13
            if r13
              r15 = _nt_lt
              s0 << r15
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Node2)
      r0.extend(Node3)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:node][start_index] = r0

    r0
  end

  def _nt_gt
    start_index = index
    if node_cache[:gt].has_key?(index)
      cached = node_cache[:gt][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('<', false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('<')
      r0 = nil
    end

    node_cache[:gt][start_index] = r0

    r0
  end

  def _nt_lt
    start_index = index
    if node_cache[:lt].has_key?(index)
      cached = node_cache[:lt][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('>', false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('>')
      r0 = nil
    end

    node_cache[:lt][start_index] = r0

    r0
  end

end

class HTMLNodeElementParser < Treetop::Runtime::CompiledParser
  include HTMLNodeElement
end
