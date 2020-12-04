class PurchaseAddress 
  include ActiveModel::Model
  attr_accessor :item_id, :use_id, :post_code, :prefecture_id, :city, :addrss, :building, :phone_number

  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :addrss
    validates :phone_number
  end

  def save
    item = Item.find(params[:id])
    user = item.user
    Purchase.create(item_id: item.id, user_id: user.id)
    ShipToAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, addrss: addrss, building: building, phone_number: phone_number)
  end

end