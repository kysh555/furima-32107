class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :ship_to_address
end
