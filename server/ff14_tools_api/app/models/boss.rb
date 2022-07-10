class Boss < ApplicationRecord
  belongs_to :raid

  validates :name, :raid, :boss_loot, presence: true
end
