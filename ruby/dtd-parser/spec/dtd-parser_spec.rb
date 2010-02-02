#!/usr/bin/env ruby

require 'rubygems'
require 'spec'
require 'treetop'

Treetop.load "dtd"

describe DtdParser do
	before do
		@parser = DtdParser.new
	end

#	describe 'should recognize entities:' do
#		require 'treetop/runtime/syntax_node'
#
#		standard_entities = {
#			'less than'          => %w(< &#60; &lt;),
#			'greater than'       => %w(> &#62; &gt;),
#			'ampersand'          => %w(&#38; &amp;),
#			'apostrophe'         => %w(' &#39; &apos;),
#			'quote'              => %w(" &#34; &quot;),
#			'non breaking space' => %w(\  &#32; &nbsp;),
#			'emdash'             => %w(-- &#045;&#045; &mdash;),
#		}
#
#		standard_entities.each do |entity_name, entities|
#			entities.each do |entity|
#				it "'#{entity}' as a/an #{entity_name}" do
#					@parser.parse(entity).should be_a(Treetop::Runtime::SyntaxNode)
#				end
#			end
#		end
#	end

	describe "names" do
		it "shouldn't allow 'XML'" do
			@parser.parse('<!ELEMENT XML EMPTY>').should be_nil
			@parser.parse('<!ELEMENT Xml EMPTY>').should be_nil
			@parser.parse('<!ELEMENT xml EMPTY>').should be_nil
		end

		it "shouldn't start with a number" do
			@parser.parse('<!ELEMENT 1ML EMPTY>').should be_nil
		end

		it "shouldn't start with a punctuation character" do
			@parser.parse('<!ELEMENT .ML EMPTY>').should be_nil
		end

		it "can contain letters" do
			@parser.parse('<!ELEMENT abc EMPTY>').should be_a(Treetop::Runtime::SyntaxNode)
		end

		it "can contain numbers" do
			@parser.parse('<!ELEMENT a23 EMPTY>').should be_a(Treetop::Runtime::SyntaxNode)
		end

		it "can contain other characters" do
			@parser.parse('<!ELEMENT a-23 EMPTY>').should be_a(Treetop::Runtime::SyntaxNode)
		end
	end

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

	describe "parsing attribute list declarations" do
		it "parses ids" do
		  @parser.parse('<!ATTLIST img id ID #REQUIRED>').should be_a(Treetop::Runtime::SyntaxNode)
		end
	end
end
