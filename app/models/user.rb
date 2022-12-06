class User < ApplicationRecord  
  has_many :permissions

  def permit?(action)
    permissions.where(action: action).present?
  end
end
