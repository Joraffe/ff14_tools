class Static < ApplicationRecord
  has_many :character
  belongs_to :user

  validates :name, :character, presence: true
end
