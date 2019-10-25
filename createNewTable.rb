#coding: utf-8
require 'active_record'
ActiveRecord::Base.establish_connection(
	"adapter" => "sqlite3",
	"database" => "./ARLesson.db"
)

ActiveRecord::Migration.create_table :student_records do |t|
	t.integer :student_id
	t.text :klass
	t.integer :score
	t.text :grade
end


