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

flag=0

get '/' do
  # session[:ongoing]='login page'
  @title = 'login page'
  if flag==0
    @comment='ログイン画面'
  else
    @comment='ログインできませんでした'
  end
  erb :index
end

post '/board' do
  if !Account.where(:user_id=> params[:user_id], :password=>params[:password]).empty?
    @title = 'View user'
    @user_id=params[:user_id]
    @board=BulletinBoard.all.order("id DESC")
    session[:user_id] = params[:user_id]
    erb :login
  else
    # session[:failed]='login failed'
    # @comment=session[:failed]
    flag =1
    redirect '/'
  end
end

nowTime = DateTime.now
post '/update' do
  BulletinBoard.create(:user_id=>session[:user_id],:message=>params[:message],:taimu=>nowTime)
  @board=BulletinBoard.all.order("id DESC")
  @user_id=session[:user_id]
  erb :login
end
