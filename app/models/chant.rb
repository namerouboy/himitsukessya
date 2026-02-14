class Chant < ApplicationRecord
  belongs_to :ritual

  validates :content, presence: true

end
