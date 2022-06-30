class Boss < ApplicationRecord
  has_many :boss_loot
  belongs_to :raid

  validates :name, :raid, :boss_loot, presence: true
end
