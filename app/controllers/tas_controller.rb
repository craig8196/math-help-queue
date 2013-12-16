class TasController < ApplicationController
  def ta_home
  	@user = User.find(session[:user_id])
  	@names = get_request_list
  	render "ta_home"
  end

  def help_next_student
  	@next_student = Request.first.where(active: true)
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
