class BaseController < ActionController::Base
  before_action :authorize_request

  class UnauthorizedRequestError < StandardError; end

  rescue_from UnauthorizedRequestError do |e|
    render error_response(e.message, status: :unauthorized)
  end

  private

  def authorize_request
    raise UnauthorizedRequestError, I18n.t("authorization.token_not_present") unless authorization_token.present?
  
    authenticate_jwt
  end

  def authenticate_jwt
    return unless !auth_token || auth_token.expired?

    raise UnauthorizedRequestError, I18n.t("authorization.user_unauthorized")
  end

  def auth_token
    AuthToken.find_by(jwt_token: authorization_token)
  end

  def user_id
    JsonWebToken.decode(authorization_token)["user_id"]
  end

  def authorization_token
    request.headers["Authorization"]
  end

  def error_response(error_message, status: :bad_request)
    errors = Array(error_message)
    { json: { errors: errors }, status: status }
  end
end
