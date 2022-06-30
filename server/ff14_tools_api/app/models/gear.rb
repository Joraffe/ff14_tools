class Gear < ApplicationRecord
  belongs_to :gear_slot

  validates :name, :ilvl, :gear_slot, presence: true
end
