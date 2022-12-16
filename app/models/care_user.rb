class CareUser < ApplicationRecord
  enum sex: { 男:0, 女:1}
  enum availability: { あり:0, なし:1}
  # enum division: { L宿泊:0, S宿泊:1, 通所:2, 訪問:3, その他:4}

  scope :name_search, -> (name) { where("name LIKE ?", "%#{name}%") if name.present? }
  scope :sex_search, -> (sex) { where(sex: sex) if sex.present? }
  scope :availability_search, -> (availability) { where(availability: availability) if availability.present? }
  scope :division_search, -> (division) { where(division: division) if division.present? }

  has_many :healths, dependent: :destroy
  belongs_to :user

  mount_uploader :image, ImageUploader
end
