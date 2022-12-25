class Health < ApplicationRecord
  belongs_to :care_user
  has_many :comments, dependent: :destroy
  has_many :supervises, dependent: :destroy
  has_many :managers, through: :supervises

  # enum breakfast: { 'ー':0, '全量':1, '半量':2, '1/3':3, '2/3':4, '1/4':5, '欠食':6, 'その他':7}, _prefix: true
  # enum lunch: { 'ー':0, '全量':1, '半量':2, '1/3':3, '2/3':4, '1/4':5, '欠食':6, 'その他':7}, _prefix: true
  # enum snack: { 'ー':0, '全量':1, '半量':2, '1/3':3, '2/3':4, '1/4':5, '欠食':6, 'その他':7}, _prefix: true
  # enum dinner: { 'ー':0, '全量':1, '半量':2, '1/3':3, '2/3':4, '1/4':5, '欠食':6, 'その他':7}, _prefix: true
  # enum before_sleep: { 'ー':0, '全量':1, '半量':2, '1/3':3, '2/3':4, '1/4':5, '欠食':6, 'その他':7}, _prefix: true
  # enum morning_medicine: { 'ー':0, '◯':1, '中止':2, 'その他':3}, _prefix: true
  # enum daytime_medicine: { 'ー':0, '◯':1, '中止':2, 'その他':3}, _prefix: true
  # enum snack_medicine: { 'ー':0, '◯':1, '中止':2, 'その他':3}, _prefix: true
  # enum evening_medicine: { 'ー':0, '◯':1, '中止':2, 'その他':3}, _prefix: true
  # enum sleep_medicine: { 'ー':0, '◯':1, '中止':2, 'その他':3}, _prefix: true

  # enum bath_division: { 'ー':0, '全身浴':1, 'シャワー浴':2, '足浴':3, '機械浴':4, 'その他':5}, _prefix: true

  validates :record_in_at, presence: true
end
