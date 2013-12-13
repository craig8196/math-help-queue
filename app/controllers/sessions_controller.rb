require 'net/ldap'

class SessionsController < ApplicationController
  
  before_filter :auto_authenticate_user, :only => [:home, :profile, :setting]
  before_filter :restore_login_state, :only => [:login, :login_attempt]
  
  def login
  end

  def login_attempt
    username = params.require(:username)
    password = params[:password]
    #valid_user = authenticate_user(username, password)
    valid_user = true
    
    if valid_user
      flash[:notice] = ""
      authorized_user = User.get_authorized_user(username)
    
      if authorized_user
        session[:user_id] = authorized_user.id
        redirect_to(:action => :home)
      else # this needs to be changed to send back a server error
        flash[:notice] = "Error finding your account. Contact your system administrators for more details."
        render "login"
      end
    else
      flash[:notice] = "Invalid Username or Password"
      render "login"
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to(:action => :login)
  end

  def home
    @user = User.find(session[:user_id])
    highest_privilege = @user.privileges.order(id: :asc).first.privilege_type
    
    if highest_privilege == "student"    
      render "home"
    else
      render :text => highest_privilege
    end
  end

  def profile
  end

  def settings
  end
  
  def add_course_button
	redirect_to(:action => :add_course)
  end

  def add_course
    @all_courses = Course.all
    render "add_course"
  end
  
  def get_help
    @user = User.find(session[:user_id])
    @request = @user.requests.create(:active => true)
  end
  
  require 'net/ldap'

  private
  
    def authenticate_user(username, password)
      #prevents guest account access
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
