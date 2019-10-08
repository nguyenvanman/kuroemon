module AuthService::SignOut 
  def self.call(user, sign_out_params)
    user.remove_device_token(sign_out_params[:device_token])
  end
end