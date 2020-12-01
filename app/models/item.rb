class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_description
    validates :item_price, format: { with: /[3-9][\d]{2,}|[1-9][\d]{3,6}/ }
    with_options numericality: { other_than: 1 } do
      validates :item_category_id
      validates :item_status_id
      validates :shipping_cost_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
  end

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship

end