class Group < ApplicationRecord
  validates_uniqueness_of :name
  validates :name, presence: true

  ATTRIBUTES = %w[
    name
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
