=begin
------------------------------------------------------------ 
Author: surajz @ http://github.com/surajz

Description
-----------
Simplest way to extract data from excel file in ruby. This works fine with very large files, unlike other  
library that processes excel.

To see other available methods 
  puts WIN32OLE.new('Excel.Application').ole_methods

@see http://www.ruby-doc.org/core/classes/WIN32OLE.html

=end
require 'win32ole'
require 'pp'

  #Iterate through excel rows and print out values by column.
  def read(startIndex, endIndex, worksheet)
      (startIndex..endIndex).each{|i|
        row = worksheet.rows(i)
        puts "#{row.cells(1,1).value.to_s} #{row.cells(1,2).value.to_s} #{row.cells(1,3).value}"

       }    
  end

  # Worksheets(1) -> first worksheets.
  # If you get an error "'Book1.xls' could not be found." use absolute path for example
  # C:\\temp\\Book1.xls
  application = WIN32OLE.new('Excel.Application')  
  worksheet = application.Workbooks.Open("Book1.xls").Worksheets(1)
  #worksheet = application.Workbooks.Open("C:\\var\\work\\Book1.xls").Worksheets("sheet1")
  
  read(1, 20, worksheet)
  
  application.Workbooks.Close   