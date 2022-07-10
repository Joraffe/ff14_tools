class Character < ApplicationRecord
  belongs_to :static

  validates :name, :static, :gear_set, presence: true
end
