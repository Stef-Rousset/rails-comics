class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, -> { order(created_at: :desc) }, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :content, presence: true

  scope :popular, -> { order(views: :desc).first(3) }

  include PgSearch::Model
  pg_search_scope :search_by_title_and_content,
    against: [ :title, :content ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
