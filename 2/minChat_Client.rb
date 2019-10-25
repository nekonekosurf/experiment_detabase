require 'socket'
socket = TCPSocket.new('127.0.0.1',2000)
puts socket.gets
while (1)
	str = gets().chomp
	socket.puts str
	if str == 'bye' 
		break
	end
end
socket.close
