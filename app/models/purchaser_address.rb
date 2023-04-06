class PurchaserAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :tel, :user_id, :item_id, :token

  validates :post_code, :city, :address, :tel, :user_id, :item_id, :prefecture_id, :token, presence: true
  validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :tel,numericality: { only_integer: true}
  validates :tel,length: { minimum: 10, maximum: 11 }

  def save
    purchaser_record = PurchaserRecord.create(item_id: item_id, user_id: user_id)

    DeliveryAddress.create(
      purchaser_record_id: purchaser_record.id, 
      post_code: post_code,
      prefecture_id: prefecture_id, 
      city: city, address: address, 
      building: building, 
      tel: tel, 
      )
  end
end