FactoryBot.define do
  factory :category do
    name { SecureRandom.hex }
    group
  end
end
  