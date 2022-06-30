class GearSet < ApplicationRecord
  has_many :gear_slot
  belongs_to :character
  belongs_to :role

  validates :role, :character, :gear_slot, presence: true
end
