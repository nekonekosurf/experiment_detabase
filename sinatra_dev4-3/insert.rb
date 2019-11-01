
require 'active_record'
require 'date'



ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './sandbox.db'
)

class BulletinBoard < ActiveRecord::Base
end

nowTime = DateTime.now

BulletinBoard.create(:user_id=>"osaka",:message=>"kisiwada",:taimu=>nowTime)
