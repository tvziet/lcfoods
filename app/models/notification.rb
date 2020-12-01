class Notification < ApplicationRecord
  has_rich_text :body
  mount_uploaders :attachments, AttachmentUploader
  serialize :attachments, JSON
  belongs_to :category
  belongs_to :company
  delegate :name, to: :category
  delegate :name, to: :company, prefix: :company
  enum status: { normal: 0, notable: 1 }
end
