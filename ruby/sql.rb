module Sql
  include Treetop::Runtime

  def root
    @root || :select_stmt
  end

  module SelectStmt0
    def ws
      elements[2]
    end

    def columns
      elements[3]
    end

    def ws
      elements[4]
    end

    def ws
      elements[6]
    end

  end

  def _nt_select_stmt
    start_index = index
    if node_cache[:select_stmt].has_key?(index)
      cached = node_cache[:select_stmt][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      r2 = _nt_ws
      if r2
        s1 << r2
      else
        break
      end
    end
    r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    s0 << r1
    if r1
      if input.index("SELECT", index) == index
        r3 = instantiate_node(SyntaxNode,input, index...(index + 6))
        @index += 6
      else
        terminal_parse_failure("SELECT")
        r3 = nil
      end
      s0 << r3
      if r3
        r4 = _nt_ws
        s0 << r4
        if r4
          r5 = _nt_columns
          s0 << r5
          if r5
            r6 = _nt_ws
            s0 << r6
            if r6
              if input.index("FROM", index) == index
                r7 = instantiate_node(SyntaxNode,input, index...(index + 4))
                @index += 4
              else
                terminal_parse_failure("FROM")
                r7 = nil
              end
              s0 << r7
              if r7
                r8 = _nt_ws
                s0 << r8
                if r8
                  s9, i9 = [], index
                  loop do
                    if index < input_length
                      r10 = instantiate_node(SyntaxNode,input, index...(index + 1))
                      @index += 1
                    else
                      terminal_parse_failure("any character")
                      r10 = nil
                    end
                    if r10
                      s9 << r10
                    else
                      break
                    end
                  end
                  if s9.empty?
                    self.index = i9
                    r9 = nil
                  else
                    r9 = instantiate_node(SyntaxNode,input, i9...index, s9)
                  end
                  s0 << r9
                  if r9
                    r12 = _nt_newline
                    if r12
                      r11 = r12
                    else
                      r11 = instantiate_node(SyntaxNode,input, index...index)
                    end
                    s0 << r11
                  end
                end
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(SelectStmt0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:select_stmt][start_index] = r0

    return r0
  end

  module Columns0
    def literals?
      false
    end

    def to_a
      %w(*)
    end
  end

  module Columns1
    def literals?
      true
    end

    def to_a
      text_value.split ','
    end
  end

  module Columns2
    def literals?
      false
    end

    def to_a
      [text_value]
    end
  end

  def _nt_columns
    start_index = index
    if node_cache[:columns].has_key?(index)
      cached = node_cache[:columns][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    if input.index('*', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      r1.extend(Columns0)
      @index += 1
    else
      terminal_parse_failure('*')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      r2 = _nt_literals
      r2.extend(Columns1)
      if r2
        r0 = r2
      else
        r3 = _nt_literal
        r3.extend(Columns2)
        if r3
          r0 = r3
        else
          self.index = i0
          r0 = nil
        end
      end
    end

    node_cache[:columns][start_index] = r0

    return r0
  end

  module Literals0
    def literal
      elements[3]
    end
  end

  module Literals1
  end

  def _nt_literals
    start_index = index
    if node_cache[:literals].has_key?(index)
      cached = node_cache[:literals][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      r2 = _nt_literal
      if r2
        s1 << r2
      else
        break
      end
    end
    if s1.empty?
      self.index = i1
      r1 = nil
    else
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    end
    s0 << r1
    if r1
      s3, i3 = [], index
      loop do
        i4, s4 = index, []
        r6 = _nt_space
        if r6
          r5 = r6
        else
          r5 = instantiate_node(SyntaxNode,input, index...index)
        end
        s4 << r5
        if r5
          if input.index(',', index) == index
            r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure(',')
            r7 = nil
          end
          s4 << r7
          if r7
            r9 = _nt_space
            if r9
              r8 = r9
            else
              r8 = instantiate_node(SyntaxNode,input, index...index)
            end
            s4 << r8
            if r8
              r10 = _nt_literal
              s4 << r10
            end
          end
        end
        if s4.last
          r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
          r4.extend(Literals0)
        else
          self.index = i4
          r4 = nil
        end
        if r4
          s3 << r4
        else
          break
        end
      end
      if s3.empty?
        self.index = i3
        r3 = nil
      else
        r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      end
      s0 << r3
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Literals1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:literals][start_index] = r0

    return r0
  end

  module Literal0
    def operator
      elements[1]
    end

    def literal
      elements[3]
    end
  end

  module Literal1
  end

  def _nt_literal
    start_index = index
    if node_cache[:literal].has_key?(index)
      cached = node_cache[:literal][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    i1 = index
    r2 = _nt_constant
    if r2
      r1 = r2
    else
      r3 = _nt_function_call
      if r3
        r1 = r3
      else
        s4, i4 = [], index
        loop do
          if input.index(Regexp.new('[._a-zA-Z0-9]'), index) == index
            r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            r5 = nil
          end
          if r5
            s4 << r5
          else
            break
          end
        end
        if s4.empty?
          self.index = i4
          r4 = nil
        else
          r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
        end
        if r4
          r1 = r4
        else
          self.index = i1
          r1 = nil
        end
      end
    end
    s0 << r1
    if r1
      s6, i6 = [], index
      loop do
        i7, s7 = index, []
        r9 = _nt_space
        if r9
          r8 = r9
        else
          r8 = instantiate_node(SyntaxNode,input, index...index)
        end
        s7 << r8
        if r8
          r10 = _nt_operator
          s7 << r10
          if r10
            r12 = _nt_space
            if r12
              r11 = r12
            else
              r11 = instantiate_node(SyntaxNode,input, index...index)
            end
            s7 << r11
            if r11
              r13 = _nt_literal
              s7 << r13
            end
          end
        end
        if s7.last
          r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
          r7.extend(Literal0)
        else
          self.index = i7
          r7 = nil
        end
        if r7
          s6 << r7
        else
          break
        end
      end
      r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
      s0 << r6
      if r6
        r15 = _nt_alias
        if r15
          r14 = r15
        else
          r14 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r14
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Literal1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:literal][start_index] = r0

    return r0
  end

  module Alias0
  end

  module Alias1
    def quote_literal
      elements[0]
    end

    def quote_literal
      elements[2]
    end
  end

  module Alias2
    def space
      elements[0]
    end

    def space
      elements[2]
    end

  end

  def _nt_alias
    start_index = index
    if node_cache[:alias].has_key?(index)
      cached = node_cache[:alias][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_space
    s0 << r1
    if r1
      i2 = index
      if input.index('AS', index) == index
        r3 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('AS')
        r3 = nil
      end
      if r3
        r2 = r3
      else
        if input.index('as', index) == index
          r4 = instantiate_node(SyntaxNode,input, index...(index + 2))
          @index += 2
        else
          terminal_parse_failure('as')
          r4 = nil
        end
        if r4
          r2 = r4
        else
          self.index = i2
          r2 = nil
        end
      end
      s0 << r2
      if r2
        r5 = _nt_space
        s0 << r5
        if r5
          i6 = index
          i7, s7 = index, []
          r8 = _nt_quote_literal
          s7 << r8
          if r8
            s9, i9 = [], index
            loop do
              i10, s10 = index, []
              i11 = index
              r12 = _nt_quote_literal
              if r12
                r11 = nil
              else
                self.index = i11
                r11 = instantiate_node(SyntaxNode,input, index...index)
              end
              s10 << r11
              if r11
                if input.index(Regexp.new('[ _a-zA-Z0-9]'), index) == index
                  r13 = instantiate_node(SyntaxNode,input, index...(index + 1))
                  @index += 1
                else
                  r13 = nil
                end
                s10 << r13
              end
              if s10.last
                r10 = instantiate_node(SyntaxNode,input, i10...index, s10)
                r10.extend(Alias0)
              else
                self.index = i10
                r10 = nil
              end
              if r10
                s9 << r10
              else
                break
              end
            end
            if s9.empty?
              self.index = i9
              r9 = nil
            else
              r9 = instantiate_node(SyntaxNode,input, i9...index, s9)
            end
            s7 << r9
            if r9
              r14 = _nt_quote_literal
              s7 << r14
            end
          end
          if s7.last
            r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
            r7.extend(Alias1)
          else
            self.index = i7
            r7 = nil
          end
          if r7
            r6 = r7
          else
            s15, i15 = [], index
            loop do
              if input.index(Regexp.new('[_a-zA-Z0-9]'), index) == index
                r16 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                r16 = nil
              end
              if r16
                s15 << r16
              else
                break
              end
            end
            if s15.empty?
              self.index = i15
              r15 = nil
            else
              r15 = instantiate_node(SyntaxNode,input, i15...index, s15)
            end
            if r15
              r6 = r15
            else
              self.index = i6
              r6 = nil
            end
          end
          s0 << r6
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Alias2)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:alias][start_index] = r0

    return r0
  end

  def _nt_quote_literal
    start_index = index
    if node_cache[:quote_literal].has_key?(index)
      cached = node_cache[:quote_literal][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index('"', index) == index
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('"')
      r0 = nil
    end

    node_cache[:quote_literal][start_index] = r0

    return r0
  end

  def _nt_constant
    start_index = index
    if node_cache[:constant].has_key?(index)
      cached = node_cache[:constant][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    r1 = _nt_string_constant
    if r1
      r0 = r1
    else
      r2 = _nt_bit_constant
      if r2
        r0 = r2
      else
        r3 = _nt_numeric_constant
        if r3
          r0 = r3
        else
          self.index = i0
          r0 = nil
        end
      end
    end

    node_cache[:constant][start_index] = r0

    return r0
  end

  module StringConstant0
    def concat_op
      elements[1]
    end

    def literal
      elements[3]
    end
  end

  module StringConstant1
    def quote_val
      elements[0]
    end

    def quote_val
      elements[2]
    end

  end

  def _nt_string_constant
    start_index = index
    if node_cache[:string_constant].has_key?(index)
      cached = node_cache[:string_constant][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_quote_val
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if input.index(Regexp.new('[\\ ,"_a-zA-Z0-9]'), index) == index
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
      if s2.empty?
        self.index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      s0 << r2
      if r2
        r4 = _nt_quote_val
        s0 << r4
        if r4
          s5, i5 = [], index
          loop do
            i6, s6 = index, []
            r8 = _nt_space
            if r8
              r7 = r8
            else
              r7 = instantiate_node(SyntaxNode,input, index...index)
            end
            s6 << r7
            if r7
              r9 = _nt_concat_op
              s6 << r9
              if r9
                r11 = _nt_space
                if r11
                  r10 = r11
                else
                  r10 = instantiate_node(SyntaxNode,input, index...index)
                end
                s6 << r10
                if r10
                  r12 = _nt_literal
                  s6 << r12
                end
              end
            end
            if s6.last
              r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
              r6.extend(StringConstant0)
            else
              self.index = i6
              r6 = nil
            end
            if r6
              s5 << r6
            else
              break
            end
          end
          r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
          s0 << r5
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(StringConstant1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:string_constant][start_index] = r0

    return r0
  end

  module QuoteVal0
  end

  module QuoteVal1
  end

  module QuoteVal2
    def tag_name
      text_value
    end
  end

  def _nt_quote_val
    start_index = index
    if node_cache[:quote_val].has_key?(index)
      cached = node_cache[:quote_val][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    if input.index("'", index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure("'")
      r1 = nil
    end
    if r1
      r0 = r1
    else
      i2, s2 = index, []
      if input.index('$', index) == index
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('$')
        r3 = nil
      end
      s2 << r3
      if r3
        s4, i4 = [], index
        loop do
          i5, s5 = index, []
          i6 = index
          if input.index('$', index) == index
            r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure('$')
            r7 = nil
          end
          if r7
            r6 = nil
          else
            self.index = i6
            r6 = instantiate_node(SyntaxNode,input, index...index)
          end
          s5 << r6
          if r6
            if index < input_length
              r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("any character")
              r8 = nil
            end
            s5 << r8
          end
          if s5.last
            r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
            r5.extend(QuoteVal0)
          else
            self.index = i5
            r5 = nil
          end
          if r5
            s4 << r5
          else
            break
          end
        end
        r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
        s2 << r4
        if r4
          if input.index('$', index) == index
            r9 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure('$')
            r9 = nil
          end
          s2 << r9
        end
      end
      if s2.last
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        r2.extend(QuoteVal1)
        r2.extend(QuoteVal2)
      else
        self.index = i2
        r2 = nil
      end
      if r2
        r0 = r2
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:quote_val][start_index] = r0

    return r0
  end

  module BitConstant0
  end

  def _nt_bit_constant
    start_index = index
    if node_cache[:bit_constant].has_key?(index)
      cached = node_cache[:bit_constant][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('B', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('B')
      r1 = nil
    end
    s0 << r1
    if r1
      if input.index("'", index) == index
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure("'")
        r2 = nil
      end
      s0 << r2
      if r2
        s3, i3 = [], index
        loop do
          if input.index(Regexp.new('[01]'), index) == index
            r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            r4 = nil
          end
          if r4
            s3 << r4
          else
            break
          end
        end
        if s3.empty?
          self.index = i3
          r3 = nil
        else
          r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
        end
        s0 << r3
        if r3
          if input.index("'", index) == index
            r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("'")
            r5 = nil
          end
          s0 << r5
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(BitConstant0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:bit_constant][start_index] = r0

    return r0
  end

  module NumericConstant0
    def digits
      elements[2]
    end
  end

  module NumericConstant1
    def digits
      elements[0]
    end

  end

  module NumericConstant2
    def digits
      elements[2]
    end
  end

  module NumericConstant3
    def digits
      elements[2]
    end

  end

  module NumericConstant4
    def digits
      elements[0]
    end

    def digits
      elements[3]
    end
  end

  def _nt_numeric_constant
    start_index = index
    if node_cache[:numeric_constant].has_key?(index)
      cached = node_cache[:numeric_constant][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    r1 = _nt_digits
    if r1
      r0 = r1
    else
      i2, s2 = index, []
      r3 = _nt_digits
      s2 << r3
      if r3
        if input.index('.', index) == index
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('.')
          r4 = nil
        end
        s2 << r4
        if r4
          r6 = _nt_digits
          if r6
            r5 = r6
          else
            r5 = instantiate_node(SyntaxNode,input, index...index)
          end
          s2 << r5
          if r5
            i8, s8 = index, []
            if input.index('e', index) == index
              r9 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure('e')
              r9 = nil
            end
            s8 << r9
            if r9
              if input.index(Regexp.new('[-+]'), index) == index
                r10 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                r10 = nil
              end
              s8 << r10
              if r10
                r11 = _nt_digits
                s8 << r11
              end
            end
            if s8.last
              r8 = instantiate_node(SyntaxNode,input, i8...index, s8)
              r8.extend(NumericConstant0)
            else
              self.index = i8
              r8 = nil
            end
            if r8
              r7 = r8
            else
              r7 = instantiate_node(SyntaxNode,input, index...index)
            end
            s2 << r7
          end
        end
      end
      if s2.last
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        r2.extend(NumericConstant1)
      else
        self.index = i2
        r2 = nil
      end
      if r2
        r0 = r2
      else
        i12, s12 = index, []
        r14 = _nt_digits
        if r14
          r13 = r14
        else
          r13 = instantiate_node(SyntaxNode,input, index...index)
        end
        s12 << r13
        if r13
          if input.index('.', index) == index
            r15 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure('.')
            r15 = nil
          end
          s12 << r15
          if r15
            r16 = _nt_digits
            s12 << r16
            if r16
              i18, s18 = index, []
              if input.index('e', index) == index
                r19 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                terminal_parse_failure('e')
                r19 = nil
              end
              s18 << r19
              if r19
                if input.index(Regexp.new('[-+]'), index) == index
                  r20 = instantiate_node(SyntaxNode,input, index...(index + 1))
                  @index += 1
                else
                  r20 = nil
                end
                s18 << r20
                if r20
                  r21 = _nt_digits
                  s18 << r21
                end
              end
              if s18.last
                r18 = instantiate_node(SyntaxNode,input, i18...index, s18)
                r18.extend(NumericConstant2)
              else
                self.index = i18
                r18 = nil
              end
              if r18
                r17 = r18
              else
                r17 = instantiate_node(SyntaxNode,input, index...index)
              end
              s12 << r17
            end
          end
        end
        if s12.last
          r12 = instantiate_node(SyntaxNode,input, i12...index, s12)
          r12.extend(NumericConstant3)
        else
          self.index = i12
          r12 = nil
        end
        if r12
          r0 = r12
        else
          i22, s22 = index, []
          r23 = _nt_digits
          s22 << r23
          if r23
            if input.index('e', index) == index
              r24 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure('e')
              r24 = nil
            end
            s22 << r24
            if r24
              if input.index(Regexp.new('[-+]'), index) == index
                r25 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                r25 = nil
              end
              s22 << r25
              if r25
                r26 = _nt_digits
                s22 << r26
              end
            end
          end
          if s22.last
            r22 = instantiate_node(SyntaxNode,input, i22...index, s22)
            r22.extend(NumericConstant4)
          else
            self.index = i22
            r22 = nil
          end
          if r22
            r0 = r22
          else
            self.index = i0
            r0 = nil
          end
        end
      end
    end

    node_cache[:numeric_constant][start_index] = r0

    return r0
  end

  def _nt_concat_op
    start_index = index
    if node_cache[:concat_op].has_key?(index)
      cached = node_cache[:concat_op][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index('||', index) == index
      r0 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure('||')
      r0 = nil
    end

    node_cache[:concat_op][start_index] = r0

    return r0
  end

  def _nt_operator
    start_index = index
    if node_cache[:operator].has_key?(index)
      cached = node_cache[:operator][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    if input.index('||', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure('||')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if input.index(Regexp.new('[-+*<>/=~!@#%^&|`?]'), index) == index
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        r2 = nil
      end
      if r2
        r0 = r2
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:operator][start_index] = r0

    return r0
  end

  def _nt_alpha
    start_index = index
    if node_cache[:alpha].has_key?(index)
      cached = node_cache[:alpha][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      if input.index(Regexp.new('[a-zA-Z]'), index) == index
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      self.index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:alpha][start_index] = r0

    return r0
  end

  def _nt_digits
    start_index = index
    if node_cache[:digits].has_key?(index)
      cached = node_cache[:digits][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      if input.index(Regexp.new('[0-9]'), index) == index
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      self.index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:digits][start_index] = r0

    return r0
  end

  module FunctionCall0
  end

  module FunctionCall1
    def alpha
      elements[0]
    end

  end

  def _nt_function_call
    start_index = index
    if node_cache[:function_call].has_key?(index)
      cached = node_cache[:function_call][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_alpha
    s0 << r1
    if r1
      if input.index('(', index) == index
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('(')
        r2 = nil
      end
      s0 << r2
      if r2
        s3, i3 = [], index
        loop do
          i4, s4 = index, []
          i5 = index
          if input.index(')', index) == index
            r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure(')')
            r6 = nil
          end
          if r6
            r5 = nil
          else
            self.index = i5
            r5 = instantiate_node(SyntaxNode,input, index...index)
          end
          s4 << r5
          if r5
            if index < input_length
              r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("any character")
              r7 = nil
            end
            s4 << r7
          end
          if s4.last
            r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
            r4.extend(FunctionCall0)
          else
            self.index = i4
            r4 = nil
          end
          if r4
            s3 << r4
          else
            break
          end
        end
        r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
        s0 << r3
        if r3
          if input.index(')', index) == index
            r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure(')')
            r8 = nil
          end
          s0 << r8
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(FunctionCall1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:function_call][start_index] = r0

    return r0
  end

  def _nt_ws
    start_index = index
    if node_cache[:ws].has_key?(index)
      cached = node_cache[:ws][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      i1 = index
      r2 = _nt_space
      if r2
        r1 = r2
      else
        r3 = _nt_tab
        if r3
          r1 = r3
        else
          r4 = _nt_newline
          if r4
            r1 = r4
          else
            self.index = i1
            r1 = nil
          end
        end
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      self.index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:ws][start_index] = r0

    return r0
  end

  def _nt_space
    start_index = index
    if node_cache[:space].has_key?(index)
      cached = node_cache[:space][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index(' ', index) == index
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure(' ')
      r0 = nil
    end

    node_cache[:space][start_index] = r0

    return r0
  end

  def _nt_newline
    start_index = index
    if node_cache[:newline].has_key?(index)
      cached = node_cache[:newline][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index("\n", index) == index
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure("\n")
      r0 = nil
    end

    node_cache[:newline][start_index] = r0

    return r0
  end

  def _nt_tab
    start_index = index
    if node_cache[:tab].has_key?(index)
      cached = node_cache[:tab][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index("\t", index) == index
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure("\t")
      r0 = nil
    end

    node_cache[:tab][start_index] = r0

    return r0
  end

  def _nt_semic
    start_index = index
    if node_cache[:semic].has_key?(index)
      cached = node_cache[:semic][index]
      @index = cached.interval.end if cached
      return cached
    end

    if input.index(';', index) == index
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure(';')
      r0 = nil
    end

    node_cache[:semic][start_index] = r0

    return r0
  end

end

class SqlParser < Treetop::Runtime::CompiledParser
  include Sql
end

