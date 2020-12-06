require 'babosa'
class News < ApplicationRecord
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  validates :title, presence: true, length: { in: 3..100 }
  validates :body, presence: true
  enum status: { normal: 0, notable: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
  def normalize_friendly_id(input)
    input.to_slug.normalize(transliterations: :vietnamese).to_s
  end
  scope :search_by_title, lambda { |query|
    where('lower(title) LIKE ?', "%#{query}%")
  }
end
