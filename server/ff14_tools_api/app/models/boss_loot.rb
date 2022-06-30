class BossLoot < ApplicationRecord
  belongs_to :boss
  belongs_to :loot

  validates :boss, :loot, presence: true
end
