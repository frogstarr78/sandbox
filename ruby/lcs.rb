require 'diff/lcs'
require 'pp'
require 'colored'
require 'test/unit'
require 'test/unit/assertions'

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

  def test_me_failing
    seq1 = %w(a b c e h j l m n p) 
    seq2 = %w(b c d e f j k l m r s t) 
    begin
      assert_equal_diffs seq1, seq2
    rescue Test::Unit::AssertionFailedError
    end
  end

  def test_me_failing_again
    seq1 = %w(a b c e h j l m n p) 
    seq2 = %w(b c d e f j k l m r s t) 
    assert_raises Test::Unit::AssertionFailedError do
      assert_equal_diffs seq1, seq2
    end
  end

  def test_no_passing
    seq1 = %w(a b c e h j l m n p) 
    seq2 = %w(a b c e h j l m n p) 
    assert_nothing_raised {
      assert_equal_diffs seq1, seq2
    }
  end
end
