require 'net/ldap'

class SessionsController < ApplicationController
  
  before_filter :auto_authenticate_user, :except => [:login, :login_attempt]
  before_filter :restore_login_state, :only => [:login, :login_attempt]
  
  # Controller for the login page.
  def login
  end

  # Handles login attempts.
  # Successful login leads to the home page.
  # Unsucessful login is redirected back to the login page with an error message.
  def login_attempt
    
    
    username = params.require(:username)
    password = params[:password]
    #valid_user = authenticate_user(username, password)
    valid_user = true
    
    if valid_user
      flash[:notice] = ""
      authorized_user = User.get_validated_user(username)
    
      if authorized_user
        # Protects from fixed sessions attacks.
        reset_session()
        # Set session variable and redirect to home.
        session[:user_id] = authorized_user.id
        update_expires_at()
        redirect_to(:action => :home)
      else # Change to send back a server error?
        flash[:notice] = "Error finding your account. Contact your system administrator for more details."
        render "login"
      end
    else
      flash[:notice] = "Invalid Username or Password"
      render "login"
    end
  end
  
  def logout
    delete_session()
    redirect_to(:action => :login)
  end
  
  def change_perspective
    @user = User.find(session[:user_id])
    @highest_privilege = User.get_highest_privilege_type(@user)
    render "sessions/change_perspective"
  end
  
  def admin_perspective
    @user = User.find(session[:user_id])
    @highest_privilege = User.get_highest_privilege_type(@user)
	@is_ta = User.is_ta(@user)
    render "admin/admin_home"
  end
  
  def ta_perspective
    @user = User.find(session[:user_id])
    @highest_privilege = User.get_highest_privilege_type(@user)
    @names = get_request_list
	@is_admin = User.is_admin(@user)
    render "tas/ta_home"
  end
  
  def student_perspective
    @user = User.find(session[:user_id])
    @highest_privilege = User.get_highest_privilege_type(@user)
	@is_ta = User.is_ta(@user)
	@is_admin = User.is_admin(@user)
    render "sessions/home"
  end

  def home
    @user = User.find(session[:user_id])
	@is_ta = User.is_ta(@user)
	@is_admin = User.is_admin(@user)
    @highest_privilege = User.get_highest_privilege_type(@user)
    
    if @highest_privilege == :admin
      render "admin/admin_home"
    elsif @highest_privilege == :ta
      @names = get_request_list
      render "tas/ta_home"
    else
      render "home"
    end
  end
  
  require 'net/ldap'

  private
  
    def get_request_list
      active_requests = []
      for r in Request.all.where(active: true)
         _user = User.find(r.user_id)
         active_requests << _user.username
      end
      return active_requests
    end
  
    # Uses BYU's LDAP server to authenticate users.
    # => true if the user is valid; false otherwise
    def authenticate_user(username, password)
      # Prevents guest account access.
      if password == ""
        return false
      end
    
      if username && password
        host = "ldap.byu.edu"
        port = 636
        ldap = Net::LDAP.new({:port => port, :host => host, :encryption => :simple_tls})
        ldap.auth("uid=#{username}, ou=People, o=BYU.edu", password)
        return ldap.bind
      else
        return false
      end
    end
end
