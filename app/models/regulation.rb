class Regulation < ApplicationRecord
  has_rich_text :body
  mount_uploaders :attachments, AttachmentUploader
  serialize :attachments, JSON
  validates :title, presence: true, length: { in: 10..100 }
  validates :status, presence: true
  belongs_to :category
  belongs_to :company
  delegate :name, to: :category, prefix: :category
  delegate :name, to: :company, prefix: :company
  enum status: { normal: 0, notable: 1 }

  def self.search(search)
    if search
      Regulation.where("title LIKE '%#{search}%'")
    else
      Regulation.all
    end
  end
end
