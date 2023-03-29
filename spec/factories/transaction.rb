FactoryBot.define do
  factory :transaction do
    description { SecureRandom.hex(10) }
    amount { SecureRandom.random_number }
    transaction_date { 1.minute.ago }
    category
  end
end
