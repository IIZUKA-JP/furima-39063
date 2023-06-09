class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
 
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :nickname, presence: true
  validates :birth_day, presence: true
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  validates :family_name, format: {with: 	/\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
 
  has_many :purchaser_records
  has_many :items
end
