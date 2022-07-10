class Loot < ApplicationRecord
  validates :name, :boss_loot, presence: true
end
