require 'babosa'
class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 3..30 }
  has_many :regulations
  extend FriendlyId
  friendly_id :name, use: :slugged
  def normalize_friendly_id(input)
    input.to_slug.normalize(transliterations: :vietnamese).to_s
  end
end
