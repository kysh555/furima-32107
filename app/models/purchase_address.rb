class PurchaseAddress 
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message:'is invalid' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'is not selected' }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true }, format: { with: /\A\d{,11}\z/, message: 'is invalid' }
  end

  def save
    Purchase.create(item_id: item_id, user_id: user_id)
    ShipToAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number)
  end

end