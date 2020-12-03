class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  validates :full_name, presence: true, length: { in: 3..30 }
end
