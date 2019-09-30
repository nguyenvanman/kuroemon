class AuthenticationController < ApplicationController
  def sign_up
    render_resource AuthService::SignUp.call(sign_up_params)
  end

  def sign_in
    render_resource AuthService::SignIn.call(sign_in_params) 
  end

  def sign_up_params
    params.require(%i[name email password])
    params.permit(:name, :email, :password)
  end

  def sign_in_params
    params.require(%i[email password])
    params.permit(:email, :password)
  end
end