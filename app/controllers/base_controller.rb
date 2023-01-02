class BaseController < ActionController::Base
  before_action :authorize_request

  class UnauthorizedRequestError < StandardError; end

  private

  def authorize_request
    raise UnauthorizedRequestError, I18n.t("authorization.token_not_present") unless authorization_token.present?
  
    authenticate_jwt
  end

  def authenticate_jwt
    return unless auth_token.expired?

    raise UnauthorizedRequestError, I18n.t("authorization.expired")
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
end
