# Simple Honeypot

require "socket"
require "readline"
begin 
	port = Readline.readline("PORT TO LISTEN: ")
	message = Readline.readline("MESSAGE: ")
	s = TCPServer.new port
	puts "Proxy running on 127.0.0.1:#{port}"
	while cliente = s.accept
		cliente.print "HTTP/1.1 200\r\n"
 		cliente.print "Content-Type: text/html\r\n"
    	cliente.print "\r\n"
		cliente.puts "#{message}"
		msg = cliente.recv(10000)
		puts msg
		cliente.close
	end
rescue
	puts "Error on program!"
end