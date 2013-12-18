class StudentsController < ApplicationController

  before_filter :auto_authenticate_user
  before_filter :get_user

  def get_user
     @user = User.find(session[:user_id])
  end

  def add_course_button
    redirect_to(:action => :display_courses)
  end

  def display_courses
    @all_courses = Course.all
    render "add_course"
  end

  def add_course
    @new_course_id = params[:course]
    @user.courses << Course.find(params[:course])
    @user.save
    #TODO: actually add the course
    render "course_added"
  end
  
  def cancel_help
    @user = User.find(session[:user_id])
    @request = @user.requests.last
	@request.destroy
	@is_admin = User.is_admin(@user)
	@is_ta = User.is_ta(@user)
	render "sessions/home"
  end
  
  def refresh_page
    @all_requests = Request.all.where(active: true).count
    render "get_help"
  end
  
  def get_help
    new_chapter = params[:chapter]
    new_problem = params[:problem]
    #TODO: add chapter and problem to db
    @request = @user.requests.create(:active => true)
  end

  def create_request
    @user = User.find(session[:user_id])
    render "create_request"
  end

end
