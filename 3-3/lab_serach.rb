#coding: utf-8
require 'active_record'
ActiveRecord::Base.establish_connection(
	"adapter" => "sqlite3",
	"database" => "./sandbox.db"
)

class Lab < ActiveRecord::Base
end

name = gets.chomp

selected =  Lab.find_by(:lab_name => name)

p selected.name


