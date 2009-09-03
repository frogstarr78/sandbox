#!/usr/bin/ruby

require 'resolv'

# naturally speaking
#me:  What would you say if I were to say, the sky is green?
# parse, compile, !action#lookup, !not found, respond, prompt.
#phyre: I would say, I didn't know that. How do you know?
# wait
#me: Why don't you find out on your own? 
# parse, compile, !action#lookup, !not found, respond, prompt.
#phyre: How?
#me: Look it up at wikipedia.com.
# parse, compile, !action#lookup-remote, respond.
#phyre: Ok 
#phyre: ...
# parse, compile, !action#store, respond
#phyre: I would say that you are correct. 
#phyre: In foreign languages the sky is green.
# http://en.wikipedia.org/wiki/Distinguishing_blue_from_green_in_language
#me: ok. thank you phyre.

#pseudo-code

#me (at prompt type): What would you say if I were to say, the sky is green?
# parse, compile, !action#lookup, !not found, respond, prompt.
#parse => 
#	"What would you say" => generate {
#		question()!what
#		you (me computer)
#		me.say outputAdapter :default => STDOUT
#		result = me.say
#	}
#	"if i were to say the sky is green" => generate {
#		I (user)
#		user.say inputAdapter :default => STDIN
#		user.say("the sky is green")
#			user.asked="the sky is green"
#	}
#	conversation.compile
#	me.lookup
#		me.response "I don't know that"
#	me.respond 
#		me.say me.response
#		unless me.found_answer? 
#			me.say prompt

#me: Why don't you find out on your own? 
#parse => 
#	you = me
#	find out = ?? how
#	conversation.compile
#	me.lookup
#		me.response "I don't know that"
#	me.respond 
#		me.say me.response
#		unless me.found_answer? 
#			me.say prompt

#me: look it up at wikipedia.com
#parse => 
#	me.locate conversation.user.asked
#	at wikipedia.com
# ...

class User
  attr_accessor :adaptors, :out_adaptors, :name
  def initialize(name='')
		self.name = name
		self.adaptors = {
				:in  => {:default => STDIN},
				:out => {:default => STDOUT}
		}
  end

  def ask(something, some_how=nil)
		some_how ||= adaptors[:out][:default]
		some_how.write "#{idee} #{something.chomp} "
  end
  def say(something, some_how=nil)
		some_how ||= adaptors[:out][:default]
		some_how.puts "#{idee} #{something}"
  end

  def name=(nam)
		@idee = nam.to_s + '>'
		@name = nam.to_s
  end

  def who(something, some_how=nil)
		ask "Who " + something, some_how
	end

  private 
		def identify
			say "I'm #{name}"
		  @ideed = true
    end
		def identified_myself?
			@ideed
		end

		def idee
				@idee if identified_myself?
		end
end

class Conversation
	attr_accessor :people, :topic
	attr_writer :host, :guests
	def initialize(topic='', *people)
		self.topic = topic	
		self.people = []
		self << people unless people.empty?
	end

	def <<(*who)
		self.people += who
	end

  def host
		people.first
  end

  def guests
    people[1..-1]
  end
end

pc = User.new(Resolv::Hosts.new.getnames("127.0.0.1").last)
class << pc
	def introduce_yourself
		say "Hello."
		identify
		who "are you?"
#		self.guests.last.name = STDIN.gets.chop
		say "Nice to meet you #{guests.last.name}."
	end
end
pc.introduce_yourself
conv = Conversation.new
conv << User.new()

$you = User.new()
#$me.greet

#STDIN.each_line do |lin|
#  puts "$you.line: #{line}"
#end
