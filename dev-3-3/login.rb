require 'cgi'
require 'sqlite3'

cgi= CGI.new
db= SQLite3::Database.new("sandbox.db")

cgi.out("type" => "text/html",
	"charset" => "UTF-8") do

	html= "<html><body>\n"
	password = cgi["password"].chomp
	user =cgi["user"].chomp

	db_user = 0;
	db.execute("SELECT password
												FROM accounts
												WHERE user =?",[user]) do |row|
												db_user = 1

												db_password = db.execute("SELECT COUNT(*)
																									FROM accounts
																									WHERE password =? AND user =?",[password],[user])
												if db_password == [[0]]
													html = html+"<p>login denied </p>\n
																			 <p>password is not correct </p>"
													break
												else
													html = html+"<p>login success!!  </p>"
													break
												end
	end
	if db_user == 0
		 	html = html+"<p>we cant find your user id. sorry!!  Try it again. </p>"
	end
	htm = html+ "</body></html>"
	html
end
1
