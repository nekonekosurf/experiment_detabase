#coding: utf-8
require 'active_record'
ActiveRecord::Base.establish_connection(
	"adapter" => "sqlite3",
	"database" => "./ARLesson.db"
)

class Student_Record < ActiveRecord::Base
end


p Student_Record.all
Student_Record.find_by(:student_id => 3).destroy
puts
puts 
p Student_Record.all
