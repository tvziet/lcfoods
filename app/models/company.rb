require 'babosa'
class Company < ApplicationRecord
  validates :name, presence: true, length: { in: 3..30 }
  has_many :groups
  has_many :users, through: :groups
  has_many :regulations
  has_many :notifications
  extend FriendlyId
  friendly_id :name, use: :slugged
  def normalize_friendly_id(input)
    input.to_slug.normalize(transliterations: :vietnamese).to_s
  end
end
