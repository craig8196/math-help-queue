class AdminController < ApplicationController

  def admin_home
	@user = User.find(session[:user_id])
    render "admin_home"
  end
  
  def edit_user_privileges
    @all_users = User.all.order(username: :asc)
    render "edit_user_privileges"
  end
  
  def add_new_class
    render "add_new_class"
  end
  
  def edit_admin
    user = User.find(params['user_id'])
    
    # checks if user already has privilege, if so, gets rid of it. otherwise, adds it.
    if user.privileges.exists?(1)
      user.privileges.delete(1)
    else
      user.privileges << Privilege.find(1)
    end
  end
  
  def edit_ta
    user = User.find(params['user_id'])
    
	# checks if user already has privilege, if so, gets rid of it. otherwise, adds it.
    if user.privileges.exists?(2)
      user.privileges.delete(2)
    else
      user.privileges << Privilege.find(2)
    end
  end
  
  def edit_student
    user = User.find(params['user_id'])
    
	# checks if user already has privilege, if so, gets rid of it. otherwise, adds it.
    if user.privileges.exists?(3)
      user.privileges.delete(3)
    else
      user.privileges << Privilege.find(3)
    end
  end
end
