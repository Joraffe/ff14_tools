class Loot < ApplicationRecord
  has_many: boss_loot

  validates :name, :boss_loot, presence: true
end
