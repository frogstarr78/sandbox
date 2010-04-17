require 'rubygems'
require 'shoulda'
require 'treetop'


Treetop.load "example"

class ExampleTest < Test::Unit::TestCase
  context ExampleParser do
    setup do
      @parser = ExampleParser.new
    end

    should "parse a character" do
      parsed = @parser.parse 'a.'
      assert parsed
      puts parsed.inspect
#      puts parsed.labels.inspect
#      puts parsed.letters.inspect
#      puts parsed.chars.inspect
#      puts parsed.inspect
      assert_equal %w(a), parsed.letters
#      assert_kind_of Treetop::Runtime::SyntaxNode, parsed.chars
    end

    should "parse comma seperated list" do
      parsed = @parser.parse 'a, b, c.'
      assert parsed
#      puts parsed.labels.inspect
#      puts parsed.letters.inspect
#      puts parsed.chars.inspect
#      puts parsed.inspect
#      assert_equal %w(a b c), parsed.letters
#      assert_kind_of Treetop::Runtime::SyntaxNode, parsed.chars
    end
  end
end
