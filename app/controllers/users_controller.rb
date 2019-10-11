class UsersController < ApplicationController
  def update
    render_resource UserService::Update.call(@current_user, user_params)
  end

  def show 
    render_resource({ user: UserSerializer.new(@current_user) })
  end
  
  private 

  def user_params
    params.permit(:image_url, :gender, :birthday, :phone)
  end
end