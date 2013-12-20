class AdminController < ApplicationController

  before_filter :auto_authenticate_user
  before_filter :verify_permission

  def verify_permission
    @user = User.find(session[:user_id])
    @highest_privilege = User.get_highest_privilege_type(@user)
    if User::PRIVILEGES[@highest_privilege] < User::PRIVILEGES[:admin]
      render "sessions/home"
    end
  end

  def admin_home
    @user = User.find(session[:user_id])
    @is_ta = User.is_ta(@user)
    render "admin_home"
  end
  
  def manage_courses
    @all_courses = Course.all.order(title: :asc)
    render "manage_courses"
  end
  
  def add_course
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
    render "manage_courses"
  end
  
  def delete_course
    course = params[:c]
    if course
      Course.delete(course[:cid])
    end
    @all_courses = Course.all.order(title: :asc)
    render "manage_courses"
  end
  
  def edit_user_privileges
    @all_users = User.all.order(username: :asc)
    render "edit_user_privileges"
  end
  
  def edit_admin
    user = User.find(params['user_id'])
    
    logger.debug "A"*100
    
    # Sets the admin privilege for the user.
    if user
      if user.admin?
        user.privilege_type = "student"
      else
        user.privilege_type = "admin"
      end
      user.save
    end
  end
  
  def edit_ta
    user = User.find(params['user_id'])
    logger.debug "T"*100
    # Sets the ta privilege for the user.
    if user
      if user.ta?
        user.privilege_type = "student"
      else
        user.privilege_type = "ta"
      end
      user.save
    end
  end
  
  def edit_student
    user = User.find(params['user_id'])
    logger.debug "S"*100
    # Sets the student privilege for the user.
    if user
      user.privilege_type = "student"
      user.save
    end
  end
end
