#!/usr/bin/env ruby

require 'rubygems'
require 'treetop'
require 'attribute_node_map'
require 'html_attribute'

#Treetop.load 'html_attribute'

class String
  def to_attributes
    parser = HTMLAttributeParser.new
    parsed = parser.parse self
    parsed.attributes.collect {|attribute|
      [attribute.attribute_name.to_s, attribute.attribute_value.to_s]
    }
  end

  def remove_superfluous_data
    string = self.strip
    string.slice! /^<([^\ ]+)/
    tag = $1
    string.slice! /\/?>$/
    string.strip!
    string
  end
end

class Spacerizer
  require 'stringio'

  attr_accessor :io
  attr_reader :line_regexp, :data_lines

  def initialize line_regexp, string
    @line_regexp = line_regexp
    @io = StringIO.new string
    @data_lines = []
    @tokenized_lines = []

    get_lines_matching_line_regexp!
    split_by_html_attribute!
    sort_similar_attributes!
  end

  def to_str
    ret = ''
    attribute_counts.each do |sort_key, count|
      tokenized_lines.inject(ret) do |m, line|
        line.each do |key, val|
          if sort_key == key #&& longest_value_for_key[key] > count
            m << '%s="%s"%s'% [key, val, ' '*difference_to_longest_value(key, val)]
          else
            m << ' '*difference_to_longest_value(sort_key, '')
          end
        end
        m
      end
      ret << "\n"
    end
    ret
  end

  def to_s
    tokenized_sorted_lines.inject('') do |prev,line|
      line.each do |key, val|
        prev << '%s="%s"%s'% [key, val, ' '*difference_to_longest_value(key, val)]
      end
      prev << "\n"
    end
  end

  private

  attr_reader :tokenized_lines, :tokenized_sorted_lines, :attribute_counts, :longest_value_for_key

  def get_lines_matching_line_regexp!
    rewind!
    @io.each_line do |line|
      @data_lines << line[Regexp.new(line_regexp)]
    end
    data_lines.compact!
    rewind!
  end

  def rewind!
    @io.rewind
  end

  def split_by_whitespace!
  end

  def split_by_html_attribute!
    @tokenized_lines = @data_lines.collect {|line|
      line.remove_superfluous_data.to_attributes
    }
  end

  def sort_similar_attributes!
    init_similar_attribute_counts!
    init_longest_values_by_key!

    @tokenized_sorted_lines = []
    tokenized_lines.each do |line|
      tokenized_sorted_lines << line.sort do |(lkey, lval), (rkey, rval)|
        comp = attribute_counts[rkey] <=> attribute_counts[lkey]
        if comp == 0
          lkey <=> rkey
        else
          comp
        end
      end
    end
  end

  def init_similar_attribute_counts!
    @attribute_counts = {}
    attribute_counts.default = 0
    tokenized_lines.each do |line|
      line.each {|key, val|
        attribute_counts[key] += 1
      }
    end
  end

  def init_longest_values_by_key!
    @longest_value_for_key = {}
    longest_value_for_key.default = 0
    tokenized_lines.each do |line|
      line.each do |key, val|
        longest_value_for_key.update key => val.size if val.size > longest_value_for_key[key]
      end
    end
  end

  def difference_to_longest_value key, value
    ( longest_value_for_key[key] - value.size ) + 1
  end
end

expected = %q|
				<div id="signin_login_content" class="signin_show">
					<cfinput name="login_username"         type="text"     required="yes" tabIndex="1" value="Username / Email"  validate="email" message="Missing or invalid username." /> <br />
					<cfinput name="login_password_default" type="text"                    tabIndex="2" value="optional password" maxLength="20"   class="login_password_w_default subdued" />
					<cfinput name="login_password"         type="Password" required="Yes" tabIndex="3"                           maxLength="20"   class="login_password_w_default signin_hide" validateAt="onServer" onBlur="if(this.value != '' ) this.value = calcMD5(this.value)" />
					<cfinput name="submit"                 type="Submit"                  tabIndex="4" value="Lemmie In!" />
				</div>
				<div id="signin_register_content" class="signin_show signin_hide">
					I would like to access the features of your totally awesome site!! I would like to provide my
					<cfinput name="join_username"         type="text"     required="yes" tabIndex="5"  value="email address"     validate="email"                            message="Missing or invalid username." onclick="if(this.value == this.defaultValue) this.value = '';" />
					as my username. I would like to provide my
					<cfinput name="join_zip"              type="text"     required="yes" tabIndex="6"  value="zip code"          validate="zipcode"                          message="Missing or invalid zip." />
					for location based service. I can provide an
					<cfinput name="join_password_default" type="text"                    tabIndex="7"  value="optional password" class="join_password_w_default subdued"     maxLength="20" />
					<cfinput name="join_password"         type="Password" required="Yes" tabIndex="8"                            class="join_password_w_default signin_hide" maxLength="20" validateAt="onServer" onBlur="if(this.value != '' ) this.value = calcMD5(this.value)" />
					or one will be sent to me. Please
					<cfinput name="submit"                type="Submit"                  tabIndex="9"  value="sign me up" /> for your service.
				</div>
|

input = %q|
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

s = Spacerizer.new '<cfinput[^>]+>', input
puts s.to_s
#puts s.data_lines
#puts s.io.read

#h = { :a => 3, :b => 0, :c => 1 }
#
#h = h.sort do |(lk,lv),(rk,rv)|
##  puts [lk, lv, rk, rv].inspect
#  rv <=> lv
#end
#puts h.inspect
