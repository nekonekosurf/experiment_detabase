require 'cgi'
require 'sqlite3'

cgi= CGI.new
db= SQLite3::Database.new("sandbox.db")
cgi.out("type" => "text/html",
	"charset" => "UTF-8") do
	html= "<html><body>\n"

	id = cgi["id"].chomp.to_i
  flag = 0
	db.execute("SELECT  *
						  FROM accounts
              WHERE id = ?",[id]) do |row|
              html = html+"<p>user name: #{row[1]} <br>message: #{row[2]}  </p>"
              flag = 1
  end
  if flag == 0
    html = html+"<p>out of range!!  </p>"
  end


	htm = html+ "</body></html>"
	html
end
