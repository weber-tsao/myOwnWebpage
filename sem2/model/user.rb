require 'sqlite3'

module Users
  def Users.check(db, name, password)
    db = SQLite3::Database.new 'username_1.sqlite'
    query = "SELECT userId FROM UsersInfo WHERE name = ? "
    userId = db.execute query, name
    if userId.length > 0
      id = userId[0][0]
      query = "SELECT password FROM UsersInfo WHERE userid = ? "
      passwords = db.execute query, id
      if passwords[0][0] == password
        return true
      else 
        return false
      end
    end  
  end
  
  def Users.create(db, name, email, password)
     db = SQLite3::Database.new 'username_1.sqlite'
     query = "INSERT INTO UsersInfo (name, email, password)
              VALUES (?, ?, ?)"
        result = db.execute query, name, email, password
  end
  
  

end