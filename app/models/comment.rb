class Comment < ApplicationRecord
  belongs_to :health
  validates :content, presence: true
end
