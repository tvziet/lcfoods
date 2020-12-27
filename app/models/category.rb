require 'babosa'
class Category < ApplicationRecord
  # validates :name, presence: true, length: { in: 3..100 }
  has_many :regulations
  belongs_to :group
  delegate :name, to: :group, prefix: :group, allow_nil: true
  extend FriendlyId
  friendly_id :name, use: :slugged
  def normalize_friendly_id(input)
    input.to_slug.normalize(transliterations: :vietnamese).to_s
  end
end
