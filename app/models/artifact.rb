class Artifact < ApplicationRecord
  has_many :ritual_artifacts, dependent: :destroy
  has_many :rituals, through: :ritual_artifacts

  validates :name, presence: true
end
