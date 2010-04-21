require 'rubygems'
require 'shoulda'
require 'treetop'
require 'pratt_dsl_orm'


Treetop.load "pratt_dsl"

class Pratt::DslTest < Test::Unit::TestCase
  context Pratt::DslParser do
    setup do
      @parser = Pratt::DslParser.new
      @plain_sentence = 'Start Lunch/Break at 12:00 pm and end Lunch/Break at 1:00.'
    end

#    context 'simple sentences beginning with the expected verbs' do
#      sentences = [
#        'begin Lunch/Break at 12:00.',
#        'Begin Lunch/Break at 12:00.',
#        'start Lunch/Break at 12:00.',
#        'Start Lunch/Break at 12:00.',
#        'restart Lunch/Break at 12:00.',
#        'Restart Lunch/Break at 12:00.',
#        'cease Lunch/Break at 12:00.',
#        'Cease Lunch/Break at 12:00.',
#        'end Lunch/Break at 12:00.',
#        'End Lunch/Break at 12:00.',
#      ].each do |sentence|
#        should "parse sentence #{sentence}" do
#          parsed = @parser.parse(sentence)
#          assert parsed
#          assert 1, parsed.fragments.to_a.size
#        end
#      end
#    end

    context "fragments" do
      sentences = [
        'begin Lunch/Break at 12:00.',
        'Start Lunch/Break at 12:00 and end Lunch/Break at 1:00.',
        'End Lunch/Break at 13:00, Start Something at 13:00, and end something at 1:00.',
      ].each_with_index do |sentence, index|
          should "parse sentence #{sentence}" do
            parsed = @parser.parse(sentence)
            assert parsed
            assert index+1, parsed.fragments.to_a.size
          end
      end
    end

#    context 'a simple sentence beginning with an unexpected verb' do
#      sentence = 'eat Lunch/Break at 12:00.'
#      should "not parse sentence #{sentence}" do
#        parsed = @parser.parse(sentence)
#        assert !parsed
#      end
#    end
#
#    context 'simple sentences with conjuctions' do
#      sentences = [
#        'begin Lunch/Break at 12:00 and end Lunch/Break at 1:00.',
#        'Begin Lunch/Break at 12:00 and End Lunch/Break at 1:00.',
#        'begin Lunch/Break at 12:00 and End Lunch/Break at 1:00.',
#        'Begin Lunch/Break at 12:00 and end Lunch/Break at 1:00.',
#      ].each do |sentence|
#        should "parse sentence #{sentence}" do
#          parsed = @parser.parse(sentence)
#          assert parsed
#          assert_respond_to parsed, :fragments
#          assert 2, parsed.fragments.to_a.size
#        end
#      end
#    end
#
#    # TODO: Make or conjunction usless or find a use for it
##    context "doesn't parse sentences with 'or' conjunctions in them" do
##        sentence = 'begin Lunch/Break at 12:00 or end Lunch/Break at 1:00.'
##        should "not parse #{sentence}" do
##          parsed = @parser.parse(sentence)
##          assert !parsed
##        end
##    end
#
#    context "objects" do
#      setup do
#        @parsed = @parser.parse(@plain_sentence)
#        assert @parsed
#        @fragment = @parsed.fragments.to_a.first
#      end
#
#      should "return string when calling to_s" do
#        assert_equal 'Start Lunch/Break at 12:00', @fragment.to_s
#      end
#
#      should "find project based on noun" do
#        assert_kind_of Project, @fragment.project
#        assert_equal 2, @parsed.fragments.to_a.size
#        assert_equal 'Start Lunch/Break at 12:00', @parsed.fragments.to_a[0].to_s
#        assert_equal 'end Lunch/Break at 1:00', @parsed.fragments.to_a[1].to_s
#      end
#
#      should "find method based on verb" do
#        assert_equal @fragment.verb.text_value.downcase.to_sym, @fragment.method
#        assert_kind_of Symbol, @fragment.method
#        assert_respond_to @fragment.project, @fragment.method
#      end
#    end
#
##    context "temporal_value" do
##      setup do
##        @parsed = @parser.parse(@plain_sentence)
##        assert @parsed
##        @fragment = @parsed.fragments.to_a.first
##      end
##
##      should "find the time" do
##        assert_equal Chronic.parse("12:00 pm"), @fragment.time
##      end
##    end
  end
end
