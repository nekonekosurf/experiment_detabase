require 'webrick'
CGI_PATH = '/usr/bin/ruby'
srv = WEBrick::HTTPServer.new({ :DocumentRoot => './',
	:BindAddress => '127.0.0.1',
	:Port => 2000,
	:CGIInterpreter => CGI_PATH})
srv.mount('/lab_search',WEBrick::HTTPServlet::CGIHandler,'request_member.rb')
srv.mount('/member_search',WEBrick::HTTPServlet::CGIHandler,'member_searc.rb')

trap("INT"){srv.shutdown}
srv.start
