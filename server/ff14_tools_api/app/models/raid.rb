class Raid < ApplicationRecord
  has_many :boss

  validates :name, :boss, presence: true
end
