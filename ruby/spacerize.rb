#!/usr/bin/env ruby

require 'rubygems'
require 'treetop'
require 'html_node_element'

#class HTMLStringBase
#  def initialize data
#    @raw_data = data
#  end
#
#  private
#  attr_reader :tag, :raw_data
#end
#
#class HTMLTextString < HTMLStringBase
#  alias :tokenize! :raw_data
#  def parse?
#    false
#  end
#
#  private
#    def tag
#      ''
#    end
#end
#
#class HTMLString < HTMLStringBase
#  def tokenize!
#    clean_data = remove_superfluous_data!
#    @tokenized_data = to_attributes clean_data
#  end
#
#  def parse?
#    true
#  end
#
#  private
#    attr_reader :tokenized_data
#
#    def to_attributes data
#      parser = HTMLAttributeParser.new
#      parsed = parser.parse data
#      parsed.attributes.collect {|attribute|
#        [attribute.attribute_name.to_s, attribute.attribute_value.to_s]
#      }
#    end
#
#    def remove_superfluous_data!
#      string = raw_data.strip
#      string.slice! /^<([^\ ]+)/
#      @tag = $1
#      string.slice! /\/?>$/
#      string.strip!
#      string
#    end
#end

class BaseLine
  attr_reader :data
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
    puts "all '#{all}' @leading '#@leading', code '#{code}', @trailing '#@trailing'"
    @parsed = parser.parse code
    raise "Unable to parse '#{code}'" if @parsed.nil?
  end

  def attributes
    @parsed.attributes #.collect {|attribute|
#      [attribute.attribute_name.to_s, attribute.attribute_value.to_s]
#    }
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
    s << @sorted_attributes * ' '
    s << '/' if @parsed.empty? 
    s << '>'
    s << @trailing
    s
  end

  def sort_with hash
    @sorted_attributes = []
    attributes = self.attributes.to_a
    hash.each do |key, count|
      if self.attributes.has_key? key
        attributes.each do |attribute|
          @sorted_attributes << attribute.to_s if attribute.to_s =~ Regexp.new(key)
        end
      else
        @sorted_attributes << nil
      end
    end
  end

  def spacify_with hash
    @spacified_attributes = []
    attributes = self.attributes.to_a
    hash.each do |key, spacing|
      if self.attributes.has_key? key
        attributes.each do |attribute|
          @sorted_attributes << attribute.to_s if attribute.to_s =~ Regexp.new(key)
        end
      else
        @sorted_attributes << nil
      end
    end
  end
end

class RawLine < BaseLine
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
    sort_line_attributes!
    spacify_attributes!
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
    @attribute_counts = @attribute_counts.sort {|(lkey, lval), (rkey, rval)| 
      comp = rval <=> lval 
      if comp == 0
        lkey <=> rkey
      else
        comp
      end
    }
  end

  def find_longest_values!
    @longest_attribute_values = {}
    @attribute_counts.each do |attribute_name, count|
      @longest_attribute_values.update attribute_name => find_longest_value_for( attribute_name )
    end
#    puts @longest_attribute_values.inspect
  end

  def find_longest_value_for attribute_name
    longest = 0
    parsable_lines do |line|
      attributes = line.attributes.to_hash
      if attributes[attribute_name]
        attribute_value = attributes[attribute_name].attribute_value.to_s
        longest = attribute_value.size if attribute_value.size > longest
      end
    end
    longest
  end

  def sort_line_attributes!
    lines.each do |line|
      line.sort_with @attribute_counts
    end
  end

  def spacify_attributes!
    puts @longest_attribute_values.inspect
    lines.each do |line|
      line.spacify_with @longest_attribute_values
    end
  end

  def parsable_lines
    lines.each {|line|
      yield line if line.parse?
    }
  end
end

#class Spacerizer
#  require 'stringio'
#
#  attr_accessor :io
#  attr_reader :line_regexp, :raw_data_lines
#
#  def initialize string, options = {}
#    @line_regexp = options.delete(:html)
#    @io = StringIO.new string
#    @raw_data_lines = []
#    @tokenized_lines = []
#
#    get_lines_matching_line_regexp!
#    split_by_html_attribute!
#    sort_similar_attributes!
#  end
##
#  def to_str
#    ret = ''
#    counts = attribute_counts.sort {|(lkey, lval), (rkey,rval)|
#      lval <=> rval
#    }
#    counts.each do |sort_key, count|
#      tokenized_lines.inject(ret) do |m, line|
#        in_line = false
#        line.each do |key, val|
#          puts "sort_key, key #{sort_key} #{key}"
#          if sort_key == key
#            m << '%s="%s"%s'% [key, val, ' '*difference_to_longest_value(key, val)]
#            in_line = true
#          end
#        end
#
#        unless in_line
#          m << ' '*longest_value_for_key[sort_key]
#        end
#        m
#      end
#      ret << "\n"
#    end
#    ret
#  end
#
#  def to_s
#    tokenized_sorted_lines.inject('') do |prev,line|
#      line.each do |key, val|
#        prev << '%s="%s"%s'% [key, val, ' '*difference_to_longest_value(key, val)]
#      end
#      prev << "\n"
#    end
#  end
#
#  private
#
#  attr_reader :tokenized_lines, :tokenized_sorted_lines, :attribute_counts, :longest_value_for_key
#
#  def get_lines_matching_line_regexp!
#    rewind!
#    @io.each_line do |line|
#      if line =~ Regexp.new(line_regexp)
#        @raw_data_lines << HTMLString.new( line )
#      else
#        @raw_data_lines << HTMLTextString.new( line )
#      end
#    end
#    raw_data_lines.compact!
#    rewind!
#  end
#
#  def rewind!
#    @io.rewind
#  end
#
#  def split_by_html_attribute!
#    @tokenized_lines = @raw_data_lines.collect {|line|
#      line.remove_superfluous_data.to_attributes
#    }
#  end
#
#  def sort_similar_attributes!
#    init_similar_attribute_counts!
#    init_longest_values_by_key!
#
#    @tokenized_sorted_lines = []
#    tokenized_lines.each do |line|
#      tokenized_sorted_lines << line.sort do |(lkey, lval), (rkey, rval)|
#        comp = attribute_counts[rkey] <=> attribute_counts[lkey]
#        if comp == 0
#          lkey <=> rkey
#        else
#          comp
#        end
#      end
#    end
#
#    rearrange_data_lines!
#    puts @sorted_data_lines.inspect
#  end
#
#  def init_similar_attribute_counts!
#    @attribute_counts = {}
#    attribute_counts.default = 0
#    tokenized_lines.each do |line|
#      line.each {|key, val|
#        attribute_counts[key] += 1
#      }
#    end
#  end
#
#  def init_longest_values_by_key!
#    @longest_value_for_key = {}
#    longest_value_for_key.default = 0
#    tokenized_lines.each do |line|
#      line.each do |key, val|
#        longest_value_for_key.update key => val.size if val.size > longest_value_for_key[key]
#      end
#    end
#  end
#
#  def rearrange_data_lines!
#    @sorted_data_lines = []
#    raw_data_lines.each do |attribute|
#      tokenized_sorted_lines.each_with_index do |line, index|
#        line.each do |key, val|
#          puts "attribute #{attribute} key #{key}"
#          if attribute.remove_superfluous_data.index(key) == 0
#            @sorted_data_lines[index] = attribute 
#          end
#        end
#      end
#    end
#  end
#
#  def difference_to_longest_value key, value
#    ( longest_value_for_key[key] - value.size ) + 1
#  end
#end

expected = %q|
				<div id="signin_login_content" class="signin_show">
					<cfinput name="login_username"         type="text"     required="yes" tabIndex="1" value="Username / Email"  validate="email"   message="Missing or invalid username." /> <br />
					<cfinput name="login_password_default" type="text"                    tabIndex="2" value="optional password"                                                            class="login_password_w_default subdued"     maxLength="20"  />
					<cfinput name="login_password"         type="Password" required="Yes" tabIndex="3"                                                                                      class="login_password_w_default signin_hide" maxLength="20" validateAt="onServer" onBlur="if(this.value != '' ) this.value = calcMD5(this.value)" />
					<cfinput name="submit"                 type="Submit"                  tabIndex="4" value="Lemmie In!" />
				</div>
				<div id="signin_register_content" class="signin_show signin_hide">
					I would like to access the features of your totally awesome site!! I would like to provide my
					<cfinput name="join_username"         type="text"     required="yes" tabIndex="5"  value="email address"     validate="email"   message="Missing or invalid username."                                                                                                                                                    onclick="if(this.value == this.defaultValue) this.value = '';" />
					as my username. I would like to provide my
					<cfinput name="join_zip"              type="text"     required="yes" tabIndex="6"  value="zip code"          validate="zipcode" message="Missing or invalid zip." />
					for location based service. I can provide an
					<cfinput name="join_password_default" type="text"                    tabIndex="7"  value="optional password"                                                            class="join_password_w_default subdued"      maxLength="20" />
					<cfinput name="join_password"         type="Password" required="Yes" tabIndex="8"                                                                                       class="join_password_w_default signin_hide"  maxLength="20" validateAt="onServer" onBlur="if(this.value != '' ) this.value = calcMD5(this.value)" />
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

#s = Spacerizer.new input, :html => '<cfinput[^>]+>'
s = Spacer.new input, :html => '<cfinput[^>]+>'
puts s.to_s
#puts s.raw_data_lines
#puts s.io.read

#h = { :a => 3, :b => 0, :c => 1 }
#
#h = h.sort do |(lk,lv),(rk,rv)|
##  puts [lk, lv, rk, rv].inspect
#  rv <=> lv
#end
#puts h.inspect
