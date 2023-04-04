FactoryBot.define do
  factory :wallet do
    balance { SecureRandom.random_number }
  end
end
