require 'babosa'
class Notification < ApplicationRecord
  # Upload file for notification
  mount_uploaders :attachments, AttachmentUploader
  serialize :attachments, JSON

  # URL Friendly
  extend FriendlyId
  friendly_id :title, use: :slugged
  def normalize_friendly_id(input)
    input.to_slug.normalize(transliterations: :vietnamese).to_s
  end

  # Validations
  validates :title, presence: true, length: { in: 10..100 }
  validates :status, presence: true

  # Associations
  belongs_to :category
  belongs_to :company

  # Delegate name for company, category
  delegate :name, to: :category
  delegate :name, to: :company, prefix: :company

  enum status: { normal: 0, notable: 1 }

  scope :search_by_title, lambda { |query|
    where('lower(title) LIKE ?', "%#{query}%")
  }
end
