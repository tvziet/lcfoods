class Notification < ApplicationRecord
  mount_uploaders :attachments, AttachmentUploader
  serialize :attachments, JSON
  belongs_to :category
  belongs_to :company
  delegate :name, to: :category
  delegate :name, to: :company, prefix: :company
  enum status: { normal: 0, notable: 1 }
  scope :search_notification, lambda { |search|
    where('lower(title) LIKE ?', "%#{search}%")
  }
end
