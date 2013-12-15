class AdminController < ApplicationController

  def edit_user_permissions_button
    redirect_to(:action => :edit_user_permissions)
  end
  
  def edit_user_permissions
    @all_users = User.all
  end
end
