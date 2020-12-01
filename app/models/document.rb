class Document < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  serialize :attachment, JSON
  validates :title, presence: true, length: { in: 10..100 }
  validates :attachment, presence: true
end
