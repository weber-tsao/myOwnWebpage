require 'sinatra'
require_relative 'model/user.rb'
set :bind, '0.0.0.0' 

db = SQLite3::Database.new 'username_1.sqlite'

get "/login" do 
       erb :login
end

post "/login" do 
     @username = params[:usernameinput]
     @password = params[:passwordinput]
     @user_exist = Users.check db, @username, @password
  
     if @user_exist
     redirect "/mainPage"
     else 
     redirect "/login"
     end
end

get "/mainPage" do
       @bookname = Users.displayName db
       @searchinput = params[:searchinput]
       @searchresult = Users.search db, @searchinput
 
       if @searchresult == 0
         @searching = ""
       else @searchresult != 0
         @searching = @searchresult
       end
       erb :mainPage
end

get "/register" do 
  erb :register
end

post "/register" do 
     @username = params[:usernameinput]
     @password = params[:passwordinput]
     @email = params[:emailinput]
     
     if @username != "" && @password != "" && @email != ""
       Users.create db, @username, @email, @password 
       return redirect "/register"
     else 
       puts "create error"
     end
end

