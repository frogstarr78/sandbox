require 'odf/spreadsheet'

ODF::SpreadSheet.file("my-spreadsheet.ods") do |spreadsheet|
  spreadsheet.style 'red-cell', :family => :cell do |style|
    style.property :text, 'font-weight' => 'bold', 'color' => '#ff0000'
  end
  
  spreadsheet.table 'Red text table' do |table|
    table.row {|row| row.cell 'Red', :style => 'red-cell' }
  end
end
