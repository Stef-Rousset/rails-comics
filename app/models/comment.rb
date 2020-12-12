class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :content, presence: true
  scope :newest_first, -> { order(created_at: :desc).limit(5) }
end
