require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができる場合' do
      it 'item_name、item_description、item_category_id、item_status_id、shipping_cost_id、prefecture_id、days_to_ship_id、item_price、user、imageが存在すると出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない場合' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと出品できない' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_descriptionが空だと出品できない' do
        @item.item_description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'item_category_idが1だと出品できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category must be other than 1")
      end
      it 'item_status_idが1だと出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 1")
      end
      it 'shipping_cost_idが1だと出品できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
      end
      it 'prefecture_idが1だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'days_to_ship_idが1だと出品できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
      end
      it 'item_priceが空だと出品できない' do
        @item.item_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_priceが300~9999999の範囲外だと出品できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is invalid")
      end
      it 'item_priceが全角だと出品できない' do
        @item.item_price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is invalid")
      end
      it 'item_priceが英字だと出品できない' do
        @item.item_price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is invalid")
      end
    end
  end
end
