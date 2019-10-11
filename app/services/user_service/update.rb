module UserService::Update
  def self.call(user, user_params)
    user.update_attributes!(user_params)
    {
      user: UserSerializer.new(user)
    }
  end
end