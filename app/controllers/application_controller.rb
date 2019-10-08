class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :authorize_request
  
  def authorize_request
    @decoded = AuthService::AuthorizeRequest.new(request.headers, params).call
  end

  def current_user
    User.find(@decoded.dig(:id)) if @decoded.present?
  end
end
