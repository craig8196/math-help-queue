class StudentsController < ApplicationController
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

end
