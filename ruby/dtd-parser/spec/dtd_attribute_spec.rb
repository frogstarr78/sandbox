#!/usr/bin/env ruby

module DTD
	describe Attribute do
		describe "parsing attribute list declarations" do
			it "parses ids" do
			  @parser.parse('<!ATTLIST img id ID #REQUIRED>').should be_a(Treetop::Runtime::SyntaxNode)
			end
		end
	end
end
