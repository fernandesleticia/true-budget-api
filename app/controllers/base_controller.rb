class BaseController < ActionController::Base
  before_action :authenticate_request

  class UnauthorizedRequestError < StandarError; end

  private

  def authenticate_request
    raise UnauthorizedRequestError, I18n.t("authorization.token_not_present") unless authorization_token.present?
  end

  def current_user

  end

  def decoded_user
    JsonWebToken.decode(authorization_token)
  end

  def authorization_token
    request.headers["Authorization"]
  end
end
