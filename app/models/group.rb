class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 3..30 }
  belongs_to :company
  has_many :users
end