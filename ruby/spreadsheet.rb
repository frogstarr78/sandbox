require "spreadsheet/excel"
include Spreadsheet

workbook = Excel.new("test.xls")
format = Format.new
format.color = "green"
format.bold = true

worksheet = workbook.add_worksheet
worksheet.write(0, 0, "Hello", format)
worksheet.write(1, 1, ["Matz","Larry","Guido"]) 

workbook.close
