class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: %i[sign_up sign_in]

  def sign_up
    render_resource AuthService::SignUp.call(sign_up_params)
  end

  def sign_in
    render_resource AuthService::SignIn.call(sign_in_params) 
  end

  def sign_out
    AuthService::SignOut.call(current_user, sign_out_params)
    render_resource_nil
  end

  def sign_up_params
    params.require(%i[name email password])
    params.permit(:name, :email, :password)
  end

  def sign_out_params
    params.require(:device_token)
    params.permit(:device_token)
  end

  def sign_in_params
    params.require(%i[email password device_token])
    params.permit(:email, :password, :device_token)
  end
end