require 'babosa'
class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 2..30 }
  has_many :users
  has_many :categories
  has_many :regulations
  extend FriendlyId
  friendly_id :name, use: :slugged

  def normalize_friendly_id(input)
    input.to_slug.normalize(transliterations: :vietnamese).to_s
  end

  scope :search_by_name, lambda { |query|
    where('lower(name) LIKE ?', "%#{query}%")
  }
end