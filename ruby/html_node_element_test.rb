require 'rubygems'
#require 'shoulda'
require 'treetop'


Treetop.load "html_node_element"

#class SqlParserTest < Test::Unit::TestCase
#  context SqlParser do
#    setup do
#      @parser = SqlParser.new
#    end
#
#    [
#      'SELECT * FROM me;', 
#      'SELECT COUNT(*) FROM me;', 
#      'SELECT a FROM me;', 
#      'SELECT abc FROM me;', 
#      'SELECT a,b,c FROM me;',
#      'SELECT acol, bcol, ccol FROM me;', 
#      "SELECT a, 'a', b, c FROM me;", 
#      %Q(
#        SELECT a AS bob, 'b' as bob, 'c' as "BOB", B'1001', B'1010', B'1', B'0', B'01' FROM me;
#      ),
#      %Q(
#        SELECT a AS bob, 'b'||'c'||'d' as "BOB" FROM me;
#      ),
#      %Q(
#        SELECT *
#        FROM
#        me
#      ),
#      %Q(
#       SELECT Z.zip AS "Zip", Z.city AS "City", Z.state AS "State", Z.county AS "County"
#      FROM
#       valid_orders_view V
#       ...
#      ),
#      %Q(
#       SELECT T.name AS "Trade Name", Z.zip AS "Zip", Z.city AS "City", Z.state AS "State", Z.county AS "County", Z.msa AS "MSA ID", '"'||M.county||', '||M.state||'"' AS "MSA", COUNT(*) as "Order Count"
#      FROM
#       valid_orders_view V
#       ...
#      ),
#      'SELECT M.county||M.state FROM valid_orders_view V;',
#      %Q(
#       SELECT zip, TM.trade_name, COALESCE( TM.coverage, 0 ) AS active_contractor_count, city, county, state, TM.msa_name
#      FROM
#       valid_orders_view V
#       ...
#      ),
#      %Q(
#       SELECT Z.total, TM.serviced, 100*TM.serviced/Z.total AS percent, TM.trade_name, contractor_id, company_name, county, state, TM.name
#      FROM
#        table
#        ...
#      )
#    ].each do |parse_string|
#      should "parse '#{parse_string}'" do
#        assert @parser.parse(parse_string)
#      end
#    end
#
##    context "parsing 'SELECT * FROM me;'" do
##      setup do
##        sql_fragment = 'SELECT * FROM me;'
##        @parsed = @parser.parse sql_fragment
##      end
##
##      should "have columns.to_a" do
##        assert_equal %w(*), @parsed.columns.to_array
##      end
##
##      should "have columns.to_s" do
##        assert_equal '*', @parsed.columns.to_s
##      end
##
##      should "parse" do
##        assert_not_nil @parsed
##      end
##    end
#
##    context "parsing 'SELECT a FROM me;'" do
##      setup do
##        sql_fragment = 'SELECT a FROM me;'
##        @parsed = @parser.parse sql_fragment
##      end
##
##      should "have columns.to_a" do
##        assert_equal %w(a), @parsed.columns.to_array
##      end
##
##      should "have columns.to_s" do
##        assert_equal 'a', @parsed.columns.to_s
##      end
##
##      should "not have an alias" do
##        assert @parsed.columns.alias?
##      end
##
##      should "parse" do
##        assert_not_nil @parsed
##      end
##    end
#
#    context "parsing 'SELECT a,b,c FROM me;'" do
#      setup do
#        sql_fragment = 'SELECT a,b,c FROM me;'
#        @parsed = @parser.parse sql_fragment
#        puts @parsed.inspect
#      end
#
#      should "have columns.to_a" do
#        assert_equal %w(a), @parsed.columns.to_a
#      end
#
#      should "have columns.to_s" do
#        assert_equal 'a', @parsed.columns.to_s
#      end
#
#      should "have an alias" do
#        assert @parsed.columns.alias?
#      end
#
#      should "parse" do
#        assert_not_nil @parsed
#      end
#    end
#
##    context "parsing 'SELECT a AS col FROM me;'" do
##      setup do
##        sql_fragment = 'SELECT a AS col FROM me;'
##        @parsed = @parser.parse sql_fragment
##      end
##
##      should "have columns.to_a" do
##        assert_equal %w(a), @parsed.columns.to_a
##      end
##
##      should "have columns.to_s" do
##        assert_equal 'a', @parsed.columns.to_s
##      end
##
##      should "have an alias" do
##        assert @parsed.columns.alias?
##      end
##
##      should "parse" do
##        assert_not_nil @parsed
##      end
##    end
#
##    context "parsing 'SELECT a,b,c FROM me;'" do
##      setup do
##        sql_fragment = 'SELECT a,b,c FROM me;'
##        @parsed = @parser.parse sql_fragment
##      end
##
##      should "have columns" do
##        assert_equal %w(a b c), @parsed.columns
##      end
##
##      should "parse" do
##        assert_not_nil @parsed
##      end
##    end
#
##    context "parsing simple operators" do
###      %w(|| + - * / < > = ~ ! @ # % ^ & | ` ?).each do |op|
##      %w(|| +).each do |op|
##        context "parsing 'SELECT 10#{op}2 FROM table;'" do
##          setup do
##            sql_fragment = "SELECT 10#{op}2 FROM table;"
##            @parsed = @parser.parse sql_fragment
##          end
##
##          should "not have alias?" do
##            assert !@parsed.columns.to_array.first.alias?
##          end
##
###          should "populate columns" do
###            assert_equal '?column?', @parsed.columns.name
###          end
##
##          should "parse" do
##            assert_not_nil @parsed
##          end
##        end
##
###        context "parsing 'SELECT 10 #{op} 2 as alias FROM table;'" do
###          setup do
###            sql_fragment = "SELECT 10 #{op} 2 as alias FROM table;"
###            @parsed = @parser.parse sql_fragment
###          end
###
###          should "not have alias?" do
###            assert @parsed.columns.to_a.first.alias?
###          end
###
###          should "populate columns" do
###            assert_equal 'alias', @parsed.columns.alias?.inspect
###          end
###
###          should "parse" do
###            assert_not_nil @parsed
###          end
###        end
##      end
##    end
#
##    context "parsing complex operator expression" do
##      should "parse 'SELECT 10*2/5-1^3 FROM t;'" do
##          assert @parser.parse("SELECT 10*2/5-1^3 FROM t;")
##      end
##
##      should "parse 'SELECT 10 * t.value / 5 - t.offset ^ 3 FROM t;'" do
##          assert @parser.parse("SELECT 10 * t.value / 5 - t.offset ^ 3 FROM t;")
##      end
##
##      should "parse 'SELECT 10 * t.value / 5 - t.offset ^ 3 as a_prettier_name FROM t;'" do
##          assert_not_nil @parser.parse("SELECT 10 * t.value as a_prettier_name FROM t;")
##      end
##    end
#
#  end
#end

pstring = '<cfinput name="node" type="text" />'
parser = HTMLNodeElementParser.new
parsed = parser.parse pstring
#puts parsed.inspect
puts parsed.node_name
#puts parsed.attributes
puts parsed.empty?


pstring = '<cfinput name="node" type="text">'
parsed = parser.parse pstring
puts parsed.empty?
