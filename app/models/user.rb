class User < ApplicationRecord
  has_one_attached :avatar
  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  validates :birthday, :cell_phone, :address, :avatar, :employee_number, presence: true
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

  # scope :search_user, lambda { |search|
  #   where('lower(first_name) LIKE ?', "%#{search}%").or(where('lower(last_name) LIKE ?', "%#{search}%")).or(where('lower(employee_number) LIKE ?', "%#{search}%"))
  # }
end
