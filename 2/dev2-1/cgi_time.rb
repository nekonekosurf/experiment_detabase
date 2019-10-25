require 'cgi'
cgi= CGI.new
cgi.out("type" => "text/html",
	"charset" => "UTF-8") do
	time= Time.now
	html= "<html><body>\n"
	html = html+"<p>now is #{time}</p>"
	htm = html+ "</body></html>"
	html
end
