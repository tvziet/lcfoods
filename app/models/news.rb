class News < ApplicationRecord
  validates :title, presence: true, length: { in: 3..50 }
  validates :body, presence: true
  enum status: { unactive: 0, active: 1 }
end
