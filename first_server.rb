require 'socket'
#IP address is 0.0.0.0, on port 8080
server = TCPServer.new("0.0.0.0", 8080)
loop do
  connection = server.accept #accept means to open the connection
  inputline = connection.gets #read from the connection
  connection.print "HTTP/1.1 200 OK\r\n" +
                   "Content-Type: text/plain\r\n" +
                   "Connection: close\r\n\r\n" 
  filename = "simple.html"
  file = File.open(filename, "r")
  file.readlines.map do |line|
    line.strip
    connection.puts(line)
  end     
  connection.close #close the connection
end
