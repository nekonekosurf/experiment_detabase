require 'sinatra'
require 'active_record'
require 'date'
enable :sessions


ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'sandbox.db'
)

class Account < ActiveRecord::Base
end

class BulletinBoard < ActiveRecord::Base
end



get '/' do
  @title = 'login page'
  @user = Account.where(:user_id=>"neko")
  erb :index

end



post '/board' do
  if !Account.where(:user_id=> params[:user_id], :password=>params[:password]).empty?
    @title = 'View user'
    @user_id=params[:user_id]
    @board=BulletinBoard.all.order("id DESC")
    global_user_id = params[:user_id]
    erb :login
  else
    redirect '/'
  end
end
#user_iわたせない
#

nowTime = DateTime.now
post '/update' do
  BulletinBoard.create(:user_id=>params[:user_id],:message=>params[:message],:taimu=>nowTime)#.order("id DESC").first
  @board=BulletinBoard.all.order("id DESC").first

  erb :login

end
