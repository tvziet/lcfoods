require 'babosa'
class Notification < ApplicationRecord
  mount_uploaders :attachments, AttachmentUploader
  serialize :attachments, JSON
  belongs_to :category
  belongs_to :company
  delegate :name, to: :category
  delegate :name, to: :company, prefix: :company
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
