class UsersController < ApplicationController
  def update
    render_resource UserService::Update.call(@current_user, user_params)
  end
  
  def user_params
    params.permit(:image_url, :gender, :birthday, :phone)
  end
end