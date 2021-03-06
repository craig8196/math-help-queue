class TasController < ApplicationController

  before_filter :auto_authenticate_user
  before_filter :verify_permission

  def verify_permission
  	@user = User.find(session[:user_id])
  	@highest_privilege = User::get_highest_privilege_type(@user)
  	if User::compare_privilege(@highest_privilege, :ta) < 0
  		render "sessions/home"
  	end
  end

  def ta_home
  	@user = User.find(session[:user_id])
  	@names = get_request_list
    @is_admin = User.is_admin(@user)
  	render "ta_home"
  end

  def help_next_student
  	#TODO: get real data about next request
  	@next_request = Request.where(active: true).take
  	@next_student = User.find(@next_request.user_id)
  	@next_chapter = @next_request.chapter
  	@next_problem = @next_request.problem
  	Request.update(@next_request.id, :active => false)
  	render "helping_student"
  end

  def get_request_list
    active_requests = []
    for r in Request.all.where(active: true)
      _user = User.find(r.user_id)
      active_requests << _user.username
    end
    return active_requests
  end
end
