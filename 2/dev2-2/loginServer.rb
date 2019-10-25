require 'webrick'
CGI_PATH = '/usr/bin/ruby'
srv = WEBrick::HTTPServer.new({ :DocumentRoot => './',
	:BindAddress => '127.0.0.1',
	:Port => 2000,
	:CGIInterpreter => CGI_PATH})
srv.mount('',WEBrick::HTTPServlet::FileHandler,'form.html')
srv.mount('/login',WEBrick::HTTPServlet::CGIHandler,'login.rb')

trap("INT"){srv.shutdown}
srv.start
