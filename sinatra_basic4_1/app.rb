require 'sinatra'
require 'active_record'


ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'sandbox.db'
)

class NewTable < ActiveRecord::Base
end

get '/' do
  @title = 'Hello'
  @world = 'world'
  erb :index
end


post '/from_labName' do
  @title = 'View member'
  @member= NewTable.where(:lab_name => params[:lab_name])
  erb :lab_search
end

post '/from_memberName' do
  @title = 'View member'
  lab_num =NewTable.find_by(:member_name=>params[:member_name])
  @member= NewTable.where(:lab_id => lab_num.lab_id)
  .where.not(:member_name =>params[:member_name] )
  erb :member_search
end
