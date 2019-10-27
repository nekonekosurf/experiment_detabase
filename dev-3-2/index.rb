require 'cgi'
require 'sqlite3'

cgi= CGI.new
db= SQLite3::Database.new("sandbox.db")
cgi.out("type" => "text/html",
	"charset" => "UTF-8") do
	html= "<html><body>\n"
	db.execute("SELECT *
							FROM accounts")  do |row|
							html = html+"<p> user: #{row[1]},  &emsp;      id: #{row[0]} </p>"
	end
	htm = html+ "</body></html>"
	html
end
