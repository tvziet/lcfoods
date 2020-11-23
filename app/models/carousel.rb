class Carousel < ApplicationRecord
  mount_uploader :image, ImageUploader
  serialize :image, JSON
  enum status: { unactive: 0, active: 1 }
end
