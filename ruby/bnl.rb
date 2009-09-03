#!/usr/bin/ruby

"When the fare class is A,C,D,J,R, or Z then award 2 points"


"when" ::= context/conditional (case,when)
"points" ::= :class
module Points 
	def points; self; end
end
class Integer
	include Points
end

"the fare class" ::= object

"A,C,D,J,R, or Z" ::= array

"award" ::= assignment statment (=)

"is" ::= equality statement (==)

# ------------------------------------- end meta
? context ?
context.award do
	case the_fare_class
		when A,C,D,J,R,Z
			yield 2.points
	end
end


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

"compensate" ::= assignment (=)
"$"          ::= :class 
"3000"       ::= literal/integer
"for each"   ::= loop (each)
"active"     ::= object state
"deal"       ::= object
"that"       ::= conditional (==)
"closed"     ::= event/action
"more than"  ::= statement (>)
"in"         ::= range
"the past"   ::= object/(range condition/argument)/scope
"30"         ::= literal/integer
"days"       ::= :class
"ago"        ::= object/(range condition/argument)/scope

GT = ["more than", "greater than"]

jjohnson = Salesperson.new
closed_deals = deals.select {|deal| deal if deal.closed  and deal.closed > 30.days }
deals.each do |deal|
	jjohnson.compensate 3000.dollars
end

"compensate"   ::= assignment (=)
"1"            ::= literal/int
"%"            ::= :class
"of"           ::= scope
"gross"        ::= statement calculation (sum)
"profits"      ::= object
"if"           ::= conditional (if)
"are"          ::= scope/filler?
"greater than" ::= statement (>)
"$"            ::= :class  (Dollars)
"3,000,000"    ::= literal/int


jjones = Salesperson.new
of sum(profits) do |gross_profits|
	jjones.compensate 1.% gross_profits if gross_profits > 3000000.dollars
end
