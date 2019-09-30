module AuthService::SignUp
  def self.call(sign_up_params)
    {
      user: UserSerializer.new(User.create!(sign_up_params))
    }
  end
end