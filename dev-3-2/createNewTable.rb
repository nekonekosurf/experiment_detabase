#coding: utf-8
require 'active_record'
ActiveRecord::Base.establish_connection(
	"adapter" => "sqlite3",
	"database" => "./sandbox.db"
)

ActiveRecord::Migration.create_table :accounts do |t|
	t.text :user_name
	t.text :message
end
