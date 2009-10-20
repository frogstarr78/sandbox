require 'diff/lcs'
require 'pp'
require 'colored'
require 'test/unit'
require 'test/unit/assertions'

seq1 = %w(a b c e h j l m n p) 
seq2 = %w(b c d e f j k l m r s t) 

puts seq1.inspect, seq2.inspect

lcs = Diff::LCS.LCS(seq1, seq2) 
puts 'lcs ' << lcs.inspect
diffs = Diff::LCS.diff(seq1, seq2) 
#puts 'diffs ' << diffs.inspect
sdiff = Diff::LCS.sdiff(seq1, seq2) 
#puts 'sdiff ' << sdiff.inspect

puts '-'*10
r = []
Diff::LCS.sdiff(seq1, seq2) {|diff| 
  action = diff.action == '=' ? ' ' : diff.action
  color  = action == '-' ? :red : :green
  left   = diff.new_element || ' '
  right  = diff.old_element || ' '
  r << [left.send(color), action, right.send(color)]
}
puts r.inspect
t = r.transpose
puts t.inspect

puts '-'*10
puts t[1]*' '
puts (t[0])*' '
puts (t[2])*' '
puts '-'*10
#t.each {|row|
#  puts row * ' '
#}

[
  %w(a b c e h j l m n p),
  %w(b c d e f j k l m r s t) 
]
puts %q(
+     -   !   -   *
a b c   e h j   l m n p
  b c d e f j k l m r s t
-     +   !   +   *
)

#include Test::Unit::Assertions

class MyTest < Test::Unit::TestCase
  def assert_equal_diffs string1, string2
    if string1 != string2
      message_array = []
      Diff::LCS.sdiff(string1, string2) {|diff| 
        action = diff.action == '=' ? ' ' : diff.action
        case action
        when '-'
          color  = :red
        when '+'
          color  = :green
        when '!'
          color = :magenta
        else
          color  = :white
        end
        left   = diff.new_element || ' '
        right  = diff.old_element || ' '
        message_array << [left, action, right].map {|thing| thing.send(color) }
      }
        message_diffs = message_array.transpose

      message = message_diffs.map {|diff| diff.join ' ' }.join "\n"
      assert_block message do
        string1 == string2
      end
    end
  end

  def test_me
    seq1 = %w(a b c e h j l m n p) 
    seq2 = %w(b c d e f j k l m r s t) 
    assert_equal_diffs seq1, seq2
  end
end
