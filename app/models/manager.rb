class Manager < ApplicationRecord
  has_many :supervises, dependent: :destroy
  has_many :healths, through: :supervises
end
