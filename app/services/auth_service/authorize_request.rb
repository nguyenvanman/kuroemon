module AuthService
  class AuthorizeRequest
    def initialize(headers = {}, params = {})
      @headers = headers
      @params = params
    end

    def call
      decoded_auth_token
    end

    private

    attr_reader :headers
    attr_reader :params

    def decoded_auth_token
      JsonWebToken.decode(http_auth_header)
      rescue JWT::ExpiredSignature => e
      rescue JWT::ImmatureSignature => e
      raise(
        ExceptionHandler::InvalidToken,
        ("#{Message.invalid_token} #{e.message}")
      )
    end

    def http_auth_header
      if headers['Authorization'].present?
        return headers['Authorization'].split(' ').last
      elsif params[:token].present?
        return params[:token].split(' ').last
      end
        raise(ExceptionHandler::MissingToken, Message.missing_token)
    end
  end
end
