# Autogenerated from a Treetop grammar. Edits may be lost.


module Pratt
	module Dsl
   include Treetop::Runtime

   def root
     @root ||= :sentence
   end

   module Sentence0
     def conjunction
       elements[0]
     end

     def fragment
       elements[1]
     end
   end

   module Sentence1
     def fragment
       elements[0]
     end

     def conjoined_fragments
       elements[1]
     end

     def period
       elements[2]
     end
   end

   module Sentence2
     def fragments
       [fragment] + conjoined_fragments.elements.collect {|frag| frag.fragment }
     end
   end

   def _nt_sentence
     start_index = index
     if node_cache[:sentence].has_key?(index)
       cached = node_cache[:sentence][index]
       if cached
         cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
         @index = cached.interval.end
       end
       return cached
     end

     i0, s0 = index, []
     r1 = _nt_fragment
     s0 << r1
     if r1
       s2, i2 = [], index
       loop do
         i3, s3 = index, []
         r4 = _nt_conjunction
         s3 << r4
         if r4
           r5 = _nt_fragment
           s3 << r5
         end
         if s3.last
           r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
           r3.extend(Sentence0)
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
       if r2
         r6 = _nt_period
         s0 << r6
       end
     end
     if s0.last
       r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
       r0.extend(Sentence1)
       r0.extend(Sentence2)
     else
       @index = i0
       r0 = nil
     end

     node_cache[:sentence][start_index] = r0

     r0
   end

   module Fragment0
     def verb
       elements[0]
     end

     def space1
       elements[1]
     end

     def noun
       elements[2]
     end

     def space2
       elements[3]
     end

     def temporal
       elements[4]
     end
   end

   module Fragment1
     def to_s
       text_value
     end
   end

   def _nt_fragment
     start_index = index
     if node_cache[:fragment].has_key?(index)
       cached = node_cache[:fragment][index]
       if cached
         cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
         @index = cached.interval.end
       end
       return cached
     end

     i0, s0 = index, []
     r1 = _nt_verb
     s0 << r1
     if r1
       r2 = _nt_space
       s0 << r2
       if r2
         r3 = _nt_noun
         s0 << r3
         if r3
           r4 = _nt_space
           s0 << r4
           if r4
             r5 = _nt_temporal
             s0 << r5
           end
         end
       end
     end
     if s0.last
       r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
       r0.extend(Fragment0)
       r0.extend(Fragment1)
     else
       @index = i0
       r0 = nil
     end

     node_cache[:fragment][start_index] = r0

     r0
   end

   def _nt_verb
     start_index = index
     if node_cache[:verb].has_key?(index)
       cached = node_cache[:verb][index]
       if cached
         cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
         @index = cached.interval.end
       end
       return cached
     end

     i0 = index
     if has_terminal?('begin', false, index)
       r1 = instantiate_node(SyntaxNode,input, index...(index + 5))
       @index += 5
     else
       terminal_parse_failure('begin')
       r1 = nil
     end
     if r1
       r0 = r1
       r0.extend(OrmMethods)
     else
       if has_terminal?('Begin', false, index)
         r2 = instantiate_node(SyntaxNode,input, index...(index + 5))
         @index += 5
       else
         terminal_parse_failure('Begin')
         r2 = nil
       end
       if r2
         r0 = r2
         r0.extend(OrmMethods)
       else
         if has_terminal?('start', false, index)
           r3 = instantiate_node(SyntaxNode,input, index...(index + 5))
           @index += 5
         else
           terminal_parse_failure('start')
           r3 = nil
         end
         if r3
           r0 = r3
           r0.extend(OrmMethods)
         else
           if has_terminal?('Start', false, index)
             r4 = instantiate_node(SyntaxNode,input, index...(index + 5))
             @index += 5
           else
             terminal_parse_failure('Start')
             r4 = nil
           end
           if r4
             r0 = r4
             r0.extend(OrmMethods)
           else
             if has_terminal?('restart', false, index)
               r5 = instantiate_node(SyntaxNode,input, index...(index + 7))
               @index += 7
             else
               terminal_parse_failure('restart')
               r5 = nil
             end
             if r5
               r0 = r5
               r0.extend(OrmMethods)
             else
               if has_terminal?('Restart', false, index)
                 r6 = instantiate_node(SyntaxNode,input, index...(index + 7))
                 @index += 7
               else
                 terminal_parse_failure('Restart')
                 r6 = nil
               end
               if r6
                 r0 = r6
                 r0.extend(OrmMethods)
               else
                 if has_terminal?('cease', false, index)
                   r7 = instantiate_node(SyntaxNode,input, index...(index + 5))
                   @index += 5
                 else
                   terminal_parse_failure('cease')
                   r7 = nil
                 end
                 if r7
                   r0 = r7
                   r0.extend(OrmMethods)
                 else
                   if has_terminal?('Cease', false, index)
                     r8 = instantiate_node(SyntaxNode,input, index...(index + 5))
                     @index += 5
                   else
                     terminal_parse_failure('Cease')
                     r8 = nil
                   end
                   if r8
                     r0 = r8
                     r0.extend(OrmMethods)
                   else
                     if has_terminal?('end', false, index)
                       r9 = instantiate_node(SyntaxNode,input, index...(index + 3))
                       @index += 3
                     else
                       terminal_parse_failure('end')
                       r9 = nil
                     end
                     if r9
                       r0 = r9
                       r0.extend(OrmMethods)
                     else
                       if has_terminal?('End', false, index)
                         r10 = instantiate_node(SyntaxNode,input, index...(index + 3))
                         @index += 3
                       else
                         terminal_parse_failure('End')
                         r10 = nil
                       end
                       if r10
                         r0 = r10
                         r0.extend(OrmMethods)
                       else
                         @index = i0
                         r0 = nil
                       end
                     end
                   end
                 end
               end
             end
           end
         end
       end
     end

     node_cache[:verb][start_index] = r0

     r0
   end

   module Noun0
   end

   def _nt_noun
     start_index = index
     if node_cache[:noun].has_key?(index)
       cached = node_cache[:noun][index]
       if cached
         cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
         @index = cached.interval.end
       end
       return cached
     end

     s0, i0 = [], index
     loop do
       i1, s1 = index, []
       i2 = index
       r3 = _nt_space
       if r3
         r2 = nil
       else
         @index = i2
         r2 = instantiate_node(SyntaxNode,input, index...index)
       end
       s1 << r2
       if r2
         if index < input_length
           r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
           @index += 1
         else
           terminal_parse_failure("any character")
           r4 = nil
         end
         s1 << r4
       end
       if s1.last
         r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
         r1.extend(Noun0)
       else
         @index = i1
         r1 = nil
       end
       if r1
         s0 << r1
       else
         break
       end
     end
     if s0.empty?
       @index = i0
       r0 = nil
     else
       r0 = instantiate_node(OrmModel,input, i0...index, s0)
     end

     node_cache[:noun][start_index] = r0

     r0
   end

   module Temporal0
     def preposition
       elements[0]
     end

     def space
       elements[1]
     end

     def literal
       elements[2]
     end
   end

   def _nt_temporal
     start_index = index
     if node_cache[:temporal].has_key?(index)
       cached = node_cache[:temporal][index]
       if cached
         cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
         @index = cached.interval.end
       end
       return cached
     end

     i0, s0 = index, []
     r1 = _nt_preposition
     s0 << r1
     if r1
       r2 = _nt_space
       s0 << r2
       if r2
         r3 = _nt_literal
         s0 << r3
       end
     end
     if s0.last
       r0 = instantiate_node(TemporalValue,input, i0...index, s0)
       r0.extend(Temporal0)
     else
       @index = i0
       r0 = nil
     end

     node_cache[:temporal][start_index] = r0

     r0
   end

   module Literal0
   end

   module Literal1
   end

   def _nt_literal
     start_index = index
     if node_cache[:literal].has_key?(index)
       cached = node_cache[:literal][index]
       if cached
         cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
         @index = cached.interval.end
       end
       return cached
     end

     i0 = index
     s1, i1 = [], index
     loop do
       i2, s2 = index, []
       i3 = index
       r4 = _nt_meaningless_conjunction
       if r4
         r3 = nil
       else
         @index = i3
         r3 = instantiate_node(SyntaxNode,input, index...index)
       end
       s2 << r3
       if r3
         i5 = index
         r6 = _nt_conjunction
         if r6
           r5 = nil
         else
           @index = i5
           r5 = instantiate_node(SyntaxNode,input, index...index)
         end
         s2 << r5
         if r5
           i7 = index
           r8 = _nt_period
           if r8
             r7 = nil
           else
             @index = i7
             r7 = instantiate_node(SyntaxNode,input, index...index)
           end
           s2 << r7
           if r7
             if index < input_length
               r9 = instantiate_node(SyntaxNode,input, index...(index + 1))
               @index += 1
             else
               terminal_parse_failure("any character")
               r9 = nil
             end
             s2 << r9
           end
         end
       end
       if s2.last
         r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
         r2.extend(Literal0)
       else
         @index = i2
         r2 = nil
       end
       if r2
         s1 << r2
       else
         break
       end
     end
     if s1.empty?
       @index = i1
       r1 = nil
     else
       r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
     end
     if r1
       r0 = r1
     else
       s10, i10 = [], index
       loop do
         i11, s11 = index, []
         i12 = index
         r13 = _nt_meaningless_conjunction
         if r13
           r12 = nil
         else
           @index = i12
           r12 = instantiate_node(SyntaxNode,input, index...index)
         end
         s11 << r12
         if r12
           i14 = index
           r15 = _nt_period
           if r15
             r14 = nil
           else
             @index = i14
             r14 = instantiate_node(SyntaxNode,input, index...index)
           end
           s11 << r14
           if r14
             if index < input_length
               r16 = instantiate_node(SyntaxNode,input, index...(index + 1))
               @index += 1
             else
               terminal_parse_failure("any character")
               r16 = nil
             end
             s11 << r16
           end
         end
         if s11.last
           r11 = instantiate_node(SyntaxNode,input, i11...index, s11)
           r11.extend(Literal1)
         else
           @index = i11
           r11 = nil
         end
         if r11
           s10 << r11
         else
           break
         end
       end
       if s10.empty?
         @index = i10
         r10 = nil
       else
         r10 = instantiate_node(SyntaxNode,input, i10...index, s10)
       end
       if r10
         r0 = r10
       else
         @index = i0
         r0 = nil
       end
     end

     node_cache[:literal][start_index] = r0

     r0
   end

   module MorningREvening0
   end

   def _nt_morning_r_evening
     start_index = index
     if node_cache[:morning_r_evening].has_key?(index)
       cached = node_cache[:morning_r_evening][index]
       if cached
         cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
         @index = cached.interval.end
       end
       return cached
     end

     i0, s0 = index, []
     i1 = index
     if has_terminal?('\G[aA]', true, index)
       r2 = true
       @index += 1
     else
       r2 = nil
     end
     if r2
       r1 = r2
     else
       if has_terminal?('\G[pP]', true, index)
         r3 = true
         @index += 1
       else
         r3 = nil
       end
       if r3
         r1 = r3
       else
         @index = i1
         r1 = nil
       end
     end
     s0 << r1
     if r1
       if has_terminal?('\G[mM]', true, index)
         r4 = true
         @index += 1
       else
         r4 = nil
       end
       s0 << r4
     end
     if s0.last
       r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
       r0.extend(MorningREvening0)
     else
       @index = i0
       r0 = nil
     end

     node_cache[:morning_r_evening][start_index] = r0

     r0
   end

   def _nt_preposition
     start_index = index
     if node_cache[:preposition].has_key?(index)
       cached = node_cache[:preposition][index]
       if cached
         cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
         @index = cached.interval.end
       end
       return cached
     end

     i0 = index
     if has_terminal?('on', false, index)
       r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
       @index += 2
     else
       terminal_parse_failure('on')
       r1 = nil
     end
     if r1
       r0 = r1
     else
       if has_terminal?('at', false, index)
         r2 = instantiate_node(SyntaxNode,input, index...(index + 2))
         @index += 2
       else
         terminal_parse_failure('at')
         r2 = nil
       end
       if r2
         r0 = r2
       else
         @index = i0
         r0 = nil
       end
     end

     node_cache[:preposition][start_index] = r0

     r0
   end

   def _nt_conjunction
     start_index = index
     if node_cache[:conjunction].has_key?(index)
       cached = node_cache[:conjunction][index]
       if cached
         cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
         @index = cached.interval.end
       end
       return cached
     end

     r0 = _nt_continuation

     node_cache[:conjunction][start_index] = r0

     r0
   end

   module Continuation0
     def space
       elements[0]
     end

   end

   module Continuation1
     def comma
       elements[0]
     end

     def space
       elements[1]
     end

   end

   module Continuation2
     def space
       elements[1]
     end
   end

   def _nt_continuation
     start_index = index
     if node_cache[:continuation].has_key?(index)
       cached = node_cache[:continuation][index]
       if cached
         cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
         @index = cached.interval.end
       end
       return cached
     end

     i0, s0 = index, []
     i1 = index
     i2, s2 = index, []
     r3 = _nt_space
     s2 << r3
     if r3
       if has_terminal?('and', false, index)
         r4 = instantiate_node(SyntaxNode,input, index...(index + 3))
         @index += 3
       else
         terminal_parse_failure('and')
         r4 = nil
       end
       s2 << r4
     end
     if s2.last
       r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
       r2.extend(Continuation0)
     else
       @index = i2
       r2 = nil
     end
     if r2
       r1 = r2
     else
       i5, s5 = index, []
       r6 = _nt_comma
       s5 << r6
       if r6
         r7 = _nt_space
         s5 << r7
         if r7
           if has_terminal?('and', false, index)
             r8 = instantiate_node(SyntaxNode,input, index...(index + 3))
             @index += 3
           else
             terminal_parse_failure('and')
             r8 = nil
           end
           s5 << r8
         end
       end
       if s5.last
         r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
         r5.extend(Continuation1)
       else
         @index = i5
         r5 = nil
       end
       if r5
         r1 = r5
       else
         r9 = _nt_comma
         if r9
           r1 = r9
         else
           @index = i1
           r1 = nil
         end
       end
     end
     s0 << r1
     if r1
       r10 = _nt_space
       s0 << r10
     end
     if s0.last
       r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
       r0.extend(Continuation2)
     else
       @index = i0
       r0 = nil
     end

     node_cache[:continuation][start_index] = r0

     r0
   end

   def _nt_meaningless_conjunction
     start_index = index
     if node_cache[:meaningless_conjunction].has_key?(index)
       cached = node_cache[:meaningless_conjunction][index]
       if cached
         cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
         @index = cached.interval.end
       end
       return cached
     end

     if has_terminal?('or', false, index)
       r0 = instantiate_node(SyntaxNode,input, index...(index + 2))
       @index += 2
     else
       terminal_parse_failure('or')
       r0 = nil
     end

     node_cache[:meaningless_conjunction][start_index] = r0

     r0
   end

   def _nt_space
     start_index = index
     if node_cache[:space].has_key?(index)
       cached = node_cache[:space][index]
       if cached
         cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
         @index = cached.interval.end
       end
       return cached
     end

     if has_terminal?(' ', false, index)
       r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
       @index += 1
     else
       terminal_parse_failure(' ')
       r0 = nil
     end

     node_cache[:space][start_index] = r0

     r0
   end

   def _nt_comma
     start_index = index
     if node_cache[:comma].has_key?(index)
       cached = node_cache[:comma][index]
       if cached
         cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
         @index = cached.interval.end
       end
       return cached
     end

     if has_terminal?(',', false, index)
       r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
       @index += 1
     else
       terminal_parse_failure(',')
       r0 = nil
     end

     node_cache[:comma][start_index] = r0

     r0
   end

   def _nt_period
     start_index = index
     if node_cache[:period].has_key?(index)
       cached = node_cache[:period][index]
       if cached
         cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
         @index = cached.interval.end
       end
       return cached
     end

     if has_terminal?('.', false, index)
       r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
       @index += 1
     else
       terminal_parse_failure('.')
       r0 = nil
     end

     node_cache[:period][start_index] = r0

     r0
   end

 end

 class DslParser < Treetop::Runtime::CompiledParser
   include Dsl
 end

end
