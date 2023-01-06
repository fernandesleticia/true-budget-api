FactoryBot.define do
  factory :auth_token do
    jwt_token { SecureRandom.base58(24) }
    expiration_time { 1.hour.from_now.to_i }
  end
end
