class UserPreference < ApplicationRecord
  belongs_to :user
  has_many :card_settings, dependent: :destroy

  validates :user, presence: true, uniqueness: true
end
