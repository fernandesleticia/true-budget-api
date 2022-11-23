class JsonWebToken
  def self.encode(payload)
    payload[:exp] = token_expires_in
    JWT.encode(payload, secret_key, "RS256")
  end

  def self.decode(token)
    data = JWT.decode(token, secret_key, true, { algorithm: "RS256" })[0]
    HashWithIndifferentAccess.new data
  end

  private

  def token_expires_in
    1.minute.from_now
  end

  def secret_key
    'secret key'
  end
end
