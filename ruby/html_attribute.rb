# Autogenerated from a Treetop grammar. Edits may be lost.


require 'html_parser'

module HTMLAttribute
  include Treetop::Runtime

  def root
    @root ||= :attributes
  end

  include HTML

  module Attributes0
    def space
      elements[0]
    end

    def attribute
      elements[1]
    end
  end

  module Attributes1
    def attribute
      elements[0]
    end

    def space_n_attributes
      elements[1]
    end
  end

  module Attributes2
    def to_a
      [attribute] + space_n_attributes.elements.collect{|space_n_attribute| space_n_attribute.attribute }
    end

    def to_hash
      hash = { attribute.attribute_name.to_s => attribute, }
      space_n_attributes.elements.each{|space_n_attribute| 
        hash.update space_n_attribute.attribute.attribute_name.to_s => space_n_attribute.attribute
      }
      hash
    end

    def [] key_or_index
      if ( key_or_index.is_a? String and key_or_index =~ /^\d+$/ ) or key_or_index.is_a? Fixnum
        attributes = self.to_a
      else
        attributes = self.to_hash
      end

      attributes[key_or_index]
    end

    def has_key? key
      self.to_hash.has_key? key
    end
  end

  def _nt_attributes
    start_index = index
    if node_cache[:attributes].has_key?(index)
      cached = node_cache[:attributes][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_attribute
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        i3, s3 = index, []
        r4 = _nt_space
        s3 << r4
        if r4
          r5 = _nt_attribute
          s3 << r5
        end
        if s3.last
          r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
          r3.extend(Attributes0)
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
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Attributes1)
      r0.extend(Attributes2)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:attributes][start_index] = r0

    r0
  end

  module Attribute0
    def attribute_name
      elements[0]
    end

    def equal
      elements[1]
    end

    def attribute_value
      elements[2]
    end
  end

  module Attribute1
    def to_s
      text_value
    end
  end

  def _nt_attribute
    start_index = index
    if node_cache[:attribute].has_key?(index)
      cached = node_cache[:attribute][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_attribute_name
    s0 << r1
    if r1
      r2 = _nt_equal
      s0 << r2
      if r2
        r3 = _nt_attribute_value
        s0 << r3
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Attribute0)
      r0.extend(Attribute1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:attribute][start_index] = r0

    r0
  end

  module AttributeName0
  end

  module AttributeName1
    def to_s
      text_value
    end
  end

  def _nt_attribute_name
    start_index = index
    if node_cache[:attribute_name].has_key?(index)
      cached = node_cache[:attribute_name][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('\G[_a-zA-Z]', true, index)
      r1 = true
      @index += 1
    else
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if has_terminal?('\G[_a-zA-Z0-9]', true, index)
          r3 = true
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
      r0.extend(AttributeName0)
      r0.extend(AttributeName1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:attribute_name][start_index] = r0

    r0
  end

  module AttributeValue0
    def any
      elements[1]
    end
  end

  module AttributeValue1
    def double_quote1
      elements[0]
    end

    def val
      elements[1]
    end

    def double_quote2
      elements[2]
    end
  end

  module AttributeValue2
    def any
      elements[1]
    end
  end

  module AttributeValue3
    def single_quote1
      elements[0]
    end

    def val
      elements[1]
    end

    def single_quote2
      elements[2]
    end
  end

  module AttributeValue4
    def to_s
      val.text_value
    end
  end

  def _nt_attribute_value
    start_index = index
    if node_cache[:attribute_value].has_key?(index)
      cached = node_cache[:attribute_value][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_double_quote
    s1 << r2
    if r2
      s3, i3 = [], index
      loop do
        i4, s4 = index, []
        i5 = index
        r6 = _nt_double_quote
        if r6
          r5 = nil
        else
          @index = i5
          r5 = instantiate_node(SyntaxNode,input, index...index)
        end
        s4 << r5
        if r5
          r7 = _nt_any
          s4 << r7
        end
        if s4.last
          r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
          r4.extend(AttributeValue0)
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
      r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      s1 << r3
      if r3
        r8 = _nt_double_quote
        s1 << r8
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(AttributeValue1)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
      r0.extend(AttributeValue4)
    else
      i9, s9 = index, []
      r10 = _nt_single_quote
      s9 << r10
      if r10
        s11, i11 = [], index
        loop do
          i12, s12 = index, []
          i13 = index
          r14 = _nt_single_quote
          if r14
            r13 = nil
          else
            @index = i13
            r13 = instantiate_node(SyntaxNode,input, index...index)
          end
          s12 << r13
          if r13
            r15 = _nt_any
            s12 << r15
          end
          if s12.last
            r12 = instantiate_node(SyntaxNode,input, i12...index, s12)
            r12.extend(AttributeValue2)
          else
            @index = i12
            r12 = nil
          end
          if r12
            s11 << r12
          else
            break
          end
        end
        r11 = instantiate_node(SyntaxNode,input, i11...index, s11)
        s9 << r11
        if r11
          r16 = _nt_single_quote
          s9 << r16
        end
      end
      if s9.last
        r9 = instantiate_node(SyntaxNode,input, i9...index, s9)
        r9.extend(AttributeValue3)
      else
        @index = i9
        r9 = nil
      end
      if r9
        r0 = r9
        r0.extend(AttributeValue4)
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:attribute_value][start_index] = r0

    r0
  end

end

class HTMLAttributeParser < Treetop::Runtime::CompiledParser
  include HTMLAttribute
end

