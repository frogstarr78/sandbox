#!/usr/bin/ruby

require 'date'
require 'time'
#require 'rational'
require 'currency'
#require 'comparable'

"
# JJohnson
compensate $3000 for each        deal that closed in the past 30 days
compensate $800  for each active deal that closed more than 365 days ago
compensate 5% of gross profits if gross profits are greater than $1,000,000
compensate 5% of gross profits if gross profits are greater than $2,000,000

# JJones
compensate $2500 for each deal closed in the past 30 days
compensate $500 for each active deal that closed more than 365 days ago
compensate 5% of gross profits if gross profits are greater than $1,000,000
compensate 3% of gross profits if gross profits are greater than $2,000,000
compensate 1% of gross profits if gross profits are greater than $3,000,000
"
#"compensate" ::= assignment (=)
#"$"          ::= :class 
#"3000"       ::= literal/integer
#"for each"   ::= loop (each)
#"active"     ::= object state
#"deal"       ::= object
#"that"       ::= conditional (==)
#"closed"     ::= event/action
#"more than"  ::= statement (>)
#"in"         ::= range
#"the past"   ::= object/(range condition/argument)/scope
#"30"         ::= literal/integer
#"days"       ::= :class
#"ago"        ::= object/(range condition/argument)/scope

#class Dollars
#  include Comparable
#  attr_accessor :value, :thousands, :separator
#  def initialize val, thows=true, sep=','
#    @value = val
#    @thousands = thows
#    @separator = sep
#  end
#  def thousands?
#    @thousands == true
#  end
#  def to_s
#    sprintf("$%s", @value)
#    "$%s" % @value.to_f.to_s.reverse.scan(/.{1,3}/).join(separator).reverse if thousands?
#  end
#  def to_i
#    @value
#  end
#
#  def to_f
#    @value.to_f
#  end
#
#  def <=> o
#    @value.to_i <=> o.to_i
#  end
#
#  def quo o
#    @value.quo o
#  end
#end

class Percent
  attr_accessor :value, :percent
  def initialize pcnt, val
    @value = val
    @percent = pcnt > 0 && !pcnt.is_a?(Float) ? pcnt.quo(100) : pcnt
#    @percent = pcnt > 1 && !pcnt.is_a?(Float) ? Rational(pcnt, 100) : pcnt
  end
  def to_p
    sprintf("%2.2f%%", @percent)
  end
  def to_s
    to_i.to_s
  end
  def to_i
    value*percent
  end
end

class Integer
  def dollars
    Currency::Money.new self, :USD
  end

  def greater_than other
    self > other.to_i
  end
  alias_method :more_than, :greater_than

  def percent other=0
    Percent.new self, other
  end
end

class Salesperson# < Struct.new :name
  attr_accessor :bonus, :name
  def initialize name, bonus=0
    @name = name
    @bonus = bonus
  end
  def compensate bonus
    @bonus = bonus
  end

  def bonus
    @bonus.to_s
  end

  def bonus_rate
    @bonus.to_p
  end
end
class Profit < Struct.new :value; 
	def to_i
		@value.to_i
	end
end
class Profits < Struct.new :profit; 
	def to_i
		@value.to_i
	end
end

GT = ["more than", "greater than"]

def gross profits
  return profits if profits.is_a? Integer
  profits.inject(0) do |total, now| 
    total += now.to_i
    total
  end
end

def of gps
  yield gps if block_given?
  gps
end

jjones = Salesperson.new 'jjones'
profits = Profits.new 14342332445.dollars
of gross(profits) do |gross_profits|
	jjones.compensate(1.percent(gross_profits.dollars)) if gross_profits.greater_than 3000000.dollars
end

puts '145314.dollars ' << 145314.dollars.to_s
puts 1.percent(145.dollars)
puts jjones.inspect
puts 'bonus ' << jjones.bonus
puts 'bonus_rate ' << jjones.bonus_rate
puts 'profits ' << profits.inspect
puts 'profit ' << profits.profit.to_s
#exit
#
#jjohnson = Salesperson.new
#closed_deals = deals.select {|deal| deal if deal.closed  and deal.closed > 30.days }
#deals.each do |deal|
#	jjohnson.compensate 3000.dollars
#end


class Integer
  def percent other=0
    Percent.new self, other
  end
end

class Salesperson
  attr_accessor :bonus, :name
  def compensate percent, bonus
    percent.value = bonus
    @bonus = percent
  end
end

def compensate who, percent, profits
  who.compensate percent, profits 
end

bob = Salesperson.new('bob')
compensate bob, 5.percent, gross(profits).dollars if gross(profits).greater_than 1000000.dollars
puts bob.inspect
puts bob.bonus

#compensate 5% of gross profits if gross profits are greater than $1,000,000
#who.compensate 5.percent of gross profits if gross profits greater_than 1000000.dollars

class Integer
  def percent 
    yield self
  end

  def of profit
    profit*self.quo(100)
  end
end

def gross *profits
  profits.inject(0) do |total, now| 
    total += now.to_i
    total
  end
end

5.percent do |percent|
  puts percent.of(gross(100, 100))
end

class Integer
  def percent 
    @percent = Proc.new { |profit| self.quo(100)*profit }
    self
  end

  def of profit
    @percent.call profit
  end
end
puts 5.percent.of(gross(100, 100))


def of profit
  Proc.new {|percent| percent*profit }
end

p = of 100
puts p.call(0.05)
puts p.call(5.quo(100))
puts 100*5.quo(100)
puts 5.quo(100)*100

class Integer
	def days dir
		case dir
			when :ago, :since
				DateTime.now-self
			when :til, :more
				DateTime.now()+self
		end
	end
end

def june
	n = DateTime.now
	DateTime.new(n.year, 6, 1)
end

def its
end

puts 15.days(:ago)
puts 265.days(:ago)
puts 10.days(:more)


puts gross(profits).dollars
"compensate $500 for each active deal that closed more than 365 days ago"
"compensate $500 for each deal that is active that was closed more than 365 days ago"

class Deal < Struct.new(:name, :active, :closed_on); end

deals = [
	Deal.new('first', true, DateTime.now),
	Deal.new('first', false, DateTime.now-1),
	Deal.new('first', true, DateTime.now-2),
	Deal.new('first', false, DateTime.now-2),
	Deal.new('first', true, DateTime.now-4)
]

def active klass
  klass.find :condition => ["active = ?", true]
end

puts deals.inspect

def foreach state, klass
#  klass.find state
end

joe = Salesperson.new('joe')
#compensate joe, 500.dollars, foreach(active Deal) that closed.more_than 365.days :ago
puts joe.inspect
puts joe.bonus
