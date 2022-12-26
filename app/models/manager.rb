class Manager < ApplicationRecord
  has_many :supervises, dependent: :destroy
  has_many :healths, through: :supervises
  belongs_to :user
end
