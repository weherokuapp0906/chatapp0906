class ApplicationController < ActionController::Base
before_action :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?


def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me])
  devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :login, :email, :password, :remember_me])
  devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password, :profile])
end


layout :layout_by_resource

 protected

 def layout_by_resource
   if devise_controller?
     "signin"
   else
     "application"
   end
 end



end
