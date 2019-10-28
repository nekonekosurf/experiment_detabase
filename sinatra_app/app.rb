require 'sinatra'
require 'active_record'


ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'seiseki.db'
)

class StudentRecord < ActiveRecord::Base
end

class Student < ActiveRecord::Base
end



get '/' do
  @title = 'Hello, world'
  @World = 'world'
  erb :index
end


post '/judge' do
  if !Student.where(:student_id=> params[:student_id], :name=>params[:name]).empty?
    @title = 'View Seiseki'
    @students = StudentRecord.where(:student_id=>params[:student_id])
    @studet_name=params[:name]
    erb :login
  else
    redirect '/'
  end
end
