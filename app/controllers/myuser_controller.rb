class MyuserController < ApplicationController

 def show
   @user = current_user
   @rooms = current_user.rooms.all

 end

end
