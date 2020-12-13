require 'babosa'
class User < ApplicationRecord
  # Upload avatar with ActiveStorage
  has_one_attached :avatar

  # URL Friendly
  extend FriendlyId
  friendly_id :get_full_name, use: :slugged

  def normalize_friendly_id(input)
    input.to_slug.normalize(transliterations: :vietnamese).to_s
  end

  # Get full name of user
  has_person_name
  def get_full_name
    first_name + ' ' + last_name
  end

  # Validations
  validates :first_name, :last_name, length: { maximum: 50 }
  validates :first_name, :last_name,
            :birthday, :cell_phone,
            :address, :avatar, :employee_number, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  # Associations
  belongs_to :group

  # Delegate name for group
  delegate :name, to: :group, prefix: :group, allow_nil: true

  scope :search_by_full_name, lambda { |query|
    where("CONCAT_WS(' ', first_name, last_name) LIKE ?", "%#{query}%")
  }

  scope :search_by_employee_number, lambda { |query|
    where('lower(employee_number) LIKE ?', "%#{query}%")
  }

  scope :search_by_email, lambda { |query|
    where('lower(email) LIKE ?', "%#{query}%")
  }

  scope :search_by_cell_phone, lambda { |query|
    where('lower(cell_phone) LIKE ?', "%#{query}%")
  }

  scope :search_by_birthday, lambda { |query|
    where('lower(birthday) LIKE ?', "%#{query}%")
  }
end
