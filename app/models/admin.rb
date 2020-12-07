class Admin < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable
  validates :full_name, presence: true, length: { in: 3..30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
