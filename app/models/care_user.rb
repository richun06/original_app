class CareUser < ApplicationRecord
  enum sex: { 男:0, 女:1}
  enum availability: { あり:0, なし:1}
  # enum division: { L宿泊:0, S宿泊:1, 通所:2, 訪問:3, その他:4}

  scope :name_search, -> (name) { where("name LIKE ?", "%#{name}%") if name.present? }
  scope :sex_search, -> (sex) { where(sex: sex) if sex.present? }
  scope :availability_search, -> (availability) { where(availability: availability) if availability.present? }
  scope :division_search, -> (division) { where(division: division) if division.present? }

  with_options presence: true do
    validates :name
    validates :birthday
    validates :sex
    validates :food, length: { maximum: 255 }
    validates :allergy, length: { maximum: 255 }
    validates :sick, length: { maximum: 255 }
    validates :note, length: { maximum: 255 }
  end

  has_many :healths, dependent: :destroy
  belongs_to :user

  mount_uploader :image, ImageUploader
end
