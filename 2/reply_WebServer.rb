require 'webrick'
CGI_PATH = '/usr/bin/ruby'
srv = WEBrick::HTTPServer.new({ :DocumentRoot => './',
	:BindAddress => '127.0.0.1',
	:Port => 2000,
	:CGIInterpreter => CGI_PATH})
srv.mount('/time',WEBrick::HTTPServlet::CGIHandler,'cgi_time.rb')
srv.mount('/fizzbuzz',WEBrick::HTTPServlet::CGIHandler,'cgi_fizzbuzz.rb')
trap("INT"){srv.shutdown}
srv.start
