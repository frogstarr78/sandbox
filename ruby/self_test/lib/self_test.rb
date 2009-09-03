$LOAD_PATH << File.join( File.dirname(__FILE__) )
#require 'test/unit'
#require 'test/unit/assertions'
require 'base/boolean_classes'

TrueClass.send :include, SelfTest::TrueClass
FalseClass.send :include, SelfTest::FalseClass
#class Test::Unit::TestCase
#end

module SelfTest
  VERSION = '1.0.0'

#  class Symbol
    
    base_positive_methods = {
      :does?        => :assert_block,
      :equal?       => :assert_equal,
      :in_delta?    => :assert_in_delta,
      :instance_of? => :assert_instance_of,
      :kind_of?     => :assert_kind_of,
      :match?       => :assert_match,
      :nil?         => :assert_nil,
      :operator?    => :assert_operator,
      :raise?       => :assert_raise,
      :respond_to?  => :assert_respond_to,
      :same?        => :assert_same,
      :send?        => :assert_send,
      :throws?      => :assert_throws,
      :true?        => :assert
    }

    extended_positive_methods = {
      :includes? => proc do
        puts self.class 
      end,
      :responds_to? => proc do
        puts self.class 
      end
    } 

    def includes? a_module
      self.class.included_modules.include? a_module
    end

    def responds_to? message
      assert_respond_to self, message
    end

    def should do_something
      return self.instance_eval do
        do_something
      end
    end

    positive_methods = base_positive_methods.merge! extended_positive_methods

    positive_methods.each do |assertion, method|
    end

    base_negative_methods = {
      :no_match?       => :assert_no_match,
      :not_equal?      => :assert_not_equal,
      :nothing_raised? => :assert_nothing_raised,
      :nothing_thrown? => :assert_nothing_thrown,
      :not_nil?        => :assert_not_nil,
      :not_same?       => :assert_not_same
    }

    extended_negative_methods = {
    
    }

    negative_methods = base_negative_methods.merge! extended_negative_methods

    negative_methods.each do |assertion, method|
    end

    helper_methods = {
      :build_message! => :build_message,
      :flunk!         => :flunk
    }

    helper_methods.each do |assertion, method|
    end
#  end
end


