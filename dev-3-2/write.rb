require 'cgi'
require 'sqlite3'

cgi= CGI.new
db= SQLite3::Database.new("sandbox.db")
cgi.out("type" => "text/html",
	"charset" => "UTF-8") do
	html= "<html><body>\n"

	user = cgi["user"].chomp
	message = cgi["msg"].chomp

	db.execute("INSERT INTO accounts
						  (user_name,message)
							VALUES (?,?)",[user],[message])


	html = html+"<p>user name:  #{user}.<br>message: #{message}. </p>"
	htm = html+ "</body></html>"
	html
end
