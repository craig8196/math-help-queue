class SessionsController < ApplicationController
  
  before_filter :auto_authenticate_user, :only => [:home, :profile, :setting]
  before_filter :restore_login_state, :only => [:login, :login_attempt]
  
  def login
  end

  def login_attempt
    authorized_user = User.authenticate(params.require(:username))
    
    if authorized_user
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      session[:user_id] = authorized_user.id
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end
  end

  def home
    render :text => session[:user_id]
  end

  def profile
  end

  def setting
  end
  
  private
end
