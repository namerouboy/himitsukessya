class Offering < ApplicationRecord
  has_many :ritual_offerings, dependent: :destroy
  has_many :rituals, through: :ritual_offerings

  validates :name, presence: true
  validates :dangerous_level, presence: true
end
