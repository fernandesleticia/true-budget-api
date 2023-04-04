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
  
  def self.serialize(resources)
    resources.map do |resource|
      ATTRIBUTES.map do |field|
        [field, resource.send(field)]
      end.to_h
    end
  end
end
