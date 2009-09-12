=begin
------------------------------------------------------------ 
Author: surajz @ http://github.com/surajz

Description
-----------
Test Oracle connection using Ruby's Database Interface layer. 

@see http://rubyforge.org/projects/ruby-dbi/ for other database drivers
     http://ruby-oci8.rubyforge.org/en/dbd_oci8.html for more option
=end
require 'rubygems'
require 'dbi'

begin  
  #RADEQ is database name from tnsnames.ora file  (default location C:\oracle\product\10.2.0\client_1\NETWORK\ADMIN\tnsnames.ora)
  #(change RADEQ, username, and  password)
  dbh = DBI.connect('DBI:OCI8:RADEQ', 'username', 'password')
  rs = dbh.prepare('SELECT * FROM cat')
  rs.execute
  while rsRow = rs.fetch do
    p rsRow
  end
  rs.finish
rescue DBI::DatabaseError => e
  puts " #{e.err} \n #{e.errstr}"
ensure
  dbh.disconnect unless dbh == nil
end

