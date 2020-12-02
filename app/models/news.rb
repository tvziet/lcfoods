class News < ApplicationRecord
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  has_rich_text :body
  validates :title, presence: true, length: { in: 3..100 }
  validates :body, presence: true
  enum status: { normal: 0, notable: 1 }
end
