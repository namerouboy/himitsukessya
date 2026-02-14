class RitualStep < ApplicationRecord
  belongs_to :ritual

  acts_as_list scope: :ritual

  validates :position, presence: true
  validates :description, presence: true
end
