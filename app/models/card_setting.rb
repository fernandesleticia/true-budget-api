class CardSetting < ApplicationRecord
  belongs_to :user_preference
  has_many :cards
end
