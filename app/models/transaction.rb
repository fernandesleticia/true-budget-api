class Transaction < ApplicationRecord
  belongs_to :category

  ATTRIBUTES = %w[
    description
    amount
    transaction_date
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
