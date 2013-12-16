class TasController < ApplicationController
  def ta_home
  	@user = User.find(session[:user_id])
  	@names = get_request_list
  	render "ta_home"
  end

  def help_next_student
  	#TODO: get real data about next request
  	@next_request = Request.where(active: true).take
  	@next_student = User.find(@next_request.user_id)
  	@next_chapter = "16.2" #@next_request.chapter
  	@next_problem = "15" #@next_request.next_problem
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
