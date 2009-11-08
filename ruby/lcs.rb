require 'diff/lcs'
require 'pp'
require 'colored'
require 'test/unit'
require 'test/unit/assertions'

module TestWithLCS

  module SharedMethods
    @@colorize = true
    def self.included in_class
      in_class.class.send :define_method, :colorize do
        @@colorize
      end

      in_class.class.send :define_method, :colorize= do |color|
        @@colorize = color
      end
    end

    private
      def message_for_argument_types string1, string2
        if string1.is_a? String and string2.is_a? String
          delegating_to_string_generating_method string1, string2
        elsif string1.is_a? Array and string2.is_a? Array
          lcs_message(string1, string2)
        else
          raise Test::Unit::AssertionFailedError.new("Comparing different types.")
        end
      end

    def delegating_to_string_generating_method string1, string2
      seq1 = string1.split "\n"
      seq2 = string2.split "\n"
      messages = []
      (['']*seq1.size).zip(seq1, seq2).each do |junk, line1, line2|
        messages << lcs_message("#{line1}", "#{line2}")
      end
      messages.join "\n"
    end

    def lcs_message string1, string2
      message_array = []
      Diff::LCS.sdiff string1, string2 do |diff| 
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
        message_array << [action, left, right].map {|thing| thing.send(@@colorize ? color : :to_s) }
      end
      horizontal_diff_array = message_array.transpose
      horizontal_messages = horizontal_diff_array.map {|diff| diff.join '' }
      horizontal_messages.join "\n"
    end
  end

  module Unit
    include SharedMethods
    def assert_equal_with_lcs string1, string2
      # depending on the size of the strings
      # and since we generate the error message
      # before running the assertion
      # we want to bypass this behavior for the sake of speed
      return if string1 == string2

      message = message_for_argument_types string1, string2
      assert_block message do
        string1 == string2
      end
    end
  end

  module Spec

    class BeEqualWithLCS
      include SharedMethods
      def initialize expected
        @expected = expected
      end

      def matches? target
        @target = target
        @expected == @target
      end

      def failure_message_for_should
        message_for_argument_types @expected, @target
      end

      def failure_message_for_should_not
        message_for_argument_types @expected, @target
      end
    end

    def be_equal_with_lcs expected
      BeEqualWithLCS.new expected
    end
  end
end

class MyTest < Test::Unit::TestCase
#  include TestWithLCS
  include TestWithLCS::Unit

  def test_my_failing_message
    seq1 = %w(a b c e h j l \  m n p) 
    seq2 = %w(b c d e f j k l m r s t) 
    begin
      self.class.colorize = true
      assert_equal_with_lcs seq1, seq2
    rescue Test::Unit::AssertionFailedError => received
      expected = '-'.red << ' '.white << ' '.white << '+'.green << ' '.white << '!'.magenta << ' '.white << '+'.green << ' '.white << '-'.red << ' '.white << '!'.magenta << '!'.magenta << '+'.green << "\n" << 
                 ' '.red << 'b'.white << 'c'.white << 'd'.green << 'e'.white << 'f'.magenta << 'j'.white << 'k'.green << 'l'.white << ' '.red << 'm'.white << 'r'.magenta << 's'.magenta << 't'.green << "\n" <<
                 'a'.red << 'b'.white << 'c'.white << ' '.green << 'e'.white << 'h'.magenta << 'j'.white << ' '.green << 'l'.white << ' '.red << 'm'.white << 'n'.magenta << 'p'.magenta << ' '.green
      assert_equal expected, received.message
    end
  end

  def test_my_failing_message_on_multi_line_strings
    seq1 = %Q|abce
hjl
\ mnp
q\tu
v
y
xz| 
    seq2 = %Q|bcd
efjklmr
st|
    begin
      self.class.colorize = false
      assert_equal_with_lcs seq1, seq2
    rescue Test::Unit::AssertionFailedError => received
      received_messages = received.message.split "\n"

      assert_equal '-  !',    received_messages[0]
      assert_equal ' bcd',    received_messages[1]
      assert_equal 'abce',    received_messages[2]

      assert_equal '!+ + ++', received_messages[3]
      assert_equal 'efjklmr', received_messages[4]
      assert_equal 'h j l  ', received_messages[5]

      assert_equal '!!--',    received_messages[6]
      assert_equal 'st  ',    received_messages[7] 
      assert_equal ' mnp',    received_messages[8] 

      assert_equal "---",     received_messages[9]
      assert_equal "   ",     received_messages[10]
      assert_equal "q\tu",    received_messages[11]

      assert_equal '-',       received_messages[12]
      assert_equal ' ',       received_messages[13]
      assert_equal 'v',       received_messages[14]

      assert_equal '-',       received_messages[15]
      assert_equal ' ',       received_messages[16]
      assert_equal 'y',       received_messages[17]

      assert_equal '--',      received_messages[18]
      assert_equal '  ',      received_messages[19]
      assert_equal 'xz',      received_messages[20]
    ensure
      self.class.colorize = true
    end
  end

  def test_me_failing_again
    seq1 = %w(a b c e h j l \  m n p) 
    seq2 = %w(b c d e f j k l m r s t) 
    assert_raises Test::Unit::AssertionFailedError do
      assert_equal_with_lcs seq1, seq2
    end
  end

  def test_no_passing
    seq1 = %w(a b c e h j l \  m n p) 
    seq2 = %w(a b c e h j l \  m n p) 
    assert_nothing_raised {
      assert_equal_with_lcs seq1, seq2
    }
  end

  def test_string_lcs_array
    # though the underlying library supports it,
    # we don't want to allow that kind of messiness 
    # in our testing framework.
    seq1 = %q(abcehjl mnp) 
    seq2 = %w(a b c e h j l \  m n p) 
    assert_raises Test::Unit::AssertionFailedError do
      assert_equal_with_lcs seq1, seq2
    end
  end

  def test_colorize
    assert_equal true, self.class.colorize
    self.class.colorize = false
    assert_equal false, self.class.colorize
  end
end


require 'spec'

Spec::Runner.configure do |config|
#  config.mock_with :rspec
  config.mock_with :mocha
end

describe "Spec" do
  include TestWithLCS::Spec

  it "passes" do
    'actual'.should be_equal_with_lcs('actual')
  end

  it "doesn't pass" do
    'actual'.should_not be_equal_with_lcs('something else so this test will fail and we can test the resulting string')
  end

  it "get's correct output" do
    self.class.colorize = false
    # careful of the whitespace required here.
    expected_error = "---------------------------------- ---------- --- ----------- + -----------
                                  a          c   t           ual           
something else so this test will fail and we can test the resu lting string"
    lambda{ 
      'actual'.should be_equal_with_lcs('something else so this test will fail and we can test the resulting string')
    }.should raise_error(Spec::Expectations::ExpectationNotMetError, expected_error)
  end

  it "get's correct output with multi-line string comparison" do
    self.class.colorize = false
    # careful of the whitespace required here.
    seq1 = "actual
ly
I
didn't want it all
on one
line"
    seq2 = "actually I did want it on ...
well a couple lines."

    expected_error = "      -----------------------
actual                       
actually I did want it on ...
-- !----------------
  ly                
well a couple lines."
    lambda{ 
      seq1.should be_equal_with_lcs(seq2)
    }.should raise_error(Spec::Expectations::ExpectationNotMetError, expected_error)
  end
end
