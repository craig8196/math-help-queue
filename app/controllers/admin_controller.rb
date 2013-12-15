class AdminController < ApplicationController

  def admin_home
	@user = User.find(session[:user_id])
    render "admin_home"
  end
  
  def edit_user_privileges
    @all_users = User.all.order(username: :asc)
    render "edit_user_privileges"
  end
  
  def add_new_course
    @all_courses = Course.all.order(title: :asc)
    render "add_new_course"
  end
  
  def submit_new_course
    course = params[:new_course]
    if course
      title = course[:new_title]
      level = course[:new_level]
      discipline = course[:new_discipline]
      if title and level and discipline
        new_course = Course.create({:title => title, :number => level, :discipline => discipline})
      end
    end
    @all_courses = Course.all.order(title: :asc)
    render "add_new_course"
  end
  
  def delete_course
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
