#!/usr/bin/env script/runner

require 'fastercsv'

csv = %("cc_n"|"amount_to_charge"|"voided"|"status"|"authnet_transaction_number"|"backend_transaction_number"|"full_cc"|"contractor_id"|"company_name"
"XXXX0069"|159|TRUE|"Voided"|2520376743|2520376743|"#4485691003980069"|122936|"Farm &amp; Home Energy"
"XXXX0069"|159|FALSE|"Settled Successfully"|2520297695||"#4485691003980069"|122936|"Farm &amp; Home Energy"
"XXXX0256"|79.5|FALSE|"Declined"|2520396804|2520396804|"#4862362401740256"|114953|"American Dream Enterprises"
"XXXX0256"|79.5|FALSE|"Settled Successfully"|2520353859||"#4862362401740256"|114953|"American Dream Enterprises"
)

#<FasterCSV::Row "cc_n":"XXXX0069" "amount_to_charge":"159" "voided":"TRUE" "status":"Voided" "authnet_transaction_number":"2520376743" "backend_transaction_number":"2520376743" "full_cc":"#4485691003980069" "contractor_id":"122936">
#<FasterCSV::Row "cc_n":"XXXX0069" "amount_to_charge":"159" "voided":"FALSE" "status":"Settled" "authnet_transaction_number":"Successfully" "backend_transaction_number":"2520297695" "full_cc":"#4485691003980069" "contractor_id":"122936">

file = File.join(ENV["HOME"], "tmp", "InvoicesThatNeedFixing.csv")

def options_for_csv data, type
  if type == :csv
    [:parse, data, ]
  elsif type == :file
    [:foreach, data ]
  end
end

method, file = options_for_csv csv, :csv
#method, file = options_for_csv file, :file

class ContractorInvoiceSwitcher
  attr_accessor :contractor, :auth_net_transactions
  def initialize contractor_id
    self.contractor = Contractor.find contractor_id
  end

  def << transaction
    auth_net_transactions << transaction
  end

end


seen_contractor_id = nil
FasterCSV.send(method, file, :col_sep => "|", :headers => true ) do |row|
  class << row
    def voided?
      self["voided"] == "TRUE"
    end
  end

  if seen_contractor_id != row["contractor_id"]
    # process the last switcher before overwriting it
    if switcher
      
    end
    switcher = ContractorInvoiceSwitcher.new row["contractor_id"]
    switcher << row
  else
    switcher << row 
  end
end
