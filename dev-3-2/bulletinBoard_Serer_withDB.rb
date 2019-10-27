require 'webrick'
CGI_PATH = '/usr/bin/ruby'
srv = WEBrick::HTTPServer.new({ :DocumentRoot => './',
	:BindAddress => '127.0.0.1',
	:Port => 2000,
	:CGIInterpreter => CGI_PATH})
srv.mount('/write',WEBrick::HTTPServlet::CGIHandler,'write.rb')
srv.mount('/read',WEBrick::HTTPServlet::CGIHandler,'read.rb')
srv.mount('/index',WEBrick::HTTPServlet::CGIHandler,'index.rb')
trap("INT"){srv.shutdown}
srv.start
