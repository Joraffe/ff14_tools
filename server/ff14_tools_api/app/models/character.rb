class Character < ApplicationRecord
  has_many :gear_set
  belongs_to :static

  validates :name, :static, :gear_set, presence: true
end
