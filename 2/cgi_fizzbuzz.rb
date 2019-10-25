require 'cgi'
cgi= CGI.new
cgi.out("type" => "text/html",
	"charset" => "UTF-8") do
	num= cgi["num"].to_i
	html= "<html><body>\n"
	
	(num+1).times do|i| 
		if i==0 
			next
		end
		if i%15==0
			html =html+ "<p>#{i}:Fizz Buzz </p>"
		elsif i%5==0
			html =html+ "<p>#{i}:Buzz </p>"
		elsif i%3==0 	 
			html =html+ "<p>#{i}:Fizz</p>"
		else html =html+ "<p>#{i}: #{i} </p>"
		end
	end
	html = html+ "</body></html>"
	html
end
