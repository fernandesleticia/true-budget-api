class Category < ApplicationRecord
  belongs_to :group

  ATTRIBUTES = %w[
    name
    group_id
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
