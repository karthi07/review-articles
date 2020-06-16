class Review < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { in: 1..180 }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
