class Comment < ApplicationRecord
  belongs_to :health
  belongs_to :user
  validates :content, presence: true
end
