FactoryBot.define do
  factory :auth_token do
    jwt_token { "a token" }
    expiration_time { 1234567 }
  end
end
