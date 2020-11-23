class Company < ApplicationRecord
  validates :name, presence: true, length: { in: 3..30 }
  has_many :groups
  has_many :users, through: :groups
  has_many :regulations
  has_many :notifications
end
