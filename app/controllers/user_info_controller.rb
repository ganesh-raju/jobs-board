class UserInfoController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
  	role = params["user_info"]["user_role"]
  	user = current_user.update_attributes(user_role: role)
  	redirect_to jobs_path
  end

end
