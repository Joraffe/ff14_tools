class GearSet < ApplicationRecord
  belongs_to :character
  belongs_to :role

  validates :role, :character, :gear_slot, presence: true
end
