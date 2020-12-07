require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
    sleep(0.5)
  end
  
  context '配送先の住所情報が保存できる' do
    it 'post_code、prefecture_id、city、address、phone_number、tokenが存在すれば保存できる' do
      expect(@purchase_address).to be_valid
    end
    it 'buildingが空でも保存できる' do
      @purchase_address.building = ""
      expect(@purchase_address).to be_valid
    end
  end

  context '配送先の住所情報が保存できない' do
    it 'post_codeが空だと保存できない' do
      @purchase_address.post_code = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeにハイフンがないと保存できない' do
      @purchase_address.post_code = "1111111"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code is invalid")
    end
    it 'post_codeが数字でないと保存できない' do
      @purchase_address.post_code = "aaa-aaaa"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code is invalid")
    end
    it 'prefecture_idが1だと保存できない' do
      @purchase_address.prefecture_id = "1"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture is not selected")
    end
    it 'cityが空だと保存できない' do
      @purchase_address.city = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できない' do
      @purchase_address.address = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できない' do
      @purchase_address.phone_number = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが数字でないと保存できない' do
      @purchase_address.phone_number = "aaaaaaaaaaa"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが11桁以上だと保存できない' do
      @purchase_address.phone_number = "090123456789"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'tokenが存在しないと保存できない' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが存在しないと保存できない' do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが存在しないと保存できない' do
      @purchase_address.item_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end