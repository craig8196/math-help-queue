class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
    
    # Checks the user's session for a valid user id and whether or not their session has expired.
    # => true if the user is logged in; false otherwise
    def auto_authenticate_user()
      if session[:user_id]
        @authenticated_user = User.find(session[:user_id])
        if not session_expired?
          update_expires_at()
        else
          flash[:notice] = "Session expired."
          delete_session()
          redirect_to(:controller => "sessions", :action => "login")
        end
        return true
      else
        redirect_to(:controller => "sessions", :action => "login")
        return false
      end
    end
    
    # Redirects the user if already logged in.
    def restore_login_state()
      if session[:user_id]
        redirect_to(:controller => "sessions", :action => "home")
        return true
      else
        return false
      end
    end
    
    # Deletes a user's session data.
    def delete_session()
      session[:user_id] = nil
      session[:expires_at] = nil
    end
    
    # Timeout is in seconds.
    SESSION_TIMEOUT = 60*10
    
    # Checks if the user's session has expired.
    # => true if expired; false otherwise
    def session_expired?()
      if (Time.now <=> session[:expires_at]) > 0
        return true
      else
        return false
      end
    end
    
    # Updates the timestamp of when the user's session expires.
    def update_expires_at()
      session[:expires_at] = Time.now + SESSION_TIMEOUT
    end
end
