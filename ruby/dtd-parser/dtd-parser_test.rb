#!/usr/bin/env ruby

require 'rubygems'
require 'spec'
require 'treetop'

Treetop.load "dtd"

describe DtdParser do
	before do
		@parser = DtdParser.new
	end

	describe 'should recognize entities:' do
		require 'treetop/runtime/syntax_node'

		standard_entities = {
			'less than'          => %w(< &#60; &lt;),
			'greater than'       => %w(> &#62; &gt;),
			'ampersand'          => %w(&#38; &amp;),
			'apostrophe'         => %w(' &#39; &apos;),
			'quote'              => %w(" &#34; &quot;),
			'non breaking space' => %w(\  &#32; &nbsp;),
			'emdash'             => %w(-- &#045;&#045; &mdash;),
		}

		standard_entities.each do |entity_name, entities|
			entities.each do |entity|
				it "'#{entity}' as a/an #{entity_name}" do
					@parser.parse(entity).should be_a(Treetop::Runtime::SyntaxNode)
				end
			end
		end
	end

	describe "element names" do
		it "shouldn't allow <!ELEMENT XML.>" do
			@parser.parse('XML').should be_nil
			@parser.parse('Xml').should be_nil
			@parser.parse('xml').should be_nil
		end

		it "shouldn't start with a number" do
			@parser.parse('1ML').should be_nil
		end

		it "shouldn't start with a punctuation character" do
			@parser.parse('.ML').should be_nil
		end

		it "shouldn't contain spaces" do
			@parser.parse('X ML').should be_nil
		end

		it "can contain letters" do
			@parser.parse('abc').should be_a(Treetop::Runtime::SyntaxNode)
		end

		it "can contain numbers" do
			@parser.parse('a23').should be_a(Treetop::Runtime::SyntaxNode)
		end

		it "can contain other characters" do
			@parser.parse('a-23').should be_a(Treetop::Runtime::SyntaxNode)
		end
	end

end
