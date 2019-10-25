require 'socket'
server = TCPServer.new 2000
client = server.accept
client.puts 'Hello, client'
while (1)
	str_rev = client.gets
	if  str_rev.chomp  == 'bye' 	
		break
	end
	puts str_rev
end
client.close
