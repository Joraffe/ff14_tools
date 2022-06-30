class Role < ApplicationRecord
  has_many :gear_set

  validates :name, :gear_set, presence: true
end
