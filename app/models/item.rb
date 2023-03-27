class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to:category
  belongs_to:condition
  belongs_to:delivery_charge
  belongs_to:delivery_day
  belongs_to:prefecture

 # has_one :purchaser_record
 belongs_to :user
 has_one_attached :image

 validates :product_name, :price, :explanation, :user, :image, presence: true
 validates :category_id, numericality: { other_than: 1 } 
 validates :condition_id, numericality: { other_than: 1 } 
 validates :delivery_charge_id, numericality: { other_than: 1 } 
 validates :delivery_day_id, numericality: { other_than: 1 }
 validates :prefecture_id, numericality: { other_than: 1 } 
 validates :price, format: { with: /\A[0-9]+\z/}
 validates :price,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, }


end

