class JsonWebToken
  def self.encode(payload)
    payload[:exp] = token_expiration_time
    JWT.encode(payload, secret_key, "RS256")
  end

  def self.decode(token)
    data = JWT.decode(token, secret_key, true, { algorithm: "RS256" })[0]
    HashWithIndifferentAccess.new data
  end

  private

  def token_expiration_time
    Rails.application.config_for(:authentication).token_expiration_time.seconds.from_now.to_i
  end

  def secret_key
    OpenSSL::PKey::RSA.new(Rails.application.config_for(:authentication).secret)
  end
end
