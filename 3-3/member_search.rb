require 'sqlite3'
db= SQLite3::Database.new("sandbox.db")

db.execute("DROP TABLE new_tables")

#make new table (new_tables) which is joined lab_members and labs with id
db.execute("CREATE TABLE new_tables
            AS
            SELECT *
            FROM lab_members
            INNER JOIN labs
            ON labs.id = lab_members.lab_id")

name = gets.chomp
lab_num =db.execute("SELECT lab_id
            FROM new_tables
            WHERE member_name =?",[name])

db.execute("SELECT member_name
          FROM new_tables
          WHERE lab_id = ?
          AND  member_name!= ?",[lab_num],[name]) do |row|
          puts row.join(",")
<<<<<<< HEAD

=======
>>>>>>> 2c43d5ae2834973e1842a683f804c2096b6d099c
end


db.close
