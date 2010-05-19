
%%{
  machine Experimental;

  action initialize {
  }

  main := ! ( digit any* ) >initialize;

}%%


class Experimental


  attr_accessor :data

  def initialize data
    @data = data
  end

  %% write data;
  %% write init;

  def run
    %% write exec;
  end
end

e = Experimental.new ARGV
e.run
