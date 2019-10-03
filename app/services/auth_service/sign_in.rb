module AuthService::SignIn
  def self.call(sign_in_params)
    user = User.find_by!(email: sign_in_params[:email])
    if user.authenticate(sign_in_params[:password])
      user.update_device_tokens(sign_in_params[:device_token])
      {
        user: UserSerializer.new(user),
        access_token: AuthService::JsonWebToken.encode({ id: user.id, email: user.email }),
        expired_at: Rails.application.secrets.expier_hour.hours.from_now
      }
    else
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
  end
end