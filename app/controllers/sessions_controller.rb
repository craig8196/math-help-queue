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
    highest_privilege = @user.privileges.order(id: :asc).first.id
    
    if highest_privilege == 3 		#3=student
      render "home"
    elsif highest_privilege == 2 	#2=ta
      render "ta_home"
    else 							#1=admin
      render "admin_home"
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
  
  def edit_user_permissions()
    @all_users = User.all
    render "edit_user_permissions"
  end
  
  def edit_admin
    render :test => "edit_admin called"
    user_id = params['user_id']
    user = User.find(user_id)
    # TODO check if user already has privilege, if so, get rid of it. otherwise, add it.
    privilege = Privilege.find(1)
    privilege.users << user
    user.privileges << privilege
    render json: { user_id: user_id, privilege: 1 }
  end
  
  def edit_ta
    user_id = params['user_id']
	user = User.find(user_id)
    # TODO check if user already has privilege, if so, get rid of it. otherwise, add it.
    privilege = Privilege.find(2)
    privilege.users << user
    user.privileges << privilege
    render json: { user_id: user_id, privilege: 2 }
  end
  
  def edit_student
    user_id = params['user_id']
	user = User.find(user_id)
    # TODO check if user already has privilege, if so, get rid of it. otherwise, add it.
    privilege = Privilege.find(3)
    privilege.users << user
    user.privileges << privilege
    render json: { user_id: user_id, privilege: 3 }
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
