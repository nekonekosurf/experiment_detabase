require 'cgi'
cgi= CGI.new
cgi.out("type" => "text/html",
	"charset" => "UTF-8") do
	html= "<html><body>\n"
	msg = cgi["msg"].chomp
	file = File.open("list.txt","a")
	file_x = File.open("bad.txt","r")	
	
	arr=[]
	file_x.each_line do |line|
		arr.push(line.chomp)		
	end

	if arr.include?(msg)
		html = html+"<p>you cant append #{msg}. </p>"
	else
		html = html+"<p>you inputed  #{msg} </p>"
	end

	file.close
	file_x.close
	htm = html+ "</body></html>"
	html
end
