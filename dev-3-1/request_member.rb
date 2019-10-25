require 'cgi'
require 'sqlite3'

cgi= CGI.new
db= SQLite3::Database.new("sandbox.db")

cgi.out("type" => "text/html",
	"charset" => "UTF-8") do

	lab_name= cgi["lab_name"].chomp

	html= "<html><body>\n"
  db.execute("DROP TABLE new_tables")
  #make new table (new_tables) which is joined lab_members and labs with id
  db.execute("CREATE TABLE new_tables
              AS
              SELECT *
              FROM lab_members
              INNER JOIN labs
              ON labs.id = lab_members.lab_id")

  db.execute("SELECT member_name
              FROM new_tables
              WHERE lab_name = ?",[lab_name]) do |row|
          		html = html+"<p>#{row}  </p>"
  end

  db.close
	html
end
