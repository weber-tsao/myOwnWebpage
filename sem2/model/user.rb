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
  
  def Users.displayName(db)
    db = SQLite3::Database.new 'username_1.sqlite'
    query = "SELECT name FROM bookList"
    booknameList = db.execute query
    
    bookname = Array.new(booknameList.length)
    (0...booknameList.length).each do |i|
      bookname[i] = booknameList[i][0]
    end
    return bookname
  end
  
  def Users.search(db, name)
    db = SQLite3::Database.new 'username_1.sqlite'
    query = 'SELECT category FROM bookList WHERE name LIKE "%" || ? || "%"'
    bookcategory = db.execute query, name
    if bookcategory.length > 0
      return bookcategory[0][0]
    else
      return 0
    end
  end
  
end