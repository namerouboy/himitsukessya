class Location < ApplicationRecord
  has_many :rituals

  validates :name, presence: true
end
