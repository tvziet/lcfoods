class Carousel < ApplicationRecord
  has_one_attached :image
  enum status: { unactive: 0, active: 1 }
  scope :active?, -> { where status: true }
end
