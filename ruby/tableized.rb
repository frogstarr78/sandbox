#!/usr/bin/env ruby

fmt = <<EOF
domain    query_type
server    query_class
port      timeout
recursive advanced
submit
EOF

@domain_label      = '<label for="domain">Domain</label>'
@domain_field      = '<input type="input" name="domain" id="domain" value="google.com" />'

@server_label      = '<label for="server">Server</label>'
@server_field      = '<input type="input" name="server" id="server" value="208.77.208.186" />'

@port_label        = '<label for="port">Port</label>'
@port_field        = '<input type="input" name="port" id="port" value="53" />'

@timeout_label     = '<label for="timeout">Timeout</label>'
@timeout_field     = '<input type="input" name="timeout" id="timeout" value="5000" />'

@query_type_label  = '<label for="query_type">Query Type</label>'
@query_type_field  = '<select name="type">
  <option value="a">        Address                  </option>
  <option value="ns">       Name server              </option>
  <option value="cname">    Canonical name           </option>
  <option value="soa">      Start of authority       </option>
  <option value="mx">       Mail exchange            </option>
  <option value="mb">       Mailbox domain           </option>
  <option value="ptr">      Domain pointer           </option>
  <option value="txt">      Text strings             </option>
  <option value="any">      Any type                 </option>
  <option value="mg">       Mail group member        </option>
  <option value="mr">       Mail rename domain       </option>
  <option value="null">     Raw data record          </option>
  <option value="wks">      Well-known services      </option>
  <option value="hinfo">    Host info                </option>
  <option value="minfo">    Mailing list info        </option>
  <option value="rp">       Responsible person       </option>
  <option value="afsdb">    AFS database             </option>
  <option value="x25">      X25 PSDN address         </option>
  <option value="isdn">     ISDN address             </option>
  <option value="rt">       Route through            </option>
  <option value="nsap">     NSAP address             </option>
  <option value="nsap_ptr"> NSAP-style pointer       </option>
  <option value="sig">      Security signature       </option>
  <option value="key">      Security key             </option>
  <option value="px">       X.400 mail mapping info  </option>
  <option value="aaaa">     IPv6 address             </option>
  <option value="loc">      Location                 </option>
  <option value="nxt">      Next domain              </option>
  <option value="srv">      Location of services     </option>
  <option value="naptr">    Naming authority pointer </option>
  <option value="kx">       Key exchange delegation  </option>
  <option value="uinfo">    User info                </option>
  <option value="uid">      User ID                  </option>
  <option value="gid">      Group ID                 </option>
  <option value="maildb">   Mailbox-related records  </option>
</select>'

@query_class_label = '<label for="query_class">Query Class</label>'
@query_class_field = '<select type="input" name="query_class" id="query_class">
  <option value="in">Internet</option>
  <option value="ch">Chaos</option>
  <option value="hs">Hesiod</option>
  <option value="any">ANY</option>
</select>'

@recursive_label   = '<label for="recursive">Recursive</label>'
@recursive_field   = '<input type="checkbox" name="recursive" id="recursive" />'

@advanced_label    = '<label for="advanced">Advanced</label>'
@advanced_field    = '<input type="checkbox" name="advanced" id="advanced" />'

@submit_button     = '<input type="submit" />'

@label_is = "before"

def cellify var, indent, span=0
  if span > 0
    puts %Q(\t\t<td colspan="#{span}" style="text-align: center;">)
  else
    puts "\t\t<td>"
  end
  thing = instance_variable_get var
  thing.gsub! /^\ \ /, "\t"
  thing.split("\n").each do |line|
    puts indent + line
  end
  puts "\t\t</td>"
end

def tableize fmt
  puts "<table>"
  span=0
  fmt.split("\n").each do |line|
    words = line.split ' '
    span = words.size*2 if words.size*2 > span
    puts "\t<tr>"
    words.each do |word|
      if word == "submit"
        cellify "@#{word}_button", "\t\t\t", span
      else
        if @label_is == "before"
          cellify "@#{word}_label", "\t\t\t"
        end

        cellify "@#{word}_field", "\t\t\t"

        if @label_is == "after"
          cellify "@#{word}_label", "\t\t\t"
        end
      end
    end
    puts "\t</tr>"
  end
  puts "</table>"
end

#tableize fmt

fmt = <<EOF
domain       country state
company_name              
city         email        
submit                    
EOF

csv = <<EOD
id,type,label,value,key,style,floor,ceiling,label_is
domain,input,Domain,google.com,d,,5,40,before
country,input,Country,US,n,width: 25px;,2,2,before
state,input,State,,s,width: 25px;,2,2,before
city,input,City,,c,,3,50,before
company_name,input,Company Name,,o,,3,40,before
email,input,Email,,e,,7,30,before
submit,submit,Submit
EOD
@domain_label      = '<label for="domain">Domain</label>'
@domain_field      = '<input type="input" name="domain" id="domain" value="google.com" />'

@country_label      = '<label for="country">Country</label>'
@country_field      = '<input type="input" name="country" id="country" value="US" maxlength="2" style="width: 25px" />'

@state_label      = '<label for="state">State</label>'
@state_field      = '<input type="input" name="state" id="state" maxlength="2" style="width: 25px" />'

@city_label      = '<label for="city">City</label>'
@city_field      = '<input type="input" name="city" id="city" />'

@company_name_label      = '<label for="company_name">Company Name</label>'
@company_name_field      = '<input type="input" name="company_name" id="company_name" />'

@email_label      = '<label for="email">Email</label>'
@email_field      = '<input type="input" name="email" id="email" />'

#tableize fmt

require 'csv'
data = CSV.parse csv, :header_converters => :symbol, :converters => :all, :headers => true

def find_by_id id, data
  data.each do |row|
    return row if row[:id] == id
  end
end

def tableize2 fmt, data
  puts "<table border>"
  span=0
  fmt.split("\n").each do |line|
    words = line.split ' '
    span = words.size*2 if words.size*2 > span
    puts "\t<tr>"
    words.each do |word|
      row = find_by_id word, data

      if row[:type] == "submit"
        if span > 0
          puts %Q(\t\t<td colspan="#{span}" style="text-align: center;">)
        else
          puts "\t\t<td>"
        end
        puts %Q|\t\t\t<input type="#{row[:type]}" id="#{row[:id]}" name="#{row[:id]}" value="#{row[:label]}" style="#{row[:style]}" accesskey="#{row[:key]}" data-floor="#{row[:floor]}" data-ceiling="#{row[:ceiling]}" />|

        puts "\t\t</td>"
      else
        if row[:label_is] == "before"
          puts "\t\t<td>"

          puts %Q|\t\t\t<label for="#{row[:id]}">#{row[:label]}</label>|

          puts "\t\t</td>"
        end

        puts "\t\t<td>"

        puts %Q|\t\t\t<input type="#{row[:type]}" id="#{row[:id]}" name="#{row[:id]}" value="#{row[:value]}" style="#{row[:style]}" accesskey="#{row[:key]}" data-floor="#{row[:floor]}" data-ceiling="#{row[:ceiling]}" />|

        puts "\t\t</td>"

        if row[:label_is] == "after"
          puts "\t\t<td>"

          puts %Q|\t\t\t<label for="#{row[:id]}">#{row[:label]}</label>|

          puts "\t\t</td>"
        end
      end
    end
    puts "\t</tr>"
  end
  puts "</table>"
end

#tableize2 fmt, data

lines = fmt.split("\n")

max_length = lines.inject(0) do |memo, line|
  siz = line.split(//).size
  memo = siz if siz > memo
  memo
end

max_lines  = lines.inject(0) do |memo, line|
  count = line.split(' ').size
  memo = count if count > memo
  memo
end

max_lines = lines.inject([]) do |memo,line|
  memo << line.index( ' ' )
  memo
end

data = %w(domain country state company_name city email submit)

puts max_lines.inspect

#puts fmt_lines.inspect
#puts fmt_lines.transpose.collect(&:inspect)

#lines.each do |line|
#  puts '<tr>'
#  words = line.split /(\w+)/
#  words.reject!(&:empty?)
#
#  puts words.size, max_lines
#  if words.size == max_lines
#    words.each do |word|
#      puts %Q|\t<td>#{word}</td>|
#    end
#  else
##    span = max_lines - words.size
#    words.each do |word|
#      puts %Q|\t<td colspan="#{max_lines}">#{word}</td>|
#    end
#  end
##  puts words.inspect
#  puts '</tr>'
#end

#lines.each do |line|
#  words = line.split ' '
#  puts words.inspect
#end

#lines.each do |line|
#  words = line.split //
#  puts words.inspect
#end

#lines.each do |line|
#  words = line.split /\ /
#  puts words.inspect
#end

#lines.each do |line|
#  words = line.split /(\w+)/
#  puts words.inspect
#end
