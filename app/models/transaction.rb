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

  def self.serialize(resources)
    resources.map do |resource|
      ATTRIBUTES.map do |field|
        [field, resource.send(field)]
      end.to_h
    end
  end
end
