abort "Only running on ruby 1.9.2" unless RUBY_VERSION >= '1.9.2'

puts $LOAD_PATH.reject {|path| path !~ /psych/ }.inspect
$LOAD_PATH.unshift 'lib'
$LOAD_PATH.unshift '.'
require 'rubygems'
require 'psych'

class Listener < Psych::Handler
  def scalar(value, anchor, tag, plain, quoted, style)
    puts value
  end
end

listener = Listener.new
parser   = Psych::Parser.new listener
parser.parse DATA

__END__
{"foo":"bar"}
