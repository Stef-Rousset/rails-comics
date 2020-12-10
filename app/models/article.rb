class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :content, presence: true
end
