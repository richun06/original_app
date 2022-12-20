class Reserve < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, length: { maximum: 255 }
end
