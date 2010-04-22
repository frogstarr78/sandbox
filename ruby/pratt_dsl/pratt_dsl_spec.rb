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
        parsed.should_not be_nil
        interesting_fragment = parsed.fragments.first
        interesting_fragment.to_s.should eql(phrase(verb).chomp("."))
        interesting_fragment.verb.to_s.should eql(verb.downcase)
        interesting_fragment.noun.to_s.should eql('Lunch/Break')
        interesting_fragment.temporal.value.should eql(Chronic.parse('12:00'))
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
