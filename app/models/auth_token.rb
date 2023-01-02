class AuthToken < ApplicationRecord

  def expired?
    Time.at(expiration_time) < Time.now
  end
end
