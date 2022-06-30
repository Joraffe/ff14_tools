class GearSlot < ApplicationRecord
  has_one :gear
  belongs_to :gear_set

  validates :slot, :gear, :gear_set, presence: true
end
