require 'rubygems'
require 'shoulda'
require 'treetop'
require 'pratt_dsl_orm'


Treetop.load "pratt_dsl"

class PrattDslTest < Test::Unit::TestCase
  context PrattDslParser do
    setup do
      @parser = PrattDslParser.new
    end

    context 'simple sentences beginning with some expected verbs' do
      sentences = [
        'begin Lunch/Break at 12:00.',
        'Begin Lunch/Break at 12:00.',
        'start Lunch/Break at 12:00.',
        'Start Lunch/Break at 12:00.',
        'restart Lunch/Break at 12:00.',
        'Restart Lunch/Break at 12:00.',
        'cease Lunch/Break at 12:00.',
        'Cease Lunch/Break at 12:00.',
        'end Lunch/Break at 12:00.',
        'End Lunch/Break at 12:00.',
      ].each do |sentence|
        should "parse sentence #{sentence}" do
          assert @parser.parse(sentence)
        end
      end
    end

    context 'simple sentences with conjuctions' do
      sentences = [
        'begin Lunch/Break at 12:00 and end Lunch/Break at 1:00.',
        'Begin Lunch/Break at 12:00 and End Lunch/Break at 1:00.',
      ].each do |sentence|
        should "parse sentence #{sentence}" do
          parsed = @parser.parse(sentence)
          assert parsed
          assert_kind_of Project, parsed.fragment.project
        end
      end
    end

    context "doesn't parse sentences with or in them" do
        sentence = 'begin Lunch/Break at 12:00 or end Lunch/Break at 1:00.'
        should "not parse #{sentence}" do
          assert !@parser.parse(sentence)
        end
    end
  end
end
