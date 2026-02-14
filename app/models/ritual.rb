class Ritual < ApplicationRecord
  belongs_to :cult
  belongs_to :location
  has_many :ritual_steps, dependent: :destroy, inverse_of: :ritual
  has_many :chants, dependent: :destroy, inverse_of: :ritual

  has_many :ritual_offerings, dependent: :destroy, inverse_of: :ritual
  has_many :offerings, through: :ritual_offerings

  has_many :ritual_artifacts, dependent: :destroy, inverse_of: :ritual
  has_many :artifacts, through: :ritual_artifacts

  accepts_nested_attributes_for :chants, allow_destroy: true
  accepts_nested_attributes_for :ritual_steps, allow_destroy: true
  accepts_nested_attributes_for :ritual_offerings, allow_destroy: true
  accepts_nested_attributes_for :ritual_artifacts, allow_destroy: true
end
