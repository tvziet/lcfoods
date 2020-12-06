require 'babosa'
class Document < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  serialize :attachment, JSON
  validates :title, presence: true, length: { in: 3..100 }
  validates :attachment, presence: true
  scope :search_by_title, lambda { |query|
    where('lower(title) LIKE ?', "%#{query}%")
  }
  extend FriendlyId
  friendly_id :title, use: :slugged
  def normalize_friendly_id(input)
    input.to_slug.normalize(transliterations: :vietnamese).to_s
  end
end
