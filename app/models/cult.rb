class Cult < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :rituals, dependent: :destroy

  validates :name, presence: true
end
