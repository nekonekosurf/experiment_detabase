require'socket'

socket =TCPSocket.new('127.0.0.1',2000)
socket.write "GET / HTTP/1.0\r\nAccept: */*\r\nConnection: close\r\nHost:
127.0.0.1:2000\r\n\r\n"

response= ' ' 
while t= socket.read(1024)
	response = response +t 
end

puts response
