require 'cgi'
cgi= CGI.new
cgi.out("type" => "text/html",
	"charset" => "UTF-8") do
	
	file = File.open("list.txt","r")
	
	id = cgi["id"].chomp.to_i
	id.to_i
	cnt=0	
	msg=nil
	html= "<html><body>\n"

	file.each_line do |line|
		cnt +=1
		if cnt == id
			msg= line
		end
		
	end
	file.close	
	if cnt<id
		html = html+"<p>out of range.</p>"
	else
		if msg==nil
			html = html+"<p> Not Found </p>"
		else
			html = html+"<p>id:#{id} is #{msg} </p>"
		end
	end

		
	htm = html+ "</body></html>"
	html
end
