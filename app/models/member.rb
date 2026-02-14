class Member < ApplicationRecord
  belongs_to :cult

  validates :name, presence: true
  validates :role, inclusion: { in: %w[leader priest follower] }
end
