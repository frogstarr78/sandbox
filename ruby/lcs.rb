require 'diff/lcs'
require 'pp'
require 'colored'
require 'test/unit'
require 'test/unit/assertions'

module TestWithLCS
  @@colorize = true

  def self.included in_class
    in_class.class.send :define_method, :colorize do
      @@colorize || true
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

class MyTest < Test::Unit::TestCase
  include TestWithLCS

  def assert_equal_diffs string1, string2
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

  def test_my_failing_message
    seq1 = %w(a b c e h j l \  m n p) 
    seq2 = %w(b c d e f j k l m r s t) 
    begin
      assert_equal_diffs seq1, seq2
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
      assert_equal_diffs seq1, seq2
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

  def test_string_lcs_array
    # though the underlying library supports it,
    # we don't want to allow that kind of messiness 
    # in our testing framework.
    seq1 = %q(abcehjl mnp) 
    seq2 = %w(a b c e h j l \  m n p) 
    assert_raises Test::Unit::AssertionFailedError do
      assert_equal_diffs seq1, seq2
    end
  end
end


require 'spec'

Spec::Runner.configure do |config|
#  config.mock_with :rspec
  config.mock_with :mocha
end

Spec::Matchers.define :be_formatted_as do |string2|
  @string2 = string2
  match do |string1|
    @string1 = string1
    string1 == string2
  end
  
  failure_message_for_should do |string2|
    message_array = []
    Diff::LCS.sdiff(@string1, @string2) do |diff| 
      action = diff.action == '=' ? ' ' : diff.action
      case action
      when '-'
        color  = :red
      when '+'
        color  = :green
      when '!'
        color  = :magenta
      else
        color  = :white
      end
      left   = diff.new_element || ' '
      right  = diff.old_element || ' '
      message_array << [left, action, right].map {|thing| thing.send(color) }
    end
    message_diffs = message_array.transpose

    message = message_diffs.map {|diff| diff.join ' ' }.join "\n"
  end
  
  description do
    # generate and return the appropriate string.
    'descript'
  end
end

describe "Spec" do
  it "passes" do
    'actual'.should be_formatted_as('actual')
  end

  it "get's correct output" do
#    proc { raise StandardError.new("what is an enterprise?") }.should raise_error(StandardError, "not this")
    lambda{ 
      'actual'.should be_formatted_as('something else so this test will fail and we can test the resulting string')
    }.should == 'this'
#    }.should raise_error()
  end
end
