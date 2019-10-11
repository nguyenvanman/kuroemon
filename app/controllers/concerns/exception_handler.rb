module ExceptionHandler
  include Errors
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    rescue_from ExceptionHandler::MissingToken, with: :unauthorized_request
    rescue_from ExceptionHandler::InvalidToken, with: :unauthorized_request
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    
    rescue_from ArgumentError, with: :argument_error
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :four_zero_four
    rescue_from Errors::Runtime::StandarError,
      Errors::Runtime::ActionFailed,
      Errors::Runtime::ServiceFailed,
      with: :render_runtime_error_response
  end

  private
   # JSON response with message; Status code 400 - bad request
  def render_runtime_error_response(error, status: :bad_request)
    render json: error.to_hash, status: status
  end

  # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_request(error, status: :unauthorized)
    render json: Errors::Unauthorized.new(error, :unauthorized_user).to_hash, status: status
  end

  # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_not_admin_request(error, status: :unauthorized)
    render json: Errors::Unauthorized.new(error, :unauthorized_not_admin).to_hash, status: status
  end

  # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_not_super_admin_request(error, status: :unauthorized)
    render json: Errors::Unauthorized.new(error, :unauthorized_not_super_admin).to_hash, status: status
  end

  # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_conpany_request(error, status: :unauthorized)
    render json: Errors::Unauthorized.new(error, :unauthorized_company).to_hash, status: status
  end

  # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_login_wisami_request(error, status: :unauthorized)
    render json: Errors::Unauthorized.new(error, :unauthorized_login_wisami).to_hash, status: status
  end

  # JSON response with message; Status code 404 - not found
  def four_zero_four(error, status: :not_found)
    render json: Errors::ActiveRecordNotFound.new(error).to_hash, status: status
  end

  # JSON response with message; Status code 422 - unprocessable entity
  def four_twenty_two(error, status: :unprocessable_entity)
    render json: Errors::UnprocessableEntity.new(error).to_hash, status: status
  end

  # JSON response with message; Status code 422 - error active record validation
  def render_unprocessable_entity_response(error, status: :unprocessable_entity)
    render json: Errors::ActiveRecordValidation.new(error.record).to_hash, status: status
  end

  def argument_error(error, status: :unprocessable_entity)
    render json: Errors::ArgumentError.new(error).to_hash, status: status
  end

  def parameter_missing(error, status: :bad_request)
    render json: Errors::ParameterMissing.new(error).to_hash, status: status
  end
end