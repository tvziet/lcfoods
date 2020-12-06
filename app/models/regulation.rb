require 'babosa'
class Regulation < ApplicationRecord
  mount_uploaders :attachments, AttachmentUploader
  serialize :attachments, JSON
  validates :title, presence: true, length: { in: 10..100 }
  validates :status, presence: true
  belongs_to :category
  belongs_to :company
  delegate :name, to: :category, prefix: :category
  delegate :name, to: :company, prefix: :company
  extend FriendlyId
  friendly_id :title, use: :slugged
  def normalize_friendly_id(input)
    input.to_slug.normalize(transliterations: :vietnamese).to_s
  end
  enum status: { normal: 0, notable: 1 }
  scope :search_by_title, lambda { |query|
    where('lower(title) LIKE ?', "%#{query}%")
  }
end
