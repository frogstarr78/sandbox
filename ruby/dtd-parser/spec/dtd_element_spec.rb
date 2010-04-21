#!/usr/bin/env ruby

describe DTD::Element do
	describe 'elements' do
		it "should parse empty defined element" do
		  @parser.parse('<!ELEMENT name EMPTY>').should be_a(Treetop::Runtime::SyntaxNode)
		end
		it "should parse element allowing ANY" do
		  @parser.parse('<!ELEMENT node ANY>').should be_a(Treetop::Runtime::SyntaxNode)
		end

		it "should parse element with PCDATA" do
		  @parser.parse('<!ELEMENT node (#PCDATA)>').should be_a(Treetop::Runtime::SyntaxNode)
		end

		it "should parse element with CDATA" do
		  @parser.parse('<!ELEMENT node (#CDATA)>').should be_a(Treetop::Runtime::SyntaxNode)
		end

		it "should parse an element with a child" do
		  @parser.parse('<!ELEMENT node (child)>').should be_a(Treetop::Runtime::SyntaxNode)
		end

		it "should parse an element with children" do
		  @parser.parse('<!ELEMENT node (child1, child2)>').should be_a(Treetop::Runtime::SyntaxNode)
		end

		it "should parse an element with children and cardinality" do
		  @parser.parse('<!ELEMENT node (child1, child2* | child3+)>').should be_a(Treetop::Runtime::SyntaxNode)
		end

		it "should parse an element with children and nested groups" do
		  @parser.parse('<!ELEMENT node (child1, child2*, ( child3+, child4 ), child5* )>').should be_a(Treetop::Runtime::SyntaxNode)
		end
	end
end
