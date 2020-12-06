require 'babosa'
class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 2..30 }
  belongs_to :company
  delegate :name, to: :company, prefix: :company
  has_many :users
  extend FriendlyId
  friendly_id :name, use: :slugged

  def normalize_friendly_id(input)
    input.to_slug.normalize(transliterations: :vietnamese).to_s
  end
end