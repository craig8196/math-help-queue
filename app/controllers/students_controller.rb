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
    @my_courses = get_my_courses
    @all_courses = Course.all
    render "add_course"
  end

  def add_course
    @new_course_id = params[:course]
    @user.courses << Course.find(params[:course])
    @user.save
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
    _list_requests = get_request_list
    @my_request_index = _list_requests.rindex(@user.username) + 1
    render "get_help"
  end
  
  def get_help
    if has_request?
      flash[:notice] = "You can only have one active request"
      # redirect_to(:controller => "students", :action => "refresh_page")
      refresh_page
    else
      new_chapter = params[:chapter]
      new_problem = params[:problem]
      @request = @user.requests.create(:active => true, :chapter => new_chapter, :problem => new_problem)
      @all_requests = Request.all.where(active: true).count
      @my_request_index = @all_requests
    end
  end

  def create_request
    if has_request?
      flash[:notice] = "You can only have one active request"
      redirect_to(:controller => "students", :action => "refresh_page")
    else
      @user = User.find(session[:user_id])
      render "create_request"
    end
  end

  def get_my_courses
    all_my_courses = []
    for c in Course.all(:joins => :users, :conditions => {:users => {:id => @user.id}})
      all_my_courses << (c.discipline + " " + c.number.to_s)
    end
    return all_my_courses
  end

  def get_request_list
    active_requests = []
    for r in Request.all.where(active: true)
      _user = User.find(r.user_id)
      active_requests << _user.username
    end
    return active_requests
  end

  def has_request?
    for r in Request.all.where(active: true)
      if @user.id == r.user_id
        return true
      end
    end
    return false
  end

end
