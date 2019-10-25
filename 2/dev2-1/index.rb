require 'cgi'
cgi= CGI.new
cgi.out("type" => "text/html",
	"charset" => "UTF-8") do
	
	file = File.open("list.txt","r")
	html= "<html><body>\n"
	cnt =0
	file.each_line do |line|
		cnt +=1
		html = html+"<p>id: #{cnt} </p>"
	end
	file.close
	htm = html+ "</body></html>"
	html
end
