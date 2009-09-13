require 'rubygems'
require 'shoulda'
require 'treetop'
#gem 'shoulda'


Treetop.load "sql"

class SqlParserTest < Test::Unit::TestCase
  context SqlParser do
    setup do
      @parser = SqlParser.new
    end

    [
      'SELECT * FROM me;', 
      'SELECT COUNT(*) FROM me;', 
      'SELECT a FROM me;', 
      'SELECT abc FROM me;', 
      'SELECT a,b,c FROM me;', 
      'SELECT acol, bcol, ccol FROM me;', 
      "SELECT a, 'a', b, c FROM me;", 
      %Q(
        SELECT a AS bob, 'b' as bob, 'c' as "BOB", B'1001', B'1010', B'1', B'0', B'01' FROM me;
      ),
      %Q(
        SELECT a AS bob, 'b'||'c'||'d' as "BOB" FROM me;
      ),
      %Q(
        SELECT *
        FROM
        me
      ),
      %Q(
       SELECT Z.zip AS "Zip", Z.city AS "City", Z.state AS "State", Z.county AS "County"
      FROM
       valid_orders_view V
       ...
      ),
      %Q(
       SELECT T.name AS "Trade Name", Z.zip AS "Zip", Z.city AS "City", Z.state AS "State", Z.county AS "County", Z.msa AS "MSA ID", '"'||M.county||', '||M.state||'"' AS "MSA", COUNT(*) as "Order Count"
      FROM
       valid_orders_view V
       ...
      ),
      'SELECT M.county||M.state FROM valid_orders_view V;',
      %Q(
       SELECT zip, TM.trade_name, COALESCE( TM.coverage, 0 ) AS active_contractor_count, city, county, state, TM.msa_name
      FROM
       valid_orders_view V
       ...
      ),
      %Q(
       SELECT Z.total, TM.serviced, 100*TM.serviced/Z.total AS percent, TM.trade_name, contractor_id, company_name, county, state, TM.name
      FROM
        table
        ...
      )
    ].each do |parse_string|
      should "parse '#{parse_string}'" do
        assert @parser.parse(parse_string)
      end
    end

    context "parsing simple operators" do
      %w(|| + - * / < > = ~ ! @ # % ^ & | ` ?).each do |op|
        should "handle 'SELECT 10#{op}2 FROM table;'" do
          assert_not_nil @parser.parse("SELECT 10#{op}2 FROM table;")
        end

        should "handle 'SELECT 10#{op}2 as alias FROM table;'" do
          assert_not_nil @parser.parse("SELECT 10#{op}2 as alias FROM table;")
        end
      end
    end

    context "parsing complex operator expression" do
      should "parse 'SELECT 10*2/5-1^3 FROM t;'" do
          assert @parser.parse("SELECT 10*2/5-1^3 FROM t;")
      end

      should "parse 'SELECT 10 * t.value / 5 - t.offset ^ 3 FROM t;'" do
          assert @parser.parse("SELECT 10 * t.value / 5 - t.offset ^ 3 FROM t;")
      end

      should "parse 'SELECT 10 * t.value / 5 - t.offset ^ 3 as a_prettier_name FROM t;'" do
          assert_not_nil @parser.parse("SELECT 10 * t.value as a_prettier_name FROM t;")
      end
    end

  end
end
