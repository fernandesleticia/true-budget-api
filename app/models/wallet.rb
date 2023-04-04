class Wallet < ApplicationRecord
  belongs_to :user

  ATTRIBUTES = %w[
    balance
  ]

  def to_hash
    ATTRIBUTES.map do |field|
      [field, send(field)]
    end.to_h
  end

  def self.serialize(resources)
    resources.map do |resource|
      ATTRIBUTES.map do |field|
        [field, resource.send(field)]
      end.to_h
    end
  end
end
