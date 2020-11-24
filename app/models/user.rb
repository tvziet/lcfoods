class User < ApplicationRecord
  mount_uploader :avatar, ImageUploader
  serialize :avatar, JSON
  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  validates :birthday, :cell_phone, :address, :avatar, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  belongs_to :company
  belongs_to :group
  delegate :name, to: :group, prefix: :group
  delegate :name, to: :company, prefix: :company

  def full_name
    first_name + ' ' + last_name
  end
end
