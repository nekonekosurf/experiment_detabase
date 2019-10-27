require 'sinatra'
require 'active_record'


ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'seiseki.db'
)

class StudentRecord < ActiveRecord::Base
end

get '/' do
  @title = 'Hello, world'
  @World = 'world'
  erb :index
end


get '/seiseki' do
  @title = 'Seiseki View'
  @students = StudentRecord.all
  erb :seiseki
end
