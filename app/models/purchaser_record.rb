class PurchaserRecord < ApplicationRecord
  
  has_one :delivery_address
  belongs_to :item
  belongs_to :user

end
