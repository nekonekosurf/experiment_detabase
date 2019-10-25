#coding: utf-8
require 'active_record'
ActiveRecord::Base.establish_connection(
	"adapter" => "sqlite3",
	"database" => "./ARLesson.db"
)


class Student_record < ActiveRecord::Base
end

Student_record.create(:student_id => 1, :klass=>"情報理工学実験", :score=>90, :grade=>"不可")

Student_record.create(:student_id => 2, :klass=>"情報理工学実験", :score=>70, :grade=>"良")

Student_record.create(:student_id => 3, :klass=>"情報理工学実験", :score=>100, :grade=>"良")




puts 
p Student_record.all


puts 
p Student_record.order("score DESC").first

puts 
p Student_record.find_by(:klass => '情報理工学実験', :student_id => 1)

puts 
p Student_record.where(:grade =>'良')





