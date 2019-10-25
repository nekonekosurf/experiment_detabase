require 'sqlite3'
db= SQLite3::Database.new("sandbox.db")

db.execute("DROP TABLE new_tables")

#make new table (new_tables) which is joined lab_members and labs with id.
db.execute("CREATE TABLE new_tables
            AS
            SELECT *
            FROM lab_members
            INNER JOIN labs
            ON labs.id = lab_members.lab_id")

lab_name = gets.chomp
db.execute("SELECT member_name
            FROM new_tables
            WHERE lab_name = ?",[lab_name]) do |row|
            puts row.join(",")
end

db.close
