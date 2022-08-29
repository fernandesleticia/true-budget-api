class User < ApplicationRecord

  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  has_many :permissions

  def permit?(action)
    permissions.where(action: action).present?
  end
end
