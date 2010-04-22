require 'rubygems'
require 'shoulda'
require 'treetop'
require 'pratt_dsl_orm'


Treetop.load "pratt_dsl"

class Pratt::DslTest < Test::Unit::TestCase
  context Pratt::DslParser do
    setup do
      @parser = Pratt::DslParser.new
    end

    context 'handles verbs as expected' do
      good_verbs = %w(begin start restart cease end)
      good_verbs | good_verbs.collect(&:capitalize)
      bad_verbs = %w(eat Eat)

      def phrase verb
        "#{verb} Lunch/Break at 12:00."
      end

      good_verbs.each do |verb|
        should "parse sentence with expected verb '#{verb}'" do
          parsed = @parser.parse(phrase(verb))
          assert parsed
          assert_equal phrase(verb).chomp("."), parsed.fragments.first.to_s
        end
      end

      bad_verbs.each do |verb|
        should "not parse sentence with unexpected verb '#{verb}'" do
          parsed = @parser.parse(phrase(verb))
          assert !parsed
        end
      end
    end

    context "fragments" do
      sentences = [
        'begin Lunch/Break at 12:00.',
        'Start Lunch/Break at 12:00 pm and end Lunch/Break at 1:00 am.',
        'End Lunch/Break at 1:00 am, Start Something at 1:00 pm, and end something at 1:00 pm.',
      ].each_with_index do |sentence, index|
          should "parse sentence #{sentence}" do
            parsed = @parser.parse(sentence)
            assert parsed
            assert index+1, parsed.fragments.to_a.size
          end
      end

      should "parse the fragments that we'd expect to find" do
        assert_equal ['begin Lunch/Break at 12:00'], @parser.parse(sentences.first).fragments.to_a.collect(&:to_s)
        assert_equal ['Start Lunch/Break at 12:00 pm', 'end Lunch/Break at 1:00 am'], @parser.parse(sentences[1]).fragments.to_a.collect(&:to_s)
        assert_equal ['End Lunch/Break at 1:00 am', 'Start Something at 1:00 pm', 'end something at 1:00 pm'], @parser.parse(sentences.last).fragments.to_a.collect(&:to_s)
      end
    end

    context "parses fragments into their sub-parts" do
      setup do
        @sentence = 'begin Lunch/Break at 12:00.'
        @parsed = @parser.parse @sentence
        @fragments = @parsed.fragments.to_a
        @fragment = @fragments.first
      end

      should "have a fragment" #do
#        assert_equal 1, @fragments.size
#        assert_kind_of Treetop::Runtime::SyntaxNode, @fragment
#      end

      should "produce a method based on the verb" # do
#        puts @fragment.inspect
#        assert_equal :begin, @fragment.verb
#        assert_respond_to @fragment.project, @fragment.method
#      end

      should "produce an orm object" # do
#      end

      should "produce a temporal argument to the method" # do
#      end
    end

#    # TODO: Make or conjunction usless or find a use for it
##    context "doesn't parse sentences with 'or' conjunctions in them" do
##        sentence = 'begin Lunch/Break at 12:00 or end Lunch/Break at 1:00.'
##        should "not parse #{sentence}" do
##          parsed = @parser.parse(sentence)
##          assert !parsed
##        end
##    end

#    context "objects" do
##      setup do
##        @plain_sentence = 'Start Lunch/Break at 12:00 pm and end Lunch/Break at 1:00.'
##        @parsed = @parser.parse(@plain_sentence)
##        assert @parsed
##        @fragment = @parsed.fragments.to_a.first
##      end
#
##      should "return string when calling to_s" do
##        assert_equal 'Start Lunch/Break at 12:00', @fragment.to_s
##      end
#
##      should "find project based on noun" do
##        assert_kind_of Project, @fragment.project
##        assert_equal 2, @parsed.fragments.to_a.size
##        assert_equal 'Start Lunch/Break at 12:00', @parsed.fragments.to_a[0].to_s
##        assert_equal 'end Lunch/Break at 1:00', @parsed.fragments.to_a[1].to_s
##      end
#
##      should "find method based on verb" do
##        assert_equal @fragment.verb.text_value.downcase.to_sym, @fragment.method
##        assert_kind_of Symbol, @fragment.method
##        assert_respond_to @fragment.project, @fragment.method
##      end
#    end

#    context "temporal_value" do
#      setup do
#        @plain_sentence = 'Start Lunch/Break at 12:00 pm and end Lunch/Break at 1:00.'
#        @parsed = @parser.parse(@plain_sentence)
#        assert @parsed
#        @fragment = @parsed.fragments.to_a.first
#      end
#
#      should "find the time" do
#        assert_equal Chronic.parse("12:00 pm"), @fragment.time
#      end
#    end

  end
end
