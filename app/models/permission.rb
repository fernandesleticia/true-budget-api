class Permission < ApplicationRecord
  ACTIONS = [
    "add_card",
    "remove_card"
  ].freeze
end
