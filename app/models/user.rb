class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      user.admin = false
      user.phone_number = "09011111111"
      user.postcode = 1111111
    end
  end

  def self.guest_admin
    find_or_create_by!(email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト管理者"
      user.admin = true
      user.phone_number = "09011111111"
      user.postcode = 1111111

    end
  end

  # def self.guest_facility
  #   find_or_create_by!(email: 'facility_guest@example.com') do |user|
  #     user.password = SecureRandom.urlsafe_base64
  #     user.name = "ゲスト施設"
  #     user.admin = false
  #     user.owner_id = 2
  #     user.phone_number = "09011111111"
  #     user.postcode = 1111111
  #   end
  # end


  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  # has_many :care_users. optional :true
  has_many :care_users
  has_many :reserves

  VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
  validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }

  VALID_POST_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/
  validates :postcode, format: { with: VALID_POST_CODE_REGEX }

  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 6 }
end
