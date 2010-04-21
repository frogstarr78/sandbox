#!/usr/bin/env ruby

require 'test/unit'
#require 'test/unit/ui/tk/testrunner'
require 'rubygems'
require 'shoulda'


class TestExample < Test::Unit::TestCase

	should "pass" do
		assert true
	end

	should "not fail" do
		assert !false
	end
end

#Test::Unit::UI::Tk::TestRunner.run TestExample
