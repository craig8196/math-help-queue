class StudentsController < ApplicationController
  def add_course_button
    redirect_to(:action => :display_courses)
  end

  def display_courses
    @all_courses = Course.all
    render "add_course"
  end

  def add_course
    @new_course_id = params[:course]
    #TODO: actually add the course
    render "course_added"
  end
  
  def get_help
    @user = User.find(session[:user_id])
    @request = @user.requests.create(:active => true)
    @all_requests = Request.all.where(active: true).count
  end

  def create_request
    render "create_request"
  end

end
