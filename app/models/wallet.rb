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

  def self.serialize(items)
    items.map do |item|
      ATTRIBUTES.map do |field|
        [field, item.send(field)]
      end.to_h
    end
  end
end
