#!/usr/bin/env ruby

require 'rubygems'
require 'treetop'
require 'colored'
require 'html_node_element'
require 'stringio'

class BaseLine
  attr_reader :data
  attr_accessor :attribute_sort_order, :attribute_padding_by_name
  def initialize data
    @data = data
  end

  def parse?
    false
  end

  def to_s
    @data
  end

  def sort_with hash
    nil
  end
end

class SpacerLine < BaseLine
  def initialize data, match
    super data

    @match = match
    parser = HTMLNodeElementParser.new
    all, @leading, code, @trailing = data.split /^(\s*)(#@match)(.*)$/
    @parsed = parser.parse code
    raise "Unable to parse '#{code}'" if @parsed.nil?
  end

  def attributes
    @parsed.attributes
  end

  def parse? 
    true
  end

  def to_s
    s = ''
    s << @leading
    s << '<'
    s << @parsed.node_name
    s << ' '
    attribute_sort_order.each do |attribute_name|
      s << whitespace_pad_value_at_key!( attribute_name )
    end
    s << '/' if @parsed.empty? 
    s << '>'
    s << @trailing
    s << "\n"
    s
  end

  def whitespace_pad_value_at_key! key
    longest = attribute_padding_by_name[key]
    if self.attributes.has_key? key
      attribute_value = self.attributes[key].to_s
      padding_length  = longest - attribute_value.size
    else
      attribute_value = ''
      padding_length  = longest
    end
    
#    s = attribute_value << ( ' ' * padding_length )
    s = attribute_value 
    s << ' ' * padding_length
    s
  end

  def attribute_sort_order= order
    @attribute_sort_order = case order
    when Hash; then order.keys
    when Array
      if order.first.is_a? Array
        order.collect(&:first) 
      else
        order
      end
    else
      nil
    end
  end
end

class RawLine < BaseLine
  def attribute_sort_order; []; end
  def attribute_padding_by_name; {}; end
end

class Spacer
  attr_accessor :lines

  def initialize input, options = {}
    @line_regexp = options.delete(:html)
    @io = StringIO.new input
    @lines = []

    parse!
  end

  def parse!
    read_lines!
    collate_attributes!
    sort_attribute_counts!
    find_longest_values!
  end
  private :parse!

  def to_s
    lines.inject('') do |m, line|
      m += line.to_s
    end
  end

  def read_lines!
    @io.each_line do |line|
      if line =~ Regexp.new( @line_regexp )
        parse_line = SpacerLine.new line, @line_regexp
      else
        parse_line = RawLine.new line 
      end
      lines << parse_line
    end
  end

  def collate_attributes!
    @attribute_counts  = {}
    @attribute_counts.default = 0
    parsable_lines do |line|
      attributes = line.attributes.to_a
      attributes.each do |attribute|
        @attribute_counts[attribute.attribute_name.to_s] += 1
      end
    end
  end

  def sort_attribute_counts!
    @attribute_counts = @attribute_counts.sort do |(lkey, lval), (rkey, rval)| 
      comp = rval <=> lval 
      if comp == 0
        lkey <=> rkey
      else
        comp
      end
    end
    
    lines.each do |line|
      line.attribute_sort_order = @attribute_counts
    end
  end

  def find_longest_values!
    @longest_attribute_values = {}
    @attribute_counts.each do |attribute_name, count|
      @longest_attribute_values.update attribute_name => find_longest_value_for( attribute_name )
    end

    lines.each do |line|
      line.attribute_padding_by_name = @longest_attribute_values
    end
  end

  def find_longest_value_for attribute_name
    longest = 0
    parsable_lines do |line|
      attributes = line.attributes.to_hash
      if attributes[attribute_name]
        attribute_value = attributes[attribute_name].to_s
        longest = attribute_value.size if attribute_value.size > longest
      end
    end
    longest + 1
  end

  def parsable_lines
    lines.each {|line|
      yield line if line.parse?
    }
  end
end

if __FILE__ == $0
  module Spacer::IO::Format
    def expected 
      %q|
          <div id="signin_login_content" class="signin_show">
              <cfinput name="login_username"         tabIndex="1" type="text"     value="Username / Email"  required="yes"                                                             message="Missing or invalid username." validate="email"                                                                                                                                                        /> <br />
              <cfinput name="login_password_default" tabIndex="2" type="text"     value="optional password"                class="login_password_w_default subdued"     maxLength="20"                                                                                                                                                                                                                />
              <cfinput name="login_password"         tabIndex="3" type="Password"                           required="Yes" class="login_password_w_default signin_hide" maxLength="20"                                                           onBlur="if(this.value != '' ) this.value = calcMD5(this.value)" validateAt="onServer"                                                                />
              <cfinput name="submit"                 tabIndex="4" type="Submit"   value="Lemmie In!"                                                                                                                                                                                                                                                                                                  />
          </div>
          <div id="signin_register_content" class="signin_show signin_hide">
              I would like to access the features of your totally awesome site!! I would like to provide my
              <cfinput name="join_username"          tabIndex="5" type="text"     value="email address"     required="yes"                                                             message="Missing or invalid username." validate="email"                                                                                         onclick="if(this.value == this.defaultValue) this.value = '';" />
              as my username. I would like to provide my
              <cfinput name="join_zip"               tabIndex="6" type="text"     value="zip code"          required="yes"                                                             message="Missing or invalid zip."      validate="zipcode"                                                                                                                                                      />
              for location based service. I can provide an
              <cfinput name="join_password_default"  tabIndex="7" type="text"     value="optional password"                class="join_password_w_default subdued"      maxLength="20"                                                                                                                                                                                                                />
              <cfinput name="join_password"          tabIndex="8" type="Password"                           required="Yes" class="join_password_w_default signin_hide"  maxLength="20"                                                           onBlur="if(this.value != '' ) this.value = calcMD5(this.value)" validateAt="onServer"                                                                />
              or one will be sent to me. Please
              <cfinput name="submit"                 tabIndex="9" type="Submit"   value="sign me up"                                                                                                                                                                                                                                                                                                  /> for your service.
          </div>
  |
    end

    def input 
      %q|
          <div id="signin_login_content" class="signin_show">
              <cfinput type="text" required="yes" tabIndex="1" value="Username / Email" validate="email" name="login_username" message="Missing or invalid username." /> <br />
              <cfinput name="login_password_default" type="text" tabIndex="2" value="optional password" maxLength="20" class="login_password_w_default subdued" />
              <cfinput class="login_password_w_default signin_hide" type="Password" required="Yes" tabIndex="3" name="login_password" maxLength="20" validateAt="onServer" onBlur="if(this.value != '' ) this.value = calcMD5(this.value)" />
              <cfinput type="Submit" name="submit" tabIndex="4" value="Lemmie In!" />
          </div>
          <div id="signin_register_content" class="signin_show signin_hide">
              I would like to access the features of your totally awesome site!! I would like to provide my
              <cfinput name="join_username" type="text" required="yes" tabIndex="5" value="email address" validate="email" message="Missing or invalid username." onclick="if(this.value == this.defaultValue) this.value = '';" />
              as my username. I would like to provide my
              <cfinput type="text" required="yes" tabIndex="6" name="join_zip" value="zip code" validate="zipcode" message="Missing or invalid zip." />
              for location based service. I can provide an
              <cfinput type="text" tabIndex="7" value="optional password" name="join_password_default" class="join_password_w_default subdued" maxLength="20" />
              <cfinput name="join_password" type="Password" required="Yes" tabIndex="8" class="join_password_w_default signin_hide" maxLength="20" validateAt="onServer" onBlur="if(this.value != '' ) this.value = calcMD5(this.value)" />
              or one will be sent to me. Please
              <cfinput name="submit" type="Submit" tabIndex="9" value="sign me up" /> for your service.
          </div>
  |
    end
  end

#  include Spacer::IO::Format
#  s = Spacer.new input, :html => '<cfinput[^>]+>'
#  puts s.to_s == expected ? 'true'.green : 'false'.red

  require 'test/unit'
  require 'test_equality_with_lcs'
  require 'test_equality_with_lcs/unit'

  class SpacerizeTest < Test::Unit::TestCase
    include TestEqualityWithLCS::Unit
    include Spacer::IO::Format

    def test_output
      spacer = Spacer.new input, :html => '<cfinput[^>]+>'
      assert_equal_with_lcs expected, spacer.to_s
    end
  end
  #puts s.raw_data_lines
  #puts s.io.read

  #h = { :a => 3, :b => 0, :c => 1 }
  #
  #h = h.sort do |(lk,lv),(rk,rv)|
  ##  puts [lk, lv, rk, rv].inspect
  #  rv <=> lv
  #end
  #puts h.inspect
end
