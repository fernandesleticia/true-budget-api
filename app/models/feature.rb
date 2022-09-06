class Feature < ApplicationRecord
  FEATURES = %w[
    add_card
  ]

  validates :feature_name, inclusion: { in: FEATURES },
                           uniqueness: true,
                           presence: true

  scope :activated, -> { where activated: true }

  def self.on?(feature_name)
    return unless feature?(feature_name)

    find_by_feature_name(feature_name)&.activated
  end

  def self.enable(feature_name)
    return unless feature?(feature_name)

    feature = find_or_create_by(feature_name: feature_name)
    feature.update(activated: true) if feature
  end

  def self.disable(feature_name)
    return unless feature?(feature_name)

    feature = find_by_feature_name(feature_name)
    feature.update(activated: false) if feature
  end

  private

  def feature?(feature_name)
    FEATURES.include?(feature_name)
  end
end
