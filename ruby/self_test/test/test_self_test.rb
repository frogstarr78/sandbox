$LOAD_PATH << File.join( File.dirname(__FILE__), '..', 'lib')
require "test/unit"
require "self_test"
require 'rubygems'
require 'shoulda'

class TotalFailure
end

class FailureToInclude
  include SelfTest
end

class FailureToRespond
  include SelfTest
end

class TestSelfTest < Test::Unit::TestCase
  include SelfTest

  context "Boolean class" do
    context "True" do
      should "respond to true?" do
        assert_respond_to true, :true?
      end

      should "respond to false?" do
        assert_respond_to true, :false?
      end

      should "be true?" do
        assert true.true?
      end

      should "not be false?" do
        assert !true.false?
      end
    end

    context "False" do
      should "respond to true?" do
        assert_respond_to false, :true?
      end

      should "respond to false?" do
        assert_respond_to false, :false?
      end

      should "not be true?" do
        assert !false.true?
      end

      should "be false?" do
        assert false.false?
      end
    end
  end

  def test_false_is_false
    false.false?
  end

  def test_false_is_not_true
    !false.true?
  end

  context "I" do
    setup do
    end

    should "error when includes? is called without a module" do
      assert_raise( TypeError ) {
        self.includes? false.class
      }
    end

    should "includes? SelfTest" do
      assert_nothing_raised {
        self.includes? SelfTest
      }
    end

    should "respond_to? responds_to?" do
      self.responds_to? :responds_to?
    end
  end

  context FailureToInclude do
    should "not include? a new module" do
      FailureToInclude.new.includes? eval('module Mod; end')
    end
  end
end
