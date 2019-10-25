#coding: utf-8
require 'active_record'
ActiveRecord::Base.establish_connection(
	"adapter" => "sqlite3",
	"database" => "./ARLesson.db"
)






class Student_Record < ActiveRecord::Base
end


puts 
p Student_Record.all

student_1 = Student_Record.find_by(:student_id => 1)

student_1.update(:grade => '秀')

puts

puts

puts 
p Student_Record.all
