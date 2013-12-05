class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
    
    def auto_authenticate_user
      if session[:user_id]
        @authenticated_user = User.find(session[:user_id])
        return true
      else
        redirect_to(:controller => "sessions", :action => "login")
        return false
      end
    end
    
    def restore_login_state
      if session[:user_id]
        redirect_to(:controller => "sessions", :action => "home")
        return true
      else
        return false
      end
    end
end
