class Item < ApplicationRecord
  with_options presence: true do
    validates :images
    validates :item_name
    validates :item_description
    validates :item_price, numericality:  { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid" }
    with_options numericality: { other_than: 1, message: "is not selected" } do
      validates :item_category_id
      validates :item_status_id
      validates :shipping_cost_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
  end

  belongs_to :user
  has_one :purchase
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship

end