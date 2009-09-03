#!/usr/bin/ruby


# User controller ¬
#		          |
#			      +- adapter (XML)  := "<record><id>123</id><name><first>Bob</first><last>Smith</last></name></record>"
#			      |
#			      +- adapter (CSV)  := "id,address,city,state,zip
#                 |                     123,123 Where St,Walla Walla,WA,99362"
#			      |
#			      +- adapter (YaML) := "!ruby/object:User
#				  |					  attributes:
#				  | 						id: 123
#                 |                         wage: 10.50
#                 |                         rate: hourly
#                 |                         pto: 20
#                 |                         pto-rate: hours"
#			      |
#			      +- adapter (SQL) := "id,title,department,location,supervisor
#                                      123,CSR,Customer Service,WA,121"

class Controller
	attr_accessor :adapters, :attributes
	self.adapters   = []
	self.attributes = {}
	
	def add_adapters(*klasses)
		klasses.each do |klass|
			attributes[klass] = klass.exposes?
		end
	end

	def add_resource(res)
		attributes[(adapters << discover_resource_type(res)).last] = res.exposes?
	end

	def add_resources(*resources)
		resources.each do |res|
			add_resource res
		end
	end

	def discover_resource_type(resource)
		case resource
		  when /.csv/
			CsvAdapter
		  when /.xml/
			XmlAdapter
		  when /.ya?ml/
			YamlAdapter
		  else
			  File
		end
	end
end

class Adapter
	attr_accessor :resource
	def initialize(resource)
		self.resource = resource	
	end
	def exposes?
		raise NotImplemented
	end
end

class XmlAdapter < Adapter
	def exposes?
		# parser.parse.elements.collect {|element| element.node_name }
	end
end

class CsvAdapter < Adapter
	def exposes?
		reader = CSV::open self.file
		reader.shift #= %(id address city state zip)
	end
end

class YamlAdapter < Adapter
	def exposes?
		YAML::load_file(self.file).keys #= %(id wage rate pto pto-rate)
	end
end

class User < Controller
	def initialize
		add_resources "file.xml", "file.csv", "file.yml"
	end
end

u = User.find 123
u.name.last #:= Smith
u.mailing_label #:= Bob Smith
			    #   123 Where St
                #   Walla Walla, WA
				#   99362
u.wage.to_format #:= 10.50/hour
u.pto.to_format #:= 20/hours
u.pto.to_format("%d") #:= 8.5/days
u.supervisor #:= Sean Smith
u.department.to_format #:= Customer Service (WA)
