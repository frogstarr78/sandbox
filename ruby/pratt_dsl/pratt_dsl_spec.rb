require 'spec'
require 'mocha'
require 'treetop'
require 'pratt_dsl_orm'

Spec::Runner.configure do |config|
  config.mock_with :mocha
end

module Pratt
  class DslSpec
  end
end
Treetop.load "pratt_dsl"

describe Pratt::DslSpec do
  before :each do 
    @parser = Pratt::DslParser.new
  end

  describe 'handles verbs as expected' do
    good_verbs = %w(begin start restart cease end)
    good_verbs | good_verbs.collect(&:capitalize)
    bad_verbs = %w(eat Eat)

    def phrase verb
      "#{verb} Lunch/Break at 12:00."
    end

    good_verbs.each do |verb|
      it "parse sentence with expected verb '#{verb}'" do
        parsed = @parser.parse(phrase(verb))
        parsed.should_not be(nil)
        parsed.fragments.first.to_s.should eql(phrase(verb).chomp("."))
      end
    end

    bad_verbs.each do |verb|
      it "not parse sentence with unexpected verb '#{verb}'" do
        parsed = @parser.parse(phrase(verb))
        parsed.should be_nil
      end
    end
  end
end
