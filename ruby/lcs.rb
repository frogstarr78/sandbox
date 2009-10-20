require 'diff/lcs'
require 'pp'
require 'colored'
require 'test/unit'
require 'test/unit/assertions'

class MyTest < Test::Unit::TestCase
  def assert_equal_diffs string1, string2
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

  def cc char, color, add_space = true
    char.send(color) << (add_space ? ' ' : '')
  end

  def test_my_failing_message
    seq1 = %w(a b c e h j l \  m n p) 
    seq2 = %w(b c d e f j k l m r s t) 
    begin
      assert_equal_diffs seq1, seq2
    rescue Test::Unit::AssertionFailedError => received
      expected = cc(' ', :red) << cc('b', :white) << cc('c', :white) << cc('d', :green) << cc('e', :white) << cc('f', :magenta) << cc('j', :white) << cc('k', :green) << cc('l', :white) << cc(' ', :red) << cc('m', :white) << cc('r', :magenta) << cc('s', :magenta) << cc('t', :green, false) << "\n" <<
                 cc('-', :red) << cc(' ', :white) << cc(' ', :white) << cc('+', :green) << cc(' ', :white) << cc('!', :magenta) << cc(' ', :white) << cc('+', :green) << cc(' ', :white) << cc('-', :red) << cc(' ', :white) << cc('!', :magenta) << cc('!', :magenta) << cc('+', :green, false) << "\n" << 
                 cc('a', :red) << cc('b', :white) << cc('c', :white) << cc(' ', :green) << cc('e', :white) << cc('h', :magenta) << cc('j', :white) << cc(' ', :green) << cc('l', :white) << cc(' ', :red) << cc('m', :white) << cc('n', :magenta) << cc('p', :magenta) << cc(' ', :green, false)
      assert_equal expected, received.message
    end
  end

  def test_me_failing_again
    seq1 = %w(a b c e h j l \  m n p) 
    seq2 = %w(b c d e f j k l m r s t) 
    assert_raises Test::Unit::AssertionFailedError do
      assert_equal_diffs seq1, seq2
    end
  end

  def test_no_passing
    seq1 = %w(a b c e h j l \  m n p) 
    seq2 = %w(a b c e h j l \  m n p) 
    assert_nothing_raised {
      assert_equal_diffs seq1, seq2
    }
  end
end
