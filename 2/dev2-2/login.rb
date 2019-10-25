require 'cgi'
cgi= CGI.new
cgi.out("type" => "text/html",
	"charset" => "UTF-8") do
	html= "<html><body>\n"
	password = cgi["password"].chomp
	file = File.open("List.txt","r")
	arr=[]
	file.each_line do |line|
		arr.push(line.chomp)		
	end

	if arr.include?(password)
		html = html+"<p>login success!! </p>"
	else
		html = html+"<p>login denied  </p>"
	end

	file.close

	htm = html+ "</body></html>"
	html
end
