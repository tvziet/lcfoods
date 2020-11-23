class Regulation < ApplicationRecord
  mount_uploaders :attachments, AttachmentUploader
  serialize :attachments, JSON
  belongs_to :category
  belongs_to :company
  delegate :name, to: :category
  enum status: { unactive: 0, active: 1 }
end
