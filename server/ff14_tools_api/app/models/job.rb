class Job < ApplicationRecord
  belongs_to :role

  validates :name, :role, presence: true
end
