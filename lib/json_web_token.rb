# frozen_string_literal: true

class JsonWebToken
  class << self
    def encode(payload)
      payload[:exp] = token_expiration_time
      JWT.encode(payload, private_key, "RS256")
    end
  
    def decode(token)
      data = JWT.decode(token, public_key, true, { algorithm: "RS256" }).first
      HashWithIndifferentAccess.new data
    end
  
    def token_expiration_time
      Rails.application.config_for(:authentication).token_expiration_time.seconds.from_now.to_i
    end
  
    def private_key
      OpenSSL::PKey::RSA.new(Base64.decode64(Rails.application.config_for(:authentication).private_key))
    end
  
    def public_key
      OpenSSL::PKey::RSA.new(Base64.decode64(Rails.application.config_for(:authentication).public_key))
    end
  end
end
